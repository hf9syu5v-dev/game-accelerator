#!/usr/bin/env python3
from __future__ import annotations
import argparse, ctypes, hashlib, json, os, shutil, subprocess, tempfile, zipfile
from pathlib import Path, PurePosixPath
import plistlib

EXPECTED_SHA256 = "979b20840a8ac437562ed793f020ceef5f1a4c8740354ceb154cdbf8bde36c90"
MODEL = "LITEON I T LCS-128L9S"
SERIAL = "000000123ADC"
DISK_BYTES = 128035676160
ESP_GUID = "c12a7328-f81f-11d2-ba4b-00a0c93ec93b"
BACKUP = "EFI-PREVIOUS-DEBUG-FIRMWARE-INPUT-AUDIT"
STAGE = "EFI-DEBUG-FIRMWARE-INPUT-AUDIT-STAGING"
FAILED = "EFI-DEBUG-FIRMWARE-INPUT-AUDIT-FAILED"
DEBUG_HASHES = {
    "BOOT/BOOTx64.efi": "535ee1cfda9f1e22ad4e3f2e4a9a38eeaf0a63451a2e8b52ae3c585886718d41",
    "OC/OpenCore.efi": "c995b4ef9f4924d11995953f0f273f3ad035d3836316d5ab77e887bb2d5d813a",
    "OC/Drivers/OpenRuntime.efi": "f64c887d3bdef3f6bf48b34b7ebe51af3523ffccfbb900649e1773d36498fd5b",
}

def sha256(p: Path) -> str:
    h=hashlib.sha256()
    with p.open("rb") as f:
        for b in iter(lambda:f.read(1024*1024),b""): h.update(b)
    return h.hexdigest()

def target_info() -> dict:
    ps=r"""
$ErrorActionPreference='Stop'
$p=Get-Partition -DriveLetter F
$d=Get-Disk -Number $p.DiskNumber
$l=Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='F:'"
[pscustomobject]@{FriendlyName=$d.FriendlyName;SerialNumber=([string]$d.SerialNumber).Trim();BusType=[string]$d.BusType;Size=[int64]$d.Size;IsBoot=[bool]$d.IsBoot;IsSystem=[bool]$d.IsSystem;PartitionStyle=[string]$d.PartitionStyle;GptType=([string]$p.GptType).Trim('{}').ToLowerInvariant();FileSystem=[string]$l.FileSystem}|ConvertTo-Json -Compress
"""
    x=subprocess.run(["powershell.exe","-NoProfile","-NonInteractive","-ExecutionPolicy","Bypass","-Command",ps],check=True,capture_output=True,text=True)
    return json.loads(x.stdout.strip().splitlines()[-1])

def safe_extract(z: Path, dest: Path) -> Path:
    dest.mkdir(parents=True,exist_ok=False)
    root=dest.resolve()
    with zipfile.ZipFile(z) as a:
        for i in a.infolist():
            n=PurePosixPath(i.filename)
            if n.is_absolute() or ".." in n.parts or not n.parts:
                raise RuntimeError("Unsafe ZIP member: "+i.filename)
            mode=(i.external_attr>>16)&0xffff
            if mode and (mode&0o170000)==0o120000:
                raise RuntimeError("ZIP symlink rejected: "+i.filename)
            q=(root/Path(*n.parts)).resolve()
            if q!=root and root not in q.parents:
                raise RuntimeError("ZIP path traversal rejected")
        a.extractall(root)
    configs=list(root.glob("**/EFI/OC/config.plist"))
    if len(configs)!=1:
        raise RuntimeError("Expected exactly one EFI/OC/config.plist; found "+str(len(configs)))
    return configs[0].parents[1]

def verify_efi(efi: Path) -> int:
    required=["BOOT/BOOTx64.efi","OC/OpenCore.efi","OC/config.plist","OC/Drivers/OpenRuntime.efi","OC/Drivers/HfsPlus.efi"]
    for rel in required:
        if not (efi/rel).is_file():
            raise RuntimeError("Required EFI file missing: "+rel)
    for rel,expected in DEBUG_HASHES.items():
        actual=sha256(efi/rel)
        if actual!=expected:
            raise RuntimeError("Official DEBUG binary SHA256 mismatch: "+rel+" "+actual)
    c=plistlib.loads((efi/"OC/config.plist").read_bytes())
    u=c["UEFI"]
    if u["Input"].get("KeySupport") is not True or u["Input"].get("KeySupportMode")!="Auto":
        raise RuntimeError("Expected KeySupport=true and KeySupportMode=Auto")
    if u["AppleInput"].get("AppleEvent")!="Auto" or u["AppleInput"].get("GraphicsInputMirroring") is not True:
        raise RuntimeError("AppleInput diagnostic settings mismatch")
    if c["Misc"]["Debug"].get("Target")!=65 or c["Misc"]["Debug"].get("DisplayLevel")!=2147483714:
        raise RuntimeError("OpenCore DEBUG file logging settings mismatch")
    if c["Misc"]["Security"].get("HaltLevel")!=2147483648:
        raise RuntimeError("OpenCore HaltLevel mismatch")
    if any(d.get("Path")=="OpenUsbKbDxe.efi" and d.get("Enabled") for d in u["Drivers"]):
        raise RuntimeError("OpenUsbKbDxe must not be enabled in this KeySupport diagnostic")
    if any(d.get("Path")=="Ps2KeyboardDxe.efi" and d.get("Enabled") for d in u["Drivers"]):
        raise RuntimeError("PS/2 driver conflict")
    for d in u["Drivers"]:
        if d.get("Enabled") and not (efi/"OC/Drivers"/d["Path"]).is_file():
            raise RuntimeError("Missing enabled driver: "+d["Path"])
    for a in c["ACPI"]["Add"]:
        if a.get("Enabled") and not (efi/"OC/ACPI"/a["Path"]).is_file():
            raise RuntimeError("Missing enabled ACPI: "+a["Path"])
    for k in c["Kernel"]["Add"]:
        if k.get("Enabled") and not (efi/"OC/Kexts"/k["BundlePath"]).exists():
            raise RuntimeError("Missing enabled kext: "+k["BundlePath"])
    return sum(1 for p in efi.rglob("*") if p.is_file())

def deploy(archive: Path) -> None:
    if os.name!="nt" or not ctypes.windll.shell32.IsUserAnAdmin():
        raise RuntimeError("Run elevated PowerShell on Windows")
    if not archive.is_file():
        raise RuntimeError("Artifact ZIP not found: "+str(archive))
    actual=sha256(archive)
    if actual!=EXPECTED_SHA256:
        raise RuntimeError("Artifact SHA256 mismatch: "+actual)
    print("ARTIFACT_SHA256=PASS")
    info=target_info()
    ok=(info.get("FriendlyName")==MODEL and info.get("SerialNumber")==SERIAL and info.get("BusType")=="USB"
        and abs(int(info.get("Size",0))-DISK_BYTES)<=2*1024*1024 and info.get("IsBoot") is False
        and info.get("IsSystem") is False and info.get("PartitionStyle")=="GPT"
        and info.get("GptType")==ESP_GUID and info.get("FileSystem")=="FAT32")
    if not ok:
        raise RuntimeError("SAFETY STOP: F: is not the authorized USB ESP: "+repr(info))
    root=Path("F:\\")
    for rel in ["com.apple.recovery.boot/BaseSystem.dmg","com.apple.recovery.boot/BaseSystem.chunklist","EFI/BOOT/BOOTx64.efi","EFI/OC/config.plist"]:
        if not (root/rel).is_file():
            raise RuntimeError("Safety prerequisite missing: "+rel)
    for name in [BACKUP,STAGE,FAILED]:
        if (root/name).exists():
            raise RuntimeError("Safety stop: F:\\"+name+" already exists")
    print("TARGET_IDENTITY=PASS; authorized USB ESP only")
    print("RECOVERY_FILES=PASS; unchanged")
    with tempfile.TemporaryDirectory(prefix="B460M-OC105-DEBUG-INPUT-") as td:
        extracted=safe_extract(archive,Path(td)/"extract")
        count=verify_efi(extracted)
        stage=root/STAGE
        stage.mkdir()
        for src in extracted.rglob("*"):
            if src.is_file():
                rel=src.relative_to(extracted); dst=stage/rel
                dst.parent.mkdir(parents=True,exist_ok=True); shutil.copy2(src,dst)
                if sha256(src)!=sha256(dst):
                    raise RuntimeError("Staging SHA256 mismatch: "+str(rel))
        print("STAGING_SHA256=PASS; FILES="+str(count))
        current=root/"EFI"; backup=root/BACKUP
        current.rename(backup)
        try:
            stage.rename(current)
            for src in extracted.rglob("*"):
                if src.is_file():
                    dst=current/src.relative_to(extracted)
                    if not dst.is_file() or sha256(src)!=sha256(dst):
                        raise RuntimeError("Active EFI readback mismatch: "+str(src))
        except Exception:
            if current.exists() and not (root/FAILED).exists():
                current.rename(root/FAILED)
            if backup.exists() and not current.exists():
                backup.rename(current)
            raise
    print("DEBUG_FIRMWARE_INPUT_AUDIT_DEPLOYMENT_SUCCESS")
    print("ACTIVE_EFI=F:\\EFI")
    print("PREVIOUS_EFI_PRESERVED=F:\\"+BACKUP)
    print("ONLY_F_EFI_REPLACED; RECOVERY_PAYLOAD_AND_INTERNAL_DISKS_UNTOUCHED")

if __name__=="__main__":
    p=argparse.ArgumentParser()
    p.add_argument("--artifact",default=str(Path.home()/"Downloads"/"B460M-OpenCore-1.0.5-DEBUG-Firmware-Input-Audit.zip"))
    a=p.parse_args()
    deploy(Path(a.artifact).expanduser().resolve())

#!/usr/bin/env python3
# B460M native firmware keyboard diagnostic EFI deployer.
from __future__ import annotations
import argparse, ctypes, hashlib, json, os, shutil, subprocess, sys, tempfile, urllib.request, zipfile
from pathlib import Path, PurePosixPath

ARTIFACT_URL = "https://github.com/hf9syu5v-dev/game-accelerator/releases/download/b460m-native-firmware-keyboard-diagnostic/B460M-Native-Firmware-Keyboard-Diagnostic-EFI.zip"
ARTIFACT_SHA256 = "67a76fb1e632903f0203b5b2c9231d4742cf814b227f30b237c1868836b2052e"
DRIVE = "F:"
MODEL = "LITEON I T LCS-128L9S"
SERIAL = "000000123ADC"
DISK_BYTES = 128035676160
ESP_GUID = "c12a7328-f81f-11d2-ba4b-00a0c93ec93b"
KNOWN_GOOD_VESA = "EFI-PREVIOUS-RX570-VESA-DIAGNOSTIC"
BACKUP = "EFI-PREVIOUS-KEYSUPPORT-V1-DIAGNOSTIC"
STAGE = "EFI-NATIVE-FIRMWARE-STAGING"
FAILED = "EFI-NATIVE-FIRMWARE-FAILED"

def sha256(path: Path) -> str:
    h=hashlib.sha256()
    with path.open("rb") as f:
        for b in iter(lambda:f.read(1024*1024),b""): h.update(b)
    return h.hexdigest()

def safe_extract(zpath: Path, dest: Path) -> Path:
    dest.mkdir(parents=True,exist_ok=False); root=dest.resolve()
    with zipfile.ZipFile(zpath) as z:
        for i in z.infolist():
            n=PurePosixPath(i.filename)
            if n.is_absolute() or ".." in n.parts or not n.parts: raise RuntimeError("Unsafe ZIP path: "+i.filename)
            mode=(i.external_attr>>16)&0xffff
            if mode and (mode&0o170000)==0o120000: raise RuntimeError("ZIP symlink rejected: "+i.filename)
            target=(root/Path(*n.parts)).resolve()
            if target!=root and root not in target.parents: raise RuntimeError("ZIP path escapes extraction root")
        z.extractall(root)
    efi=root/"EFI"
    if not efi.is_dir(): raise RuntimeError("EFI/ missing at archive root")
    return efi

def validate_efi(efi: Path) -> list[Path]:
    required=["BOOT/BOOTx64.efi","OC/OpenCore.efi","OC/config.plist","OC/Kexts/UTBMap.kext/Contents/Info.plist"]
    for rel in required:
        if not (efi/rel).is_file(): raise RuntimeError("Required file missing: "+rel)
    with (efi/"OC/config.plist").open("rb") as f: c=__import__("plistlib").load(f)
    inp=c.get("UEFI",{}).get("Input",{})
    boot=c.get("Misc",{}).get("Boot",{})
    drivers=c.get("UEFI",{}).get("Drivers",[])
    args=c.get("NVRAM",{}).get("Add",{}).get("7C436110-AB2A-4BBB-A880-FE41995C9F82",{}).get("boot-args","").split()
    if inp.get("KeySupport") is not True or inp.get("KeySupportMode")!="V1":
        raise RuntimeError("Expected KeySupport=true and KeySupportMode=V1")
    if boot.get("PollAppleHotKeys") is not False: raise RuntimeError("PollAppleHotKeys must remain false")
    if any(d.get("Path")=="OpenUsbKbDxe.efi" for d in drivers): raise RuntimeError("OpenUsbKbDxe must not be configured")
    if (efi/"OC/Drivers/OpenUsbKbDxe.efi").exists(): raise RuntimeError("OpenUsbKbDxe binary must be absent")
    if "-radvesa" not in args or c.get("PlatformInfo",{}).get("Generic",{}).get("SystemProductName")!="iMac20,1":
        raise RuntimeError("Expected RX570 VESA diagnostic args and iMac20,1")
    files=[p for p in efi.rglob("*") if p.is_file()]
    if len(files)<20: raise RuntimeError("Suspicious EFI file count: %d"%len(files))
    return files

def verify_tree(src: Path,dst: Path)->int:
    files=[p for p in src.rglob("*") if p.is_file()]
    for p in files:
        q=dst/p.relative_to(src)
        if not q.is_file() or sha256(p)!=sha256(q): raise RuntimeError("SHA256 readback failed: "+str(p.relative_to(src)))
    if len([p for p in dst.rglob("*") if p.is_file()])!=len(files): raise RuntimeError("Unexpected destination files")
    return len(files)

def ps_target()->dict:
    ps=r"""
$ErrorActionPreference='Stop'
$p=Get-Partition -DriveLetter F
$d=Get-Disk -Number $p.DiskNumber
$l=Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='F:'"
[pscustomobject]@{FriendlyName=$d.FriendlyName;SerialNumber=([string]$d.SerialNumber).Trim();BusType=[string]$d.BusType;Size=[int64]$d.Size;IsBoot=[bool]$d.IsBoot;IsSystem=[bool]$d.IsSystem;PartitionStyle=[string]$d.PartitionStyle;GptType=([string]$p.GptType).Trim('{}').ToLowerInvariant();FileSystem=[string]$l.FileSystem}|ConvertTo-Json -Compress
"""
    x=subprocess.run(["powershell.exe","-NoProfile","-NonInteractive","-ExecutionPolicy","Bypass","-Command",ps],check=True,capture_output=True,text=True)
    return json.loads(x.stdout.strip().splitlines()[-1])

def check_target()->Path:
    d=ps_target()
    ok=(d.get("FriendlyName")==MODEL and d.get("SerialNumber")==SERIAL and d.get("BusType")=="USB"
        and abs(int(d.get("Size",0))-DISK_BYTES)<=2*1024*1024 and d.get("IsBoot") is False
        and d.get("IsSystem") is False and d.get("PartitionStyle")=="GPT"
        and d.get("GptType")==ESP_GUID and d.get("FileSystem")=="FAT32")
    if not ok: raise RuntimeError("SAFETY STOP: USB ESP identity mismatch: "+repr(d))
    root=Path("F:\\")
    for rel in ["com.apple.recovery.boot/BaseSystem.dmg","com.apple.recovery.boot/BaseSystem.chunklist"]:
        if not (root/rel).is_file(): raise RuntimeError("Recovery file missing; no changes made: "+rel)
    known=root/KNOWN_GOOD_VESA
    if not (known/"BOOT/BOOTx64.efi").is_file() or not (known/"OC/config.plist").is_file():
        raise RuntimeError("Known-good RX570 VESA rollback EFI missing; no changes made")
    print("TARGET_IDENTITY=PASS; LITEON USB Disk 1; F: FAT32 GPT ESP")
    print("RECOVERY_IMAGE_AND_CHUNKLIST=PASS")
    print("KNOWN_GOOD_VESA_ROLLBACK=PASS; preserved without modification")
    return root

def download(work:Path)->Path:
    if len(ARTIFACT_SHA256)!=64: raise RuntimeError("Artifact SHA256 pin is invalid")
    z=work/"artifact.zip"
    req=urllib.request.Request(ARTIFACT_URL,headers={"User-Agent":"B460M-OC-Builder"})
    with urllib.request.urlopen(req,timeout=90) as r,z.open("wb") as f: shutil.copyfileobj(r,f)
    if sha256(z)!=ARTIFACT_SHA256: raise RuntimeError("Artifact SHA256 mismatch")
    print("ARTIFACT_SHA256=PASS")
    return z

def deploy():
    if os.name!="nt": raise RuntimeError("Windows only")
    if not ctypes.windll.shell32.IsUserAnAdmin(): raise RuntimeError("Run elevated PowerShell as Administrator")
    root=check_target(); current=root/"EFI"; backup=root/BACKUP; stage=root/STAGE; failed=root/FAILED
    if not (current/"BOOT/BOOTx64.efi").is_file(): raise RuntimeError("Current EFI incomplete")
    if any(p.exists() for p in [backup,stage,failed]): raise RuntimeError("Backup/stage/failed directory exists; refusing overwrite")
    with tempfile.TemporaryDirectory(prefix="B460M-KeySupportV1-") as td:
        z=download(Path(td)); efi=safe_extract(z,Path(td)/"package"); validate_efi(efi)
        files=[p for p in efi.rglob("*") if p.is_file()]
        stage.mkdir()
        for p in files:
            rel=p.relative_to(efi); q=stage/rel; q.parent.mkdir(parents=True,exist_ok=True); shutil.copy2(p,q)
            if sha256(p)!=sha256(q): raise RuntimeError("Staging hash mismatch: "+str(rel))
        print("EFI_STRUCTURE_CONFIG_AND_STAGING=PASS; FILES=%d"%len(files))
        current.rename(backup)
        try:
            stage.rename(current); n=verify_tree(efi,current)
            print("ACTIVE_EFI_SHA256=PASS; FILES=%d"%n)
        except Exception:
            if current.exists() and not failed.exists(): current.rename(failed)
            if backup.exists() and not current.exists(): backup.rename(current)
            raise
    print("NATIVE_FIRMWARE_KEYBOARD_DIAGNOSTIC_DEPLOYMENT_SUCCESS")
    print("ACTIVE_EFI=F:\\EFI (KeySupport=true; KeySupportMode=V1; OpenUsbKbDxe absent)")
    print("PREVIOUS_OPENUSBKBD_EFI_PRESERVED=F:\\"+BACKUP)
    print("KNOWN_GOOD_VESA_EFI_PRESERVED=F:\\"+KNOWN_GOOD_VESA)
    print("RECOVERY_AND_ALL_DISK_PARTITIONS=UNCHANGED; INTERNAL_DISKS=NOT_MODIFIED")

def self_test():
    import plistlib
    with tempfile.TemporaryDirectory(prefix="B460M-V1-Test-") as td:
        b=Path(td); src=b/"src"/"EFI"; (src/"BOOT").mkdir(parents=True); (src/"OC").mkdir()
        for i in range(24): (src/"OC"/("x%d"%i)).write_bytes(("v%d"%i).encode())
        (src/"BOOT/BOOTx64.efi").write_bytes(b"boot")
        z=b/"x.zip"
        with zipfile.ZipFile(z,"w") as a:
            for p in src.rglob("*"):
                if p.is_file(): a.write(p,p.relative_to(src.parent).as_posix())
        out=safe_extract(z,b/"extract"); dest=b/"stage"; dest.mkdir()
        for p in out.rglob("*"):
            if p.is_file():
                q=dest/p.relative_to(out); q.parent.mkdir(parents=True,exist_ok=True); shutil.copy2(p,q)
        assert verify_tree(out,dest)==25
        bad=b/"bad.zip"
        with zipfile.ZipFile(bad,"w") as a:a.writestr("../escape","x")
        try:safe_extract(bad,b/"bad")
        except RuntimeError:pass
        else:raise AssertionError("ZIP traversal not blocked")
        live=b/"live"/"EFI";live.parent.mkdir();shutil.copytree(out,live)
        old=live.with_name("EFI-BACKUP");live.rename(old)
        (live.parent/"EFI-STAGE").mkdir();(live.parent/"EFI-STAGE"/"ok").write_text("1")
        (live.parent/"EFI-STAGE").rename(live)
        live.rename(live.with_name("EFI-FAILED"));old.rename(live)
        assert (live/"BOOT/BOOTx64.efi").read_bytes()==b"boot"
    print("PYTHON_SELF_TEST=PASS; ZIP_TRAVERSAL=PASS; STAGING_SHA256=PASS; SWAP_ROLLBACK=PASS; PHYSICAL_DISKS_TOUCHED=0")

def validate_archive(z:Path):
    if sha256(z)!=ARTIFACT_SHA256: raise RuntimeError("Pinned artifact SHA256 mismatch")
    with tempfile.TemporaryDirectory(prefix="B460M-V1-Artifact-") as td:
        e=safe_extract(z,Path(td)/"pkg"); files=validate_efi(e)
        print("ARTIFACT_EFI_VALIDATION=PASS; FILES=%d"%len(files))
        print("ARTIFACT_SHA256="+sha256(z))

def main():
    ap=argparse.ArgumentParser();ap.add_argument("--self-test",action="store_true");ap.add_argument("--validate-artifact",type=Path);a=ap.parse_args()
    try:
        if a.self_test:self_test()
        elif a.validate_artifact:validate_archive(a.validate_artifact)
        else:deploy()
        return 0
    except Exception as e:
        print("ERROR: "+str(e),file=sys.stderr);return 1
if __name__=="__main__":raise SystemExit(main())

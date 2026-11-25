#!/usr/bin/env python3
# B460M OpenUsbKbDxe diagnostic EFI deployer. Standard library only.
from __future__ import annotations
import argparse
import hashlib
import json
import os
from pathlib import Path, PurePosixPath
import plistlib
import shutil
import subprocess
import sys
import tempfile
import urllib.request
import zipfile

ARTIFACT_URL = "https://github.com/hf9syu5v-dev/game-accelerator/releases/download/b460m-openusbkbd-keyboard-diagnostic/B460M-OpenUsbKbDxe-Keyboard-Diagnostic-EFI.zip"
ARTIFACT_SHA256 = "8a9758328f1c032c83963d955b5e05faa734dc41d1e79c06f7267e08de5ec77f"
DRIVE = "F:"
MODEL = "LITEON I T LCS-128L9S"
SERIAL = "000000123ADC"
DISK_BYTES = 128035676160
ESP_GUID = "c12a7328-f81f-11d2-ba4b-00a0c93ec93b"
BACKUP = "EFI-PREVIOUS-RX570-VESA-DIAGNOSTIC"
STAGE = "EFI-OPENUSBKBD-STAGING"
FAILED = "EFI-OPENUSBKBD-FAILED"


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for block in iter(lambda: f.read(1024 * 1024), b""):
            h.update(block)
    return h.hexdigest()


def safe_extract(zip_path: Path, destination: Path) -> Path:
    destination.mkdir(parents=True, exist_ok=False)
    root = destination.resolve()
    with zipfile.ZipFile(zip_path) as zf:
        for info in zf.infolist():
            name = PurePosixPath(info.filename)
            if name.is_absolute() or ".." in name.parts or not name.parts:
                raise RuntimeError("Unsafe ZIP member path: " + info.filename)
            # Reject Unix symlinks; EFI payload needs only regular files/directories.
            mode = (info.external_attr >> 16) & 0xFFFF
            if mode and (mode & 0o170000) == 0o120000:
                raise RuntimeError("ZIP symlink is not allowed: " + info.filename)
            target = (root / Path(*name.parts)).resolve()
            if target != root and root not in target.parents:
                raise RuntimeError("ZIP path escapes extraction root: " + info.filename)
        zf.extractall(root)
    efi = root / "EFI"
    if not efi.is_dir():
        raise RuntimeError("Archive does not contain EFI/ at its root")
    return efi


def validate_efi(efi: Path) -> list[Path]:
    required = [
        "BOOT/BOOTx64.efi",
        "OC/OpenCore.efi",
        "OC/config.plist",
        "OC/Drivers/OpenUsbKbDxe.efi",
        "OC/Kexts/UTBMap.kext/Contents/Info.plist",
    ]
    for rel in required:
        if not (efi / rel).is_file():
            raise RuntimeError("Required EFI file missing: " + rel)
    with (efi / "OC/config.plist").open("rb") as f:
        cfg = plistlib.load(f)
    uefi = cfg.get("UEFI", {})
    inp = uefi.get("Input", {})
    drivers = uefi.get("Drivers", [])
    driver_ok = any(
        d.get("Path") == "OpenUsbKbDxe.efi" and d.get("Enabled") is True
        for d in drivers if isinstance(d, dict)
    )
    boot = cfg.get("Misc", {}).get("Boot", {})
    args = cfg.get("NVRAM", {}).get("Add", {}).get(
        "7C436110-AB2A-4BBB-A880-FE41995C9F82", {}
    ).get("boot-args", "")
    product = cfg.get("PlatformInfo", {}).get("Generic", {}).get("SystemProductName")
    if inp.get("KeySupport") is not False or boot.get("PollAppleHotKeys") is not False:
        raise RuntimeError("Expected UEFI Input KeySupport=false and Misc Boot PollAppleHotKeys=false")
    if not driver_ok:
        raise RuntimeError("OpenUsbKbDxe.efi is not enabled in UEFI Drivers")
    if "-radvesa" not in args or product != "iMac20,1":
        raise RuntimeError("Expected -radvesa diagnostic args and iMac20,1 SMBIOS")
    files = [p for p in efi.rglob("*") if p.is_file()]
    if len(files) < 20:
        raise RuntimeError("EFI file count is suspiciously small: %d" % len(files))
    return files


def copy_and_verify(source: Path, destination: Path) -> int:
    source = source.resolve()
    destination.mkdir(parents=False, exist_ok=False)
    files = [p for p in source.rglob("*") if p.is_file()]
    for src in files:
        rel = src.relative_to(source)  # raises if path escapes source root
        dst = destination / rel
        dst.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(src, dst)
        if not dst.is_file() or sha256(src) != sha256(dst):
            raise RuntimeError("Staging SHA256 mismatch: " + str(rel))
    if len(files) < 20:
        raise RuntimeError("Staging file count unexpectedly low")
    return len(files)


def verify_tree(source: Path, destination: Path) -> int:
    source = source.resolve()
    files = [p for p in source.rglob("*") if p.is_file()]
    for src in files:
        rel = src.relative_to(source)
        dst = destination / rel
        if not dst.is_file() or sha256(src) != sha256(dst):
            raise RuntimeError("Destination SHA256 mismatch: " + str(rel))
    extra = [p for p in destination.rglob("*") if p.is_file()]
    if len(extra) != len(files):
        raise RuntimeError("Destination contains unexpected/missing files")
    return len(files)


def powershell_target_info() -> dict:
    ps = r"""
$ErrorActionPreference='Stop'
$p=Get-Partition -DriveLetter F
$d=Get-Disk -Number $p.DiskNumber
$l=Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='F:'"
[pscustomobject]@{
 FriendlyName=$d.FriendlyName; SerialNumber=$d.SerialNumber.Trim()
 BusType=[string]$d.BusType; Size=[int64]$d.Size
 IsBoot=[bool]$d.IsBoot; IsSystem=[bool]$d.IsSystem
 PartitionStyle=[string]$d.PartitionStyle
 GptType=([string]$p.GptType).Trim('{}').ToLowerInvariant()
 FileSystem=[string]$l.FileSystem
} | ConvertTo-Json -Compress
"""
    result = subprocess.run(
        ["powershell.exe", "-NoProfile", "-NonInteractive", "-ExecutionPolicy", "Bypass", "-Command", ps],
        check=True, capture_output=True, text=True,
    )
    return json.loads(result.stdout.strip().splitlines()[-1])


def check_target() -> Path:
    info = powershell_target_info()
    valid = (
        info.get("FriendlyName") == MODEL
        and info.get("SerialNumber") == SERIAL
        and info.get("BusType") == "USB"
        and abs(int(info.get("Size", 0)) - DISK_BYTES) <= 2 * 1024 * 1024
        and info.get("IsBoot") is False
        and info.get("IsSystem") is False
        and info.get("PartitionStyle") == "GPT"
        and info.get("GptType") == ESP_GUID
        and info.get("FileSystem") == "FAT32"
    )
    if not valid:
        raise RuntimeError("SAFETY STOP: F: is not the exact authorized LITEON USB ESP: " + repr(info))
    root = Path(DRIVE + "\\")
    if not (root / "com.apple.recovery.boot" / "BaseSystem.dmg").is_file():
        raise RuntimeError("Recovery BaseSystem.dmg missing; no changes made")
    print("TARGET_IDENTITY=PASS; LITEON USB Disk 1; F: FAT32 GPT ESP")
    print("RECOVERY_IMAGE_PRESENT=PASS")
    return root


def download_artifact(work: Path) -> Path:
    archive = work / "diagnostic.zip"
    request = urllib.request.Request(ARTIFACT_URL, headers={"User-Agent": "B460M-OC-Builder"})
    with urllib.request.urlopen(request, timeout=90) as response, archive.open("wb") as out:
        shutil.copyfileobj(response, out)
    actual = sha256(archive)
    if actual != ARTIFACT_SHA256:
        raise RuntimeError("Artifact SHA256 mismatch: " + actual)
    print("ARTIFACT_SHA256=PASS")
    return archive


def deploy() -> None:
    if os.name != "nt":
        raise RuntimeError("Deployment is supported only on Windows")
    if hasattr(os, "geteuid") and os.geteuid() != 0:
        raise RuntimeError("Run from an elevated Administrator terminal")
    root = check_target()
    current = root / "EFI"
    backup = root / BACKUP
    stage = root / STAGE
    failed = root / FAILED
    if not (current / "BOOT/BOOTx64.efi").is_file():
        raise RuntimeError("Current EFI missing/incomplete")
    if backup.exists() or stage.exists() or failed.exists():
        raise RuntimeError("Backup/staging/failed directory already exists; refusing overwrite")
    with tempfile.TemporaryDirectory(prefix="B460M-OpenUsbKbDxe-") as td:
        work = Path(td)
        archive = download_artifact(work)
        efi = safe_extract(archive, work / "package")
        source_files = validate_efi(efi)
        count = copy_and_verify(efi, stage)
        print("EFI_STRUCTURE_AND_CONFIG=PASS")
        print("STAGING_SHA256=PASS; FILES=%d" % count)
        # Directory renames are same-volume operations on F:, preserving Recovery and partitions.
        current.rename(backup)
        try:
            stage.rename(current)
            final_count = verify_tree(efi, current)
            print("ACTIVE_EFI_SHA256=PASS; FILES=%d" % final_count)
        except Exception:
            if current.exists() and not failed.exists():
                current.rename(failed)
            if backup.exists() and not current.exists():
                backup.rename(current)
            raise
    print("OPENUSBKBD_DIAGNOSTIC_DEPLOYMENT_SUCCESS")
    print("ACTIVE_EFI=F:\\EFI (KeySupport=false; OpenUsbKbDxe enabled)")
    print("PREVIOUS_EFI_PRESERVED=F:\\" + BACKUP)
    print("RECOVERY_AND_ALL_DISK_PARTITIONS=UNCHANGED")
    print("INTERNAL_DISKS=NOT_MODIFIED")


def validate_archive(archive: Path) -> None:
    with tempfile.TemporaryDirectory(prefix="B460M-Artifact-Check-") as td:
        efi = safe_extract(archive, Path(td) / "package")
        files = validate_efi(efi)
        print("ARTIFACT_EFI_VALIDATION=PASS; FILES=%d" % len(files))
        print("ARTIFACT_SHA256=" + sha256(archive))


def self_test() -> None:
    with tempfile.TemporaryDirectory(prefix="B460M-Python-SelfTest-") as td:
        base = Path(td)
        src = base / "source" / "EFI"
        (src / "BOOT").mkdir(parents=True)
        (src / "OC").mkdir()
        for i in range(25):
            p = src / "OC" / ("test-%02d.bin" % i)
            p.write_bytes(("payload-%02d" % i).encode())
        (src / "BOOT" / "BOOTx64.efi").write_bytes(b"boot")
        archive = base / "test.zip"
        with zipfile.ZipFile(archive, "w", zipfile.ZIP_DEFLATED) as z:
            for p in src.rglob("*"):
                if p.is_file():
                    z.write(p, p.relative_to(src.parent).as_posix())
        extracted = safe_extract(archive, base / "extract")
        count = copy_and_verify(extracted, base / "stage")
        assert count == 26 and verify_tree(extracted, base / "stage") == 26
        live = base / "live" / "EFI"
        live.parent.mkdir()
        shutil.copytree(extracted, live)
        old = live.with_name("EFI-BACKUP")
        live.rename(old)
        (base / "live" / "EFI-STAGE").mkdir()
        (base / "live" / "EFI-STAGE" / "marker").write_text("ok")
        (base / "live" / "EFI-STAGE").rename(live)
        assert (live / "marker").read_text() == "ok"
        # Simulate post-switch verification failure and rollback.
        live.rename(live.with_name("EFI-FAILED"))
        old.rename(live)
        assert (live / "BOOT" / "BOOTx64.efi").read_bytes() == b"boot"
        # ZIP traversal must be rejected.
        bad = base / "bad.zip"
        with zipfile.ZipFile(bad, "w") as z:
            z.writestr("../escape.txt", "no")
        try:
            safe_extract(bad, base / "bad-extract")
            raise AssertionError("ZIP traversal was not rejected")
        except RuntimeError as exc:
            assert "Unsafe ZIP" in str(exc)
    print("PYTHON_SELF_TEST=PASS")
    print("ZIP_PATH_TRAVERSAL_GUARD=PASS")
    print("STAGING_AND_SHA256=PASS")
    print("DIRECTORY_SWAP_AND_ROLLBACK=PASS")
    print("PHYSICAL_DISKS_TOUCHED=0")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--self-test", action="store_true")
    parser.add_argument("--validate-artifact", type=Path)
    args = parser.parse_args()
    try:
        if args.self_test:
            self_test()
        elif args.validate_artifact:
            if sha256(args.validate_artifact) != ARTIFACT_SHA256:
                raise RuntimeError("Pinned artifact SHA256 mismatch")
            validate_archive(args.validate_artifact)
        else:
            deploy()
        return 0
    except Exception as exc:
        print("ERROR: " + str(exc), file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())

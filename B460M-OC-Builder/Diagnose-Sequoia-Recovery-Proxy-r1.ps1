# Read-only network diagnostic. Does not modify any USB disk or partition.
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
$Repo = 'https://raw.githubusercontent.com/acidanthera/OpenCorePkg/master/Utilities/macrecovery/macrecovery.py'
$Work = Join-Path $env:TEMP ('B460M-RECOVERY-PROXY-DIAG-' + [guid]::NewGuid().ToString('N'))
try {
    Write-Host '=== SEQUOIA RECOVERY PROXY DIAGNOSTIC (READ ONLY) ===' -ForegroundColor Cyan
    Write-Host 'No USB files, partitions, EFI, or Recovery data will be changed.'
    $py = Get-Command py.exe -ErrorAction SilentlyContinue
    if (!$py) { $py = Get-Command python.exe -ErrorAction SilentlyContinue }
    if (!$py) { throw 'Python 3 not found. Install Python 3 first.' }

    New-Item -ItemType Directory -Path $Work | Out-Null
    $mac = Join-Path $Work 'macrecovery.py'
    Invoke-WebRequest -Uri $Repo -OutFile $mac
    if ((Get-Item $mac).Length -lt 10000) { throw 'Official macrecovery.py download appears incomplete.' }

    $candidates = [System.Collections.Generic.List[string]]::new()
    foreach ($name in @('HTTP_PROXY','HTTPS_PROXY','ALL_PROXY')) {
        $v = [Environment]::GetEnvironmentVariable($name)
        if ($v) { $candidates.Add($v) }
    }
    try {
        $reg = Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' -ErrorAction Stop
        if ($reg.ProxyEnable -eq 1 -and $reg.ProxyServer) {
            $v = [string]$reg.ProxyServer
            if ($v -match '^(http|https|socks)://') { $candidates.Add($v) }
            elseif ($v -match '^\d+\.\d+\.\d+\.\d+:\d+$') { $candidates.Add("http://$v") }
            elseif ($v -match '^\d+$') { $candidates.Add("http://127.0.0.1:$v") }
            else {
                foreach ($part in ($v -split ';')) {
                    if ($part -match '^(?:http=)?(.+:\d+)$') { $candidates.Add("http://$($Matches[1])") }
                }
            }
        }
    } catch {}
    foreach ($port in @(7890,7897,7891,10809,1080,2080,20171,8080,8888,9090,20170)) {
        $candidates.Add("http://127.0.0.1:$port")
    }
    $candidates = @($candidates | Select-Object -Unique)
    $selected = $null
    foreach ($proxy in $candidates) {
        try {
            $u = [uri]$proxy
            if ($u.Scheme -notin @('http','https') -or !$u.Port) { continue }
            $tcp = [System.Net.Sockets.TcpClient]::new()
            $ar = $tcp.BeginConnect($u.Host, $u.Port, $null, $null)
            if (!$ar.AsyncWaitHandle.WaitOne(700)) { $tcp.Close(); continue }
            $tcp.EndConnect($ar); $tcp.Close()
            Write-Host "PROXY_LISTENER=$($u.Host):$($u.Port)"
            $selected = $proxy
            break
        } catch {}
    }
    if (!$selected) {
        Write-Host 'LOCAL_HTTP_PROXY_AUTODETECT=NOT_FOUND' -ForegroundColor Yellow
        Write-Host 'No standard local HTTP proxy listener was detected.'
        Write-Host 'This diagnostic cannot infer a SOCKS-only port or a proxy hidden behind a TUN interface.'
        exit 2
    }

    $env:HTTP_PROXY = $selected
    $env:HTTPS_PROXY = $selected
    $env:http_proxy = $selected
    $env:https_proxy = $selected
    Write-Host "PROXY_SELECTED=$($selected -replace '://.*@','://[credentials]@')"
    $probe = @'
import os, sys, urllib.request, socket
socket.setdefaulttimeout(15)
print("PYTHON_PROXY_HTTP=" + str(urllib.request.getproxies().get("http", "NOT_SET")))
for url in ("http://osrecovery.apple.com/", "http://oscdn.apple.com/"):
    try:
        req=urllib.request.Request(url, headers={"User-Agent":"InternetRecovery/1.0"})
        with urllib.request.urlopen(req, timeout=15) as r:
            print("PROBE", url, "HTTP", r.status, "FINAL", r.geturl())
    except Exception as e:
        print("PROBE_ERROR", url, type(e).__name__, str(e)[:240])
'@
    $probeFile = Join-Path $Work 'probe.py'
    Set-Content -LiteralPath $probeFile -Value $probe -Encoding UTF8
    if ($py.Name -eq 'py.exe') { & $py.Source -3 $probeFile } else { & $py.Source $probeFile }
    if ($LASTEXITCODE -ne 0) { throw "Python proxy probe failed: $LASTEXITCODE" }

    $fetch = @'
import argparse, importlib.util, os, socket, sys, urllib.request
socket.setdefaulttimeout(20)
path, = sys.argv[1:]
spec=importlib.util.spec_from_file_location("macrecovery", path)
m=importlib.util.module_from_spec(spec); spec.loader.exec_module(m)
args=argparse.Namespace(verbose=False, board_id="Mac-7BA5B2D9E42DDD94",
                        mlb="00000000000000000", diagnostics=False, os_type="default")
try:
    session=m.get_session(args)
    info=m.get_image_info(session, bid=args.board_id, mlb=args.mlb,
                          diag=False, os_type=args.os_type)
    print("APPLE_METADATA_REQUEST=PASS")
    print("RECOVERY_PRODUCT="+info.get("AP","UNKNOWN"))
    for label,key in (("CHUNKLIST","CU"),("IMAGE","AU")):
        from urllib.parse import urlparse
        u=urlparse(info[key])
        print(label+"_HOST="+str(u.hostname))
        print(label+"_URL_PATH="+str(u.path))
        token=info["CT"] if label=="CHUNKLIST" else info["AT"]
        req=urllib.request.Request(info[key], headers={
            "Host":u.hostname, "Connection":"close",
            "User-Agent":"InternetRecovery/1.0", "Cookie":"=".join(["AssetToken",token]),
            "Range":"bytes=0-0"})
        try:
            with urllib.request.urlopen(req, timeout=25) as r:
                print(label+"_RANGE_TEST=HTTP_"+str(r.status))
                print(label+"_CONTENT_LENGTH="+str(r.headers.get("Content-Length","unknown")))
        except Exception as e:
            print(label+"_RANGE_TEST_ERROR="+type(e).__name__+":"+str(e)[:240])
except Exception as e:
    print("APPLE_METADATA_ERROR="+type(e).__name__+":"+str(e)[:300])
    sys.exit(1)
'@
    $fetchFile = Join-Path $Work 'fresh-url-test.py'
    Set-Content -LiteralPath $fetchFile -Value $fetch -Encoding UTF8
    Write-Host ''
    Write-Host 'Requesting a fresh Sequoia Recovery URL and testing one-byte range requests via proxy...' -ForegroundColor Cyan
    if ($py.Name -eq 'py.exe') { & $py.Source -3 $fetchFile $mac } else { & $py.Source $fetchFile $mac }
    if ($LASTEXITCODE -ne 0) { throw "Fresh Apple Recovery metadata request failed: $LASTEXITCODE" }
    Write-Host ''
    Write-Host 'DIAGNOSTIC_COMPLETE; NO_USB_FILES_CHANGED' -ForegroundColor Green
}
finally {
    if (Test-Path -LiteralPath $Work) {
        Remove-Item -LiteralPath $Work -Recurse -Force -ErrorAction SilentlyContinue
    }
}
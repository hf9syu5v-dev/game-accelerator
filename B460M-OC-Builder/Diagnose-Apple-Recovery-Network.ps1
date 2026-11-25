#requires -RunAsAdministrator
[CmdletBinding()]
param()
$ErrorActionPreference = 'Continue'
$ProgressPreference = 'SilentlyContinue'
Write-Host '=== APPLE RECOVERY NETWORK DIAGNOSTIC (READ ONLY) ===' -ForegroundColor Cyan
Write-Host 'No USB files, partitions, EFI, or Recovery data will be changed.'
$hostName = 'oscdn.apple.com'
Write-Host ''
Write-Host '[1] DNS'
try { Resolve-DnsName $hostName -ErrorAction Stop | Where-Object { $_.Type -in @('A','AAAA') } | ForEach-Object { Write-Host "DNS_$($_.Type)=$($_.IPAddress)" } } catch { Write-Host "DNS_ERROR=$($_.Exception.Message)" -ForegroundColor Yellow }
Write-Host ''
Write-Host '[2] TCP connectivity'
foreach ($port in @(80,443)) { $client = [System.Net.Sockets.TcpClient]::new(); try { $task = $client.ConnectAsync($hostName,$port); if ($task.Wait(8000) -and $client.Connected) { Write-Host "TCP_${port}=PASS" -ForegroundColor Green } else { Write-Host "TCP_${port}=TIMEOUT" -ForegroundColor Yellow } } catch { Write-Host "TCP_${port}=FAIL: $($_.Exception.GetBaseException().Message)" -ForegroundColor Yellow } finally { $client.Dispose() } }
Write-Host ''
Write-Host '[3] curl.exe HTTP/HTTPS response headers'
$curl = Get-Command curl.exe -ErrorAction SilentlyContinue
if ($curl) { foreach ($url in @('http://oscdn.apple.com/','https://oscdn.apple.com/')) { Write-Host "CURL_TEST=$url"; & $curl.Source -I -L --connect-timeout 8 --max-time 15 --max-redirs 3 $url 2>&1 | Select-Object -Last 8; Write-Host "CURL_EXIT=$LASTEXITCODE" } } else { Write-Host 'CURL_EXE=NOT_FOUND' }
Write-Host ''
Write-Host '[4] Python urllib timeout test'
$py = Get-Command py.exe -ErrorAction SilentlyContinue; if (!$py) { $py = Get-Command python.exe -ErrorAction SilentlyContinue }
if ($py) { $code = @'
import urllib.request
for scheme in ('http','https'):
    u = scheme + '://oscdn.apple.com/'
    try:
        r = urllib.request.urlopen(u, timeout=12)
        print('PY_STATUS', scheme, r.status)
        r.close()
    except Exception as e:
        print('PY_ERROR', scheme, type(e).__name__, str(e))
'@; if ($py.Name -eq 'py.exe') { & $py.Source -3 -c $code } else { & $py.Source -c $code }; Write-Host "PYTHON_TEST_EXIT=$LASTEXITCODE" } else { Write-Host 'PYTHON3=NOT_FOUND' }
Write-Host ''
Write-Host '[5] Proxy configuration (credentials hidden)'
foreach ($name in @('HTTP_PROXY','HTTPS_PROXY','ALL_PROXY','NO_PROXY')) { $v = [Environment]::GetEnvironmentVariable($name); if ($v) { try { $uri = [uri]$v; Write-Host ("{0}={1}://{2}:{3}" -f $name,$uri.Scheme,$uri.Host,$uri.Port) } catch { Write-Host "$name=SET (value hidden)" } } else { Write-Host "$name=NOT_SET" } }
try { netsh winhttp show proxy | ForEach-Object { Write-Host "WINHTTP: $_" } } catch { Write-Host 'WINHTTP_PROXY_QUERY=FAILED' }
Write-Host ''
Write-Host 'DIAGNOSTIC_COMPLETE; NO_FILES_CHANGED' -ForegroundColor Green
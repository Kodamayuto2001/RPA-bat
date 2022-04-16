@powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[scriptblock]::create((gc \"%~f0\"|?{$_.readcount -gt 1})-join\"`n\");&$s" %*&goto:eof

$ps = Get-Process | Where-Object { $_.Name -eq "Code" }

if ($null -eq $ps) {
    Start-Process code -WindowStyle Hidden
}
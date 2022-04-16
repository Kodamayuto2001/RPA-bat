@powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[scriptblock]::create((gc \"%~f0\"|?{$_.readcount -gt 1})-join\"`n\");&$s" %*&goto:eof

$ps = Get-Process | Where-Object { $_.Name -eq "Code" }

try {
    cd 'D:\workspace\progress-management'
} catch {
    cd 'C:'
}

if ($null -eq $ps) {
    Start-Process code . -WindowStyle Hidden
}
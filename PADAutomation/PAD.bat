@powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[scriptblock]::create((gc \"%~f0\"|?{$_.readcount -gt 1})-join\"`n\");&$s" %*&goto:eof

.\PADInstall.bat
.\DownloaderUIAutomation.bat | Out-Null
.\SetMinSize.bat | Out-Null
.\StartSetupPAD.bat
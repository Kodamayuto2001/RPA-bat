echo off

if exist "%CD%\Setup.Microsoft.PowerAutomate.exe" (
    exit /b
)
bitsadmin /transfer download https://go.microsoft.com/fwlink/?linkid=2102613 %CD%\Setup.Microsoft.PowerAutomate.exe
exit /b

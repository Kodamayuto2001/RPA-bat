@echo off 

set zipFilePath="UIAutomation.0.8.7B3.NET40.zip"
set folderPath="UIAutomation.0.8.7B3.NET40\"

:loop 
    powershell -Command "sleep -m 100"

    if exist "%zipFilePath%" if exist "%folderPath%" (
        del %zipFilePath%

        exit /b
    )
goto :loop 
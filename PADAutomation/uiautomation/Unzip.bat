@echo off 

@REM zipファイルがあるpath
set zipFilePath="UIAutomation.0.8.7B3.NET40.zip"


:loop 
    powershell -Command "sleep -m 100"
    
    if exist "%CD%\UIAutomation.0.8.7B3.NET40\" (
        exit /b
    )

    if exist "%zipFilePath%" (
        powershell -command "Expand-Archive -Path UIAutomation.0.8.7B3.NET40.zip -DestinationPath %CD%\UIAutomation.0.8.7B3.NET40 -Force"

        @REM 同期実行でないと展開中にzipファイルが消えてしまう。
        call Delzip
    )
    
goto :loop 


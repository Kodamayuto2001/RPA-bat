echo off

if exist "%CD%\UIAutomation.0.8.7B3.NET40\" (
    exit /b
)
bitsadmin /transfer download https://www.code-lab.net/wp-content/uploads/2019/06/UIAutomation.0.8.7B3.NET40.zip %CD%\UIAutomation.0.8.7B3.NET40.zip
exit /b
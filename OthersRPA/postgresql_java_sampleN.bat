@powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[scriptblock]::create((gc \"%~f0\"|?{$_.readcount -gt 1})-join\"`n\");&$s" %*&goto:eof

cd D:
cd 'D:\workspace\java\workspace\postgresql-sample\src'

$className = Read-Host "classname (DBConnectN)"

cd 'sample01'
cmd /c "javac ${className}.java"

cd ../
cmd /c "java -cp D:\workspace\PostgreSQL\jdbc\*;. sample01.${className}"

Read-Host "OK"
@powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[scriptblock]::create((gc \"%~f0\"|?{$_.readcount -gt 1})-join\"`n\");&$s" %*&goto:eof

cd D:
cd 'D:\workspace\java\workspace\postgresql-sample\src'

cmd /c "java -cp D:\workspace\PostgreSQL\jdbc\*;. sample01.DBConnect1"

Read-Host "OK"
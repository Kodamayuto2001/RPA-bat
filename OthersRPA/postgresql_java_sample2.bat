@powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[scriptblock]::create((gc \"%~f0\"|?{$_.readcount -gt 1})-join\"`n\");&$s" %*&goto:eof

cd D:
cd 'D:\workspace\java\workspace\postgresql-sample\src'

cd 'sample01'
cmd /c "javac DBConnect2.java"

cd ../
cmd /c "java -cp D:\workspace\PostgreSQL\jdbc\*;. sample01.DBConnect2"

Read-Host "OK"
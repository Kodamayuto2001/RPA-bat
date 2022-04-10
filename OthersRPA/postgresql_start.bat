@powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[scriptblock]::create((gc \"%~f0\"|?{$_.readcount -gt 1})-join\"`n\");&$s" %*&goto:eof

cd c:
cd  "C:\Program Files\PostgreSQL\14\bin"
.\psql.exe -U postgres -d shop
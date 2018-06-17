@echo off
move new.txt ./old/
gethtml.exe
rename index.html new.txt
ping 127.0.0.1 -n 5 > nul
CheckHTML.exe
ping 127.0.0.1 -n 5 > nul
echo ok..
echo moving file to old..
ping 127.0.0.1 -n 2 > nul
move new.txt ./old/new.txt
echo done
ping 127.0.0.1 -n 3 > nul

@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=D:\mysql8\mysql_remove.exe
REM BFCPEICON=
REM BFCPEICONINDEX=1
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEADMINEXE=1
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=0
REM BFCPEVERVERSION=1.0.0.0
REM BFCPEVERPRODUCT=Product Name
REM BFCPEVERDESC=Product Description
REM BFCPEVERCOMPANY=Your Company
REM BFCPEVERCOPYRIGHT=Copyright Info
REM BFCPEOPTIONEND
@ECHO ON
@echo off
echo Inicializando desinstalacion...
echo.
echo ===============================
echo Deteniendo Servicio...
echo ===============================
net stop MySQL
echo.
echo ===============================
echo Eliminando Servicio...
echo ===============================
mysqld --remove
echo.
echo ===============================
echo Eliminando directorios...
echo ===============================
RD /S /Q data
RD /S /Q logs
RD /S /Q temp
pause
@ECHO OFF
REM  QBFC Project Options Begin
REM HasVersionInfo: Yes
REM Companyname: Kasaba Inc.
REM Productname: MySQL Console Uninstaller
REM Filedescription: Desinstalador de MySQL a nivel de consola
REM Copyrights: 
REM Trademarks: 
REM Originalname: 
REM Comments: 
REM Productversion: 01.00.00.00
REM Fileversion: 01.00.00.00
REM Internalname: 
REM ExeType: console
REM Architecture: x86
REM Appicon: mysql.ico
REM AdministratorManifest: Yes
REM  QBFC Project Options End
@ECHO ON
@echo off
echo Inicializando desinstalacion...
echo.
pause
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

@ECHO OFF
color 0A
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=D:\mysql8\start2.exe
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
echo.
echo                                            `....`                     
echo                                             .`  ``...`                
echo                                              ..  .   `..`             
echo                                               .`        ..            
echo                                                .`        `-`          
echo                                                `.         `-`         
echo                                                .           `-         
echo                                                .` -.        `-`       
echo                                                `...`.         `..`    
echo                                                  `   `           `..  
echo                                                                `-.``  
echo .---.      `----               /ooooooooo `/oooooooo+. +s:       ...  
echo --.--`    `--.--  ``       `` -yy`        +ys      :yo oy/          ` 
echo --.`--`  `--``--  --`     `-- `+so/////:` +ys      -yo oy/            
echo --. `--` --. `--  --`     `--     ````/ys +ys  ..` -yo oy/         `. 
echo --.  `----.  `--  --.`````.-- `------:oyo :yy:-/sy+oy+ /yo:------.-//:
echo ```   `..`    ``   ```````.-- `:::::::-.   `-:::::/ss-  `--::::::. -.`
echo                   ----------`                       ..`               
echo Dev: https://github.com/buster95
echo.
echo ====================================
echo *  MySQL Server Console Installer  *
echo *    Inicializando instalacion     *
echo ====================================
echo.
echo. MySQL Server Path ==^> %cd%
echo.
echo.
mkdir logs
mkdir temp
echo..
pause

mysql --version
IF %ERRORLEVEL% NEQ 0 ( 
	echo *******************************
	echo Settings Enviroment...
	echo.
	setx PATH /m "%path%;%cd%\bin"
	set PATH="%path%;%cd%\bin"
	echo.
)
echo *******************************
echo Configurando my.ini...
echo.
inifile my.ini [mysqld] basedir="%cd%"
inifile my.ini [mysqld] log-error="%cd%\logs\mysql.log"
inifile my.ini [mysqld] datadir="%cd%\data"
inifile my.ini [mysqld] lc-messages-dir="%cd%\share"
inifile my.ini [mysqld] secure_file_priv="%cd%\temp"
IF %ERRORLEVEL% NEQ 0 ( 
	goto error1
)
pause
echo.

echo *******************************
echo Creando directorio data...
echo.
mysqld --console --initialize-insecure
IF %ERRORLEVEL% NEQ 0 ( 
	goto error1
)
echo.

echo *******************************
echo Instalando servicio...
echo.
mysqld --install MySQL --defaults-file=%cd%\my.ini
echo.

echo *******************************
echo Iniciando servicio...
echo.
net start MySQL
echo.

set /p clave=Enter Password:
echo CREATE USER 'root'@'%%' IDENTIFIED BY '%clave%'; > script.sql
echo GRANT ALL PRIVILEGES ON *.* TO 'root'@'%%'; >> script.sql
echo ALTER USER 'root'@'localhost' IDENTIFIED BY '%clave%'; >> script.sql
echo ALTER USER 'root'@'%%' IDENTIFIED BY '%clave%'; >> script.sql
echo FLUSH PRIVILEGES; >> script.sql
mysql -uroot < script.sql
@del /f /q script.sql
pause
exit

:error1
echo.
echo Ha ocurrido un error
echo Please restart installer...
echo.
pause
exit
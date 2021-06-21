::==============================
::=            Welcome to the batShell            =
::==============================

::startup core values
@echo off
cls
set startdir=%~p0
set startshell=%0
set bin=%~p0\bin
set cfg=%~p0\cfg
set themedir=%cfg%\themes

::startup scripts
call "%~p0\cfg\theme.cmd"
set theme="%themedir%\%themename%"
set theme=%theme:"=%
::this is to get the themes enviroment values
call "%theme%" values
call "%cfg%\autoexec.cmd"
::Will set the shell to use a theme or not
if "%input%" == "" goto startold
if "%output%" == "" goto startold
goto startNew

::below are the exec loops

:startOld
set exec=
set shellmode=startOld
echo ^#---%cd%--^>
set /p exec="#---ThemeError---> "
goto index
echo.
goto startOld

:startNew
set exec=
set shellmode=startNew
call "%theme%" output "%cd%"
call "%theme%" input exec "%shelltext%"
goto index
echo.
goto startNew


::everything below this is a index check

:index
::grabs first line of input
for /F %%G IN ("%exec%") do set "exec1=%%G"

::searches for files in the bin dir
if exist "%bin%\%exec1%.bat" goto execapp
if exist "%bin%\%exec1%.exe" goto execapp
if exist "%bin%\%exec1%.cmd" goto execapp
if exist "%bin%\%exec1%.lnk" goto execapp
if exist "%bin%\%exec1%" goto execapp
goto execprog

:execapp
call "%bin%\"%exec%
goto indexend

:execprog
%exec%
goto indexend


:indexend
if "%shellmode%" == "startOld" goto startOld
if "%shellmode%" == "startNew" goto startNew
echo INDEX ERROR
pause
exit
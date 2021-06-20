::==============================
::=            Welcome to the batShell            =
::==============================


@echo off
cls
set startdir=%~p0
set startshell=%0
call "%~p0\cfg\theme.cmd"
set theme="%startdir%\cfg\themes\%themename%"
set theme=%theme:"=%
::this is to get the themes enviroment values
call "%theme%" values
call "%~p0\cfg\autoexec.cmd"

if "%input%" == "" goto startold
if "%output%" == "" goto startold
goto startNew

:startOld
set exec=
echo ^#---%cd%--^>
set /p exec="#---ThemeError---> "
call "%~p0\cfg\index.cmd"
echo.
goto startOld

:startNew
set exec=
call "%theme%" output "%cd%"
call "%theme%" input exec "%shelltext%"
call "%startdir%\cfg\index.cmd"
echo.
goto startNew




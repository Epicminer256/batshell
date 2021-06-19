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
call %theme% values
call "%~p0\cfg\autoexec.cmd"

:start
set exec=
call "%theme%" output "%cd%"
call "%theme%" input exec "%shelltext%"
call "%startdir%\cfg\index.cmd"
echo.
goto start




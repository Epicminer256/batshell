::=====================================================
::=            Welcome to the batShell conf           =
::=====================================================


@echo off
cls
set startdir="%HOMEDRIVE%""%~p0"
set startshell="%HOMEDRIVE%""%0"
set startdir=%startdir:"=%
set startshell=%startshell:"=%

call "%~p0\cfg\autoexec.cmd"

:start
set exec=
echo ^#---%cd%--^>
set /p exec="#------> "
call "%~p0\cfg\index.cmd"
echo.
goto start




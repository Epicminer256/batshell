::=====================================================
::=            Welcome to the batShell conf           =
::=====================================================


@echo off
cls
set startdir=%~p0
set startshell=%0
call "%~p0\cfg\autoexec.cmd"

:start
set exec=
echo ^#---%cd%--^>
set /p exec="#------> "
call "%~p0\cfg\index.cmd"
echo.
goto start




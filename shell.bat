::=====================================================
::=            Welcome to the batShell conf           =
::=====================================================


@echo off
cls
title Loading...
::This is for compatability purpouses so you can make a program
::that will exit if batShell is outdated or overdated
::If you make your own verson of batShell, change the provider tag
set batshellver=1.1
set patchnum=1
set provider=batShell

set startdir="%HOMEDRIVE%""%~p0"
set startshell="%0"
set startdir=%startdir:"=%
set startshell=%startshell:"=%

call "%~p0\cfg\autoexec.cmd"
title batShell

:start
set exec=
echo ^#---%cd%--^>
set /p exec="#------> "
title batShell =%exec%=
call "%~p0\cfg\index.cmd"
echo.
title batShell -%exec%-
goto start




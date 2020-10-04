@echo off
cd %HOMEPATH%
::This is a test project of my cmd script 
::that makes it more customizable and easy to use.

::Have fun I guess

:intro

::Message when you open up bashshell
cls
echo Welcome To Bash Shell
echo Today is %DATE%
echo You are the user "%USERNAME%" on computer %COMPUTERNAME%
echo With %NUMBER_OF_PROCESSORS% cpus
echo.

:start
set exec=
::echos prompt and stores output in a value "exec"
echo ^#---%cd%--^>
set /p exec="#------> "

:indec

::searches for certain commands and if the command isnt here, just use cmd instead
if "%exec%" == "ls" goto ls
if "%exec%" == "help" goto help
if "%exec%" == "reset" goto reset
if "%exec%" == "clear" goto clear
if "%exec%" == "cd ~/" goto homedir
if "%exec%" == "cdconf" goto cdconf
if "%exec%" == "editconf" goto editconf
if "%exec%" == "app" goto startapp
goto exec

:exec
%exec%
echo.
goto start

::every command and what it executes

:help
echo Welcome to the help section
echo.
echo.
echo Help:
echo Brings up this menu
echo.
echo ls:
echo same as dir
echo.
echo reset:
echo restarts batshell so that way Keybinds can 
echo be changed without reopening
echo.
echo editconf:
echo pulls up a notepad window with the batch config
echo which then you can reset it with the 
echo command "reset"
echo.
echo app:
echo this will launch a program or app on
echo your computer like chrome or firefox
echo.
echo also cd ~/ works, but cd ~/dirname/
echo doesnt work yet
echo.
goto start

:ls
dir
goto start

:clear
cls
goto start

:reset

::this value is where this batch script is located, and since it is by itself it
::will exicute it instead
%0

:homedir
cd %HOMEPATH%
goto start

:editconf
notepad %0
goto start

:cdconf
cd %~p0
goto start

:startapp
set current=%cd%
echo ^#---What do you want to launch--^>
set /p app="#------> "
cd %~p0
if "%app%" == "" goto resetappcommand
start %app%
goto resetappcommand
:resetappcommand
cd %current%
set app=
set current=
goto start



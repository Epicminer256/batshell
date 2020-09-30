@echo off
:intro

::Message when you open up bashshell
cls
echo Welcome To Bash Shell
echo Today is %DATE%
echo You are the user "%USERNAME%" on computer %COMPUTERNAME%
echo With %NUMBER_OF_PROCESSORS% cpus
echo.

:start

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
if "%exec%" == "editconf" goto editconf
goto exec

:exec
%exec%
echo.
goto start

::every command and what it executes

:help
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
echo also ~/ works, but ~/dirname/
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
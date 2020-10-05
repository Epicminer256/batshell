::=====================================================
::=            Welcome to the batShell conf           =
::=====================================================
::If you are looking to add your command, there are two different ways...
::
::1.) make a batch file where batShell is located and launch it using the "app" command
::
::2.) Manualy edit a command below so you dont have to use the app command

@echo off
cd %HOMEPATH%
cls
echo Welcome To Bash Shell
echo Today is %DATE%
echo You are the user "%USERNAME%" on computer %COMPUTERNAME%
echo With %NUMBER_OF_PROCESSORS% cpus
echo.
::everything above is executed when 
::batShell is launched or reset


::This is your prompt
:start
set exec=
::echos prompt and stores output in a value "exec"
echo ^#---%cd%--^>
set /p exec="#------> "

:indec


::RIGHT HERE IS WHERE YOU MAKE YOUR OWN COMMANDS EMBEDDED INTO BATSHEL
::If you are adding a command, make it here.
::If it contains multable lines, make it execute your function
::To make a function, look on the bottem of this conf
if "%exec%" == "ls" goto ls
if "%exec%" == "help" goto help
if "%exec%" == "reset" goto reset
if "%exec%" == "clear" goto clear
if "%exec%" == "cd ~/" goto homedir
if "%exec%" == "cdconf" goto cdconf
if "%exec%" == "editconf" goto editconf
if "%exec%" == "app" goto startapp
if "%exec%" == "debug" goto debug
::command templet
::  if "%exec%" == "functionname" goto functionname

goto exec


::executes command and brings the prompt back
:exec
%exec%
echo.
goto start



::EVERYTHING BELLOW THIS IS ALL FUNCTIONS

::the help section [If this project gets forked, add
::some help info here]
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
echo restarts batshell so that way commands can 
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
echo debug:
echo turns on echo so you can see what commands the
echo shell is launching as you use it
echo (NOT RECOMMENDED FOR REGULAR USE)
echo.
echo.
echo also cd ~/ works, but cd ~/dirname/
echo doesnt work yet, maybe in the future it
echo will be work by default
echo.
goto start

::every command is bellow and what it executes


::makes ls act like dir
:ls
dir
goto start

::make clear act as cls
:clear
cls
goto start


::restart the bash shell [for if you edit the conf file]
:reset

::this value is where this batch script is located, and since it is by itself it
::will exicute it instead
%0

:: makes ~/ work
:homedir
cd %HOMEPATH%
goto start

::opens up batshell notepad
:editconf
notepad %0
goto start

::changes directory into the one batshell is in
:cdconf
cd %~p0
goto start

::launches a program on your computer or a program
::that is in the same folder as batshell
:startapp
set current=%cd%
::promps what app to launch
echo ^#---What do you want to launch--^>
set /p app="#------> "
cd %~p0
::checkes if the app that is requesting to launch isnt blank
if "%app%" == "" goto resetappcommand
::launches app
start %app%
goto resetappcommand
::prepares the app command for next use and brings shell back to promt
:resetappcommand
cd %current%
set app=
set current=
goto start

::this will turn echo on
:debug
@echo on
goto start






::add your functions here, here is a small little templete
::to get yourself started
::
::  :functionname
::  echo command here
::  goto start


::For example
::I can set a command to the "Z" drive,
::change directory into a folder named "folder",
::and execute a jar file in java
::
::  :serverlaunch
::  Z:
::  cd Z:\folder\
::  java -jar javafile.jar
::  goto start

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

if exist "%~p0\apps" goto start
mkdir %~p0\apps

::This is your prompt
:start
set exec=
::echos prompt and stores output in a value "exec"
echo ^#---%cd%--^>
set /p exec="#------> "

:indec

::This will see if the command entered is the command that a function is assigned
::If you are adding a command, assign it here to launch your function
::
::command templet
::  if "%exec%" == "functionname" goto functionname
if "%exec%" == "ls" goto ls
if "%exec%" == "help" goto help
if "%exec%" == "reset" goto reset
if "%exec%" == "clear" goto clear
if "%exec%" == "cd ~/" goto homedir
if "%exec%" == "cdconf" goto cdconf
if "%exec%" == "editconf" goto editconf
if "%exec%" == "app" goto startapp
if "%exec%" == "debug" goto debug
if "%exec%" == "addapp" goto addapp

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
echo addapp:
echo will add a app as a script for cmd
echo aka a batch file
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
cd apps
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

::changes directory into the one batshell is in
:addapp
set addapp=
set appc=
set current=%cd%
cd %~p0
if exist "apps" goto nameapp
mkdir apps
:nameapp
cd apps
echo ^#---What name is the app-------^>
set /p addapp="#------> "
echo ^#---Type out the script that it---------^>
echo ^#---launches when you start it up.------^>
echo ^#---type !done when finished------------^>
echo.> %addapp%.bat
:appeditor
set /p appc="#------> "
if "%appc%" == "!done" goto doneedit
echo %appc%>> %addapp%.bat
goto appeditor
:doneedit
set addapp=
set appc=
cd %current%
echo .
echo ^#---now type 'app' to launch it---------^>
goto start

::add your functions here, here is a templete

::  :functionname
::  command(s) to launch
::  goto start

::For example
::I can set a command to the "Z" drive,
::change directory into a folder named "folder",
::and execute a jar file in java

::  :serverlaunch
::  Z:
::  cd Z:\folder\
::  java -jar javafile.jar
::  goto start

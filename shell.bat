::=====================================================
::=            Welcome to the batShell conf           =
::=====================================================
::If you are looking to add your command, there are two different ways...
::
::1.) put a file that you want to launch where the apps folder  is located and 
::launch it using the "app" command
::
::2.) Manualy edit a command below so you dont have to use the app command
::2a.) first make a command that leads to a function
::2b.) make a function

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




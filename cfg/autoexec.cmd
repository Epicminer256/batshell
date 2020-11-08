::Uncomment the line below this one to debug the shell
::echo on

::brings you to your home folder instead of system32
cd %HOMEPATH%

::changes the color of the prompt
color 0A

::brings up some starting text
call "%~p0\prompt.cmd"
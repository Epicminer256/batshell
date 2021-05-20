::Uncomment the line below this one to debug the shell
::echo on

::brings you to your home folder instead of system32
cd %HOMEPATH%

::changes the color of the prompt
color 07

::brings up some starting text
::edit "cfg/prompt.cmd" for a custom startup prompt
call "%startdir%cfg\prompt.cmd"


::Add other startup programs and scripts here

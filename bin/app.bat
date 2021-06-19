set addapp=

:nameapp
call "%theme%" output "What name is the app"
call "%theme%" input addapp "app name"
echo.
if "%addapp%" == "" goto end
if exist "%startdir%\bin\%addapp%.bat" goto appedit
echo. > "%startdir%\bin\%addapp%.bat"

:appedit
call "%theme%" output "Make the app with this notepad window, close it to edit the manual"
echo.
notepad "%startdir%\bin\%addapp%.bat"
if exist "%startdir%\cfg\manual\%addapp%.man" goto manedit
echo %addapp%: > "%startdir%\cfg\manual\%addapp%.man"
echo. >> "%startdir%\cfg\manual\%addapp%.man"

:manedit
call "%theme%" output "Now you are editing the manual file"
echo.
notepad "%startdir%\cfg\manual\%addapp%.man"
echo.
call "%theme%" output "Your command is now made, you can now execute %addapp% to launch it"
call "%theme%" output "also you can use command "app" and type your app name again to resume your editing"

:end
set addapp=

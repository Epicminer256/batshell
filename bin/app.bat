set addapp=

:nameapp
call "%theme%" output "What name is the app"
call "%theme%" input addapp "app name"
echo.
if "%addapp%" == "" goto end
if exist "%bin%\%addapp%.bat" goto appedit
echo. > "%bin%\%addapp%.bat"

:appedit
call "%theme%" output "Make the app with this notepad window, close it to edit the manual"
echo.
notepad "%bin%\%addapp%.bat"
if exist "%cfg%\manual\%addapp%.man" goto manedit
echo %addapp%: > "%cfg%\manual\%addapp%.man"
echo. >> "%cfg%\manual\%addapp%.man"

:manedit
call "%theme%" output "Now you are editing the manual file"
echo.
notepad "%cfg%\manual\%addapp%.man"
echo.
call "%theme%" output "Your command is now made, you can now execute %addapp% to launch it"
call "%theme%" output "also you can use command "app" and type your app name again to resume your editing"

:end
set addapp=

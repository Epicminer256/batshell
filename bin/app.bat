set addapp=
set appc=

:nameapp
echo ^#---What name is the app-------^>
set /p addapp="#------> "
if "%addapp%" == "" goto end
if exist "%startdir%\bin\%addapp%.bat" goto appedit
echo. > %startdir%\bin\%addapp%.bat

:appedit
echo Make the app with this notepad window, close it to edit the manual
notepad %startdir%\bin\%addapp%.bat
if exist "%startdir%\cfg\manual\%addapp%.man" goto manedit
echo %addapp%: > %startdir%\cfg\manual\%addapp%.man
echo. >> %startdir%\cfg\manual\%addapp%.man

:manedit
echo Now you are editing the manual file
notepad %startdir%\cfg\manual\%addapp%.man
echo.
echo Your command is now made, you can now type "%addapp%" to launch it
echo.
echo also you can use command "app" and type your app name again to resume your editing


:end
set addapp=
set appc=
set addapp=
set appc=
set current=%cd%
:nameapp
cd apps
echo ^#---What name is the app-------^>
set /p addapp="#------> "
if exist "%~p0\%addapp%.bat" goto appedit
echo. > %addapp%.bat
:appedit
notepad %addapp%.bat
set addapp=
set appc=
cd %current%
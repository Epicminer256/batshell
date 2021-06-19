set themeName=

:nameapp
call "%theme%" output "What name is the theme"
call "%theme%" input themeName "ThemeName"
echo.
if "%themeName%" == "" goto end
if exist "%startdir%\cfg\themes\%themeName%.cmd" goto themeedit
echo. > "%startdir%\cfg\themes\%themeName%.cmd"

:themeedit
call "%theme%" output "Make the theme with this notepad window, close it to edit the manual"
echo.
notepad "%startdir%\cfg\themes\%themeName%.cmd"
call "%theme%" output "Your theme is now made, you can now use it"

:end
set themeName=
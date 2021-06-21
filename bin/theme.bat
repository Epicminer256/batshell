set themeName=

:nameapp
call "%theme%" output "What name is the theme"
call "%theme%" input themeName "ThemeName"
echo.
if "%themeName%" == "" goto end
if exist "%themedir%\%themeName%.cmd" goto themeedit
echo. > "%themedir%\%themeName%.cmd"

:themeedit
call "%theme%" output "Make the theme with this notepad window, close it to edit the manual"
echo.
notepad "%themedir%\%themeName%.cmd"
call "%theme%" output "Your theme is now made, you can now use it"

:end
set themeName=
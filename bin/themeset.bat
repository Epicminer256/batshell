if "%1" == "" goto fail
set name=%1
set name=%name:"=%
echo set themename=%name%.cmd>"%startdir%\cfg\theme.cmd" 
"%startdir%\bin\reset.bat"
echo RESTART FAILED, manualy restart batShell so the theme can be set
goto done

:fail
echo Try putting a parameter in
echo.
echo Example
echo themeset default
goto done

:done
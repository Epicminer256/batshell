if "%1" == "" goto fail
set name=%1
set name=%name:"=%
echo set themename=%name%.cmd>"%startdir%\cfg\theme.cmd" 
echo Theme has been set
goto done

:fail
echo Try putting a parameter in
echo.
echo Example
echo themeset default
goto done

:done
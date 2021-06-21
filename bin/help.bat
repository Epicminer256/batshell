if "%1" == "" goto helpall
goto helpapp

:helpall
echo.
for /f "delims=" %%a in ('dir /B "%cfg%\manual\*.man"') do more "%cfg%\manual\%%a" && echo.
goto done

:helpapp
more "%cfg%\manual\%1.man"
goto done

:done
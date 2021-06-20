if "%1" == "" goto helpall
goto helpapp

:helpall
echo.
for /f "delims=" %%a in ('dir /B "%startdir%\cfg\manual\*.man"') do more "%startdir%\cfg\manual\%%a" && echo.
goto done

:helpapp
more "%startdir%\cfg\manual\%1.man"
goto done

:done
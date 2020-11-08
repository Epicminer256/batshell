echo.
for /f "delims=" %%a in ('dir /B %startdir%\cfg\manual\*.man') do more %startdir%\cfg\manual\%%a && echo.
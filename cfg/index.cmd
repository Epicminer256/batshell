::searches for batch files in the bin dir
for /f "delims=" %%a in ('dir /B %startdir%\bin\*.bat') do if "%exec%.bat" == "%%a" %startdir%\bin\"%%a"
::searches for lnk files in the bin dir
for /f "delims=" %%a in ('dir /B %startdir%\bin\*.lnk') do if "%exec%.lnk" == "%%a" %startdir%\bin\"%%a"
%exec%
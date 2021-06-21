::grabs first line of input
for /F %%G IN ("%exec%") do set "exec1=%%G"

::searches for .BAT files in the bin dir
if exist "%startdir%\bin\%exec1%.bat" goto execapp
if exist "%startdir%\bin\%exec1%.exe" goto execapp
if exist "%startdir%\bin\%exec1%.cmd" goto execapp
if exist "%startdir%\bin\%exec1%.lnk" goto execapp
if exist "%startdir%\bin\%exec1%" goto execapp

:Dont remove this command
::searches for exact same named files in the bin dir
for /f "delims=" %%a in ('dir /B %startdir%\bin\*') do if "%exec%" == "%%a" "%startdir%bin\%%a"
goto execprog

:execapp
"%startdir%bin\"%exec%
goto end

:execprog
%exec%
goto end


:end

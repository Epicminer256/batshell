::You might need to comment/uncomment file types 
::(example: if there isnt at least one .lnk file in the bin folder, it will pull a “File Not Found” error)

::grabs first line of input
for /F %%G IN ("%exec%") do set "exec1=%%G"


::searches for .BAT files in the bin dir
for /f "delims=" %%a in ('dir /B "%startdir%\bin\"') do if "%exec1%.bat" == "%%a" "%startdir%bin\"%exec%


::searches for .LNK files in the bin dir
::UNCOMMENT NEXT LINE IF YOU HAVE ANY LINK FILES, COMMENT IT IF YOU DONT HAVE ANY
for /f "delims=" %%a in ('dir /B "%startdir%\bin\"') do if "%exec1%.lnk" == "%%a" "%startdir%bin\"%exec%


::searches for .EXE files in the bin dir
::UNCOMMENT NEXT LINE  IF YOU HAVE EXE FILES, COMMENT IT IF YOU DONT HAVE ANY
for /f "delims=" %%a in ('dir /B "%startdir%\bin\"') do if "%exec1%.exe" == "%%a" "%startdir%bin\"%exec%


::searches for .CMD files in the bin dir
::UNCOMMENT NEXT LINE  IF YOU HAVE EXE FILES, COMMENT IT IF YOU DONT HAVE ANY
for /f "delims=" %%a in ('dir /B "%startdir%\bin\"') do if "%exec1%.exe" == "%%a" "%startdir%bin\"%exec%


:Dont remove this command
::searches for exact same named files in the bin dir
for /f "delims=" %%a in ('dir /B %startdir%\bin\*') do if "%exec%" == "%%a" "%startdir%bin\%%a"

%exec%
:end

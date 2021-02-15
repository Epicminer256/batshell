::You might need to comment/uncomment file types 
::(example: if there isnt at least one .lnk file in the bin folder, it will pull a “File Not Found” error)
::
::So if you are not dealing with links, Comment out the line below (searches for .LNK files)



::searches for .BAT files in the bin dir
for /f "delims=" %%a in ('dir /B %startdir%\bin\*.bat') do if "%exec%.bat" == "%%a" "%startdir%bin\%%a"


::searches for .LNK files in the bin dir
for /f "delims=" %%a in ('dir /B %startdir%\bin\*.lnk') do if "%exec%.lnk" == "%%a" "%startdir%bin\%%a"



::searches for .EXE files in the bin dir
::Uncomment the text bellow for EXE file support
::for /f "delims=" %%a in ('dir /B %startdir%\bin\*.exe') do if "%exec%.exe" == "%%a" "%startdir%bin\%%a"





:Dont remove this command
::searches for exact same named files in the bin dir
for /f "delims=" %%a in ('dir /B %startdir%\bin\*') do if "%exec%" == "%%a" "%startdir%bin\%%a"

%exec%
:end
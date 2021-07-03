mkdir "%cfg%\temp\" > NUL 2> NUL
mkdir "%cfg%\temp\pack\" > NUL 2> NUL
:check2

call "%theme%" output "What app do you want to pack?"
call "%theme%" input appname "pack app"
echo.
if "%appname%" == "" goto end

mkdir "%cfg%\temp\pack\bin\" > NUL 2> NUL
xcopy /s /e "%bin%\%appname%.bat" "%cfg%\temp\pack\bin\"
mkdir "%cfg%\temp\pack\cfg\" > NUL 2> NUL
mkdir "%cfg%\temp\pack\cfg\manual\" > NUL 2> NUL
xcopy /s /e "%cfg%\manual\%appname%.man" "%cfg%\temp\pack\cfg\manual"

:pack
echo Packing...
echo.
set current="%cd%"
cd "%cfg%\temp\pack\"
tar -cvf "%startdir%\%appname%.tar" "*"
del /S /Q "%cfg%\temp\pack\*" > NUL 2> NUL
cd %current%
echo Done
:end

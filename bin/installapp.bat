mkdir "%cfg%\temp\" > NUL 2> NUL
mkdir "%cfg%\temp\install\" > NUL 2> NUL
:check2

call "%theme%" output "What app do you want to install?"
call "%theme%" output "List absolute file path here (drag the file in this prompt and add quotes)"
call "%theme%" input appname "pack app"
echo.
if "%appname%" == "" goto end

:pack
echo Installing...
echo.
set current="%cd%"
cd "%cfg%\temp\install\"

tar -xf "%appname%"

xcopy /s /e "%cfg%\temp\install\bin\*" "%bin%\"
xcopy /s /e "%cfg%\temp\install\cfg\*" "%cfg%\"

del /S /Q "%cfg%\temp\install\*" > NUL 2> NUL

cd %current%
echo Done
:end
 

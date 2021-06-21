if "%1" == "input" goto input
if "%1" == "output" goto output
if "%1" == "values" goto values
goto fail

:values
set input=1
set output=1
set shelltext=%USERNAME%
goto end

:output
set prompttext=%2
set prompttext=%prompttext:"=%
echo --^=^[%prompttext%^]^=--
goto end

:input
set prompttext=%3
set prompttext=%prompttext:"=%
set /p %2="--=[%prompttext%]=> "
goto end

:fail
echo Theme Failed, Is your params set right?
goto end




:end
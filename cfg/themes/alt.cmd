set prompttext=


::if checks
if "%1" == "input" goto input
if "%1" == "help" goto help
if "%1" == "output" goto output
if "%1" == "values" goto values
goto fail

:input
set prompttext=%3%4%5%6%7%8%9
set prompttext=%prompttext:"=%
set /p %2="#---%prompttext%---# "
goto done

:output
set prompttext=%2%3%4%5%6%7%8%9
set prompttext=%prompttext:"=%
echo ^#^<---%prompttext%---^>
goto done


:help
echo help:
echo Displays this page
echo.
echo input:
echo asks user for a input
echo theme.cmd input 1 2
echo where 1 represents the value you want the input stored
echo and 2 is what the prompt will say
echo.
echo display:
echo displays text
echo theme.cmd display 1
echo where 1 is the text you wanna show on screen
goto done

:values
::These are compatibility values, mainly for compatibility on a lot of apps 
::and for certain apps to take avantage of certain themes
set input=1
set output=1
color 0a
goto done

:fail
echo Theme Failed To Launch
echo Try theme.cmd help
pause

:done
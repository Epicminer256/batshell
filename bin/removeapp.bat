call "%theme%" output "What is the app that you wanna remove?"
call "%theme%" input appname "remove app"

call "%theme%" output "Are you sure?"
pause

del "%bin%\%appname%.bat"
del "%cfg%\manual\%appname%.man"

echo done
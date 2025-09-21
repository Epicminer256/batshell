::Uncomment the line below this one to debug the shell
::echo on

::brings you to your home folder instead of system32
cd "%HOMEPATH%"
::this is the command line prompt text, set this to some text if desired
::set shelltext=


::brings up some starting text
echo Machine %COMPUTERNAME% on %SessionName% logged in as "%USERNAME%"
echo %DATE%
echo.
echo Welcome To batShell
echo To get started type "help"
echo.


::Add other startup programs and scripts here

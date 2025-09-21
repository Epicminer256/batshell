if "%1" == "on" goto on
if "%1" == "off" goto off

:on
@echo on
goto done

:off
@echo off
goto done

:done
@echo off
mode con cols=120 lines=30
color 0f
cls

:start
set /p filename=[4mfst[0m [0m([31mfile[0m) ^> 
echo file =^> %filename%
set /p searchPath=[4mfst[0m [0m([31mpath[0m) ^> 
echo path =^> %searchPath%
ping localhost -n 2 >nul

set foundFilePath=

FOR /R %searchPath% %%a in (%filename%) DO (
    IF EXIST "%%~fa" ( 
        SET foundFilePath=%%~fa
    )
)

IF EXIST %foundFilePath% (
    echo.
    echo [0m[[32m+[0m] Sucessfully Found File [4m%filename%[0m In [4m%foundFilePath%[0m
    echo.
    goto start
) else (
    echo.
    echo [0m[[31m-[0m] Unable to Locate File [4m%filename%[0m
    echo.
    goto start
)
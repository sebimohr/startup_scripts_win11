@echo off

set currentDir=%~dp0
set targetFile=%currentDir%/startup.bat
set pshScript=psh_startup_script.ps1

SETLOCAL ENABLEDELAYEDEXPANSION
(
    for /f "tokens=*" %%x in (startup.bat) do (
        @REM echo %%x
        set line=%%~nx
        @REM if !line:~4:13!=="startupFolder" (
            @REM echo hello
            @REM echo set startupFolder=%currentDir%/%pshScript%/testtesttest
        @REM ) else if !line!=="" (
            @REM echo.
        @REM ) else (
            echo !line!
        @REM )
    )
) 

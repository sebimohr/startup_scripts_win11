@echo off

set currentDir=%~dp0
set targetFile=%currentDir%/startup.txt
set pshScript=psh_startup_script.ps1

(
    for /f "tokens=* delims=" %%x in (startup.txt) do (
        echo %%x
        set line=%%x
        @REM if %line:~4:13%=="startupFolder" (
            @REM echo set startupFolder=%currentDir%/%pshScript%/testtesttest
        @REM ) else (
            @REM echo %line% s
        @REM )
    )
)

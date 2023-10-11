@echo off
set startupFolder=%USERPROFILE%\.startup

set currDate=%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%
set currTime=%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set logFolder=%startupFolder%\logs
if not exist %logFolder% (
    mkdir %logFolder%
)

PowerShell %startupFolder%\psh_startup_script.ps1 | tee "%logFolder%\%currDate%_%currTime%_log.log"

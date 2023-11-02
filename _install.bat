@echo off

call :permissionCheck
call :cosmeticPause
call :startupBatCreation
call :cosmeticPause
call :movingStartupBat
call :cosmeticPause
call :defaultFolderCreation

echo The script has completed the installation!
timeout /t 5

GOTO exitScript

:permissionCheck
    echo Checking permissions...

    net session >nul 2>&1
    if not %errorLevel% == 0 GOTO noAdminRights

    call :cosmeticPause
    echo Permission check successful!
EXIT /B 0

:noAdminRights
    echo Please start the script with the appropriate rights!
    echo Read the README.md!
    pause
GOTO exitScript

:startupBatCreation
    set currentDir=%~dp0
    set targetFile=%currentDir%/startup.bat

    echo Creating startup.bat with correct directory declaration...

    SETLOCAL ENABLEDELAYEDEXPANSION
    (
        for /f "delims=" %%A in (%targetFile%) do (
            set line=%%~A
            if "!line:~0,17!"=="set startupFolder" (
                echo set startupFolder=%currentDir:~0,-1%
            ) else if !line!=="" (
                echo.
            ) else (
                echo !line!
            )
        )
    ) > temp.bat
    call :cosmeticPause

    echo Creation of startup.bat finished.
EXIT /B 0

:movingStartupBat
    echo Moving startup.bat to autostart folder...

    move temp.bat "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Startup\startup.bat"
    call :cosmeticPause

    echo Startup.bat has been successfully moved to the startup folder.
EXIT /B 0

:defaultFolderCreation
    mkdir res
EXIT /B 0

:cosmeticPause
    TIMEOUT /t 1 /nobreak >nul
EXIT /B 0

:exitScript
    exit

# Startup Scripts Win11

Welcome to my __Startup Scripts Win11__ repository.

## Purpose

The startup script will run on autoStart to exit processes that have to run once but then can be closed.

## Installation

After cloning the repo first open your local autostart directory.
You can do this by pressing `Win + R` and running the command `shell:common startup`.
Your local autostart directory should open in the explorer.
Then you can move the `startup.bat` file to the autostart directory.

The `startup.bat` file runs when your PC is starting as an _Startup app_.
Its only purpose is to execute the local copy of the `startup_script.ps1`.
If you don't have the repo checked out in your local user profile directory,
you have to change the path that's included in the second line of the `startup.bat`.

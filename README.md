# Startup Scripts Win11

Welcome to my __Startup Scripts Win11__ repository.

## Purpose

The startup script will run on autoStart to exit processes and services that have to run once but then can be closed.

The `startup.bat` file runs when your PC is starting as an _Startup app_.
Its only purpose is to execute the local copy of the `psh_startup_script.ps1`.

## Installation

After cloning the repo you have to run the `_install.bat` script as an administrator.
This script will create the necessary files and the directory structure for the script execution.
The `_install.bat` needs administrator rights or else it won't be able to copy the `startup.bat` file
to the autostart directory.

If you want to do this by yourself, you can also follow the instructions below.

### Installation without script

After cloning the repo first open your local autostart directory.
You can do this by pressing `Win + R` and running the command `shell:common startup`.
Your local autostart directory should open in the explorer.
Then you can move the `startup.bat` file to the autostart directory.

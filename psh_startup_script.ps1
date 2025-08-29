<# 
let user decide if work- or gamemode should be executed
work mode:
    - start terminal
    - start vscode
    - start OneDrive
    - start Outlook
    - ... 

game mode:
    - start Discord
    - start steam
    - start epic games?
    - ...
#>

function Stop-Process-From-List {
    param (
        [String]$process 
    )

    if ($process[0] -eq '#') {
        return
    }

    for ($i = 0; $i -lt 2; $i++) {
        $runningProcess = Get-Process -Name $process -ErrorAction SilentlyContinue

        if ($runningProcess) {
            Write-Output "Stopping Process '${process}'"
            $runningProcess.Kill()

            if (-Not $runningProcess.HasExited) {
                $runningProcess | Stop-Process -Force -ErrorAction SilentlyContinue
            }
            break
        }

        Write-Warning "Didn't find Process '${process}', trying again..."
        TIMEOUT /t 3
    }
}

Write-Output "Running startup script"
Write-Output "Waiting a few seconds to let the computer fully start..."
TIMEOUT /t 5

$processFileName = $PSScriptRoot + "./res/process.txt"
$processesToStop = Get-Content -Path $processFileName
foreach ($process in $processesToStop) {
    Stop-Process-From-List $process
    Start-Sleep -Milliseconds 500
}

Write-Output "Finished startup script, shutting down..."

TIMEOUT /t 5

exit

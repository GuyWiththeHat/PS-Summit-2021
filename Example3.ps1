[CmdletBinding()]
Param([String[]]$ComputerName)
### Using CIM - get the last reboot time from Win32_OperatingSystem.  Writing out warnings
### about the computers that failed.
$Parameters = @{
    ClassName           = 'Win32_OperatingSystem'
    ComputerName        = $ComputerName 
    OperationTimeoutSec = 30
    ErrorAction         = 'SilentlyContinue'
    ErrorVariable       = 'ErrCIM'
}

Get-CIMInstance @Parameters | 
   Select-Object @{N = 'ComputerName'; E = { $_.CSName } }, LastBootupTime
If ($errCIM) {
    $WarningString = "The following systems had errors:`n{0}" -F
        ($errCim | Select-Object @{N = 'ComputerName'; E = { $_.OriginInfo.PSComputerName } } | 
        Select-Object -ExpandProperty ComputerName | Out-String)
    Write-Warning $WarningString
} #If
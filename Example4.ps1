[CmdletBinding()]
Param([String[]]$ComputerName)
### Using CIM - get the last reboot time from Win32_OperatingSystem.  Add on a status property
### for success.  Create objects for all the failed computers.
$Parameters = @{
    ClassName           = 'Win32_OperatingSystem'
    ComputerName        = $ComputerName 
    OperationTimeoutSec = 30
    ErrorAction         = 'SilentlyContinue'
    ErrorVariable       = 'ErrCIM'
}
Get-CIMInstance @Parameters | 
    Select-Object @{N = 'ComputerName'; E = { $_.CSName } },
        @{N = 'Status'; E = { 'Connected' } }, LastBootupTime
If ($errCIM) {
    $errCim | 
        Select-Object @{N = 'ComputerName'; E = { $_.OriginInfo.PSComputerName }}, 
            @{N='Status';E={'Disconnected'}}, @{N='LastBootupTime';E={''}}
} #If
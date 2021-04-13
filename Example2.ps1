[CmdletBinding()]
Param([String[]]$ComputerName)
### Using CIM - get the last reboot time from Win32_OperatingSystem.  Suppress all errors.  
### No - this is not a good thing!
### Why?  End user thinks that everything is good - and there are no issues.  Which is wrong!
$Parameters = @{
    ClassName  = 'Win32_OperatingSystem'
    ComputerName  = $ComputerName 
    OperationTimeoutSec = 30
    ErrorAction = 'SilentlyContinue'
}

Get-CIMInstance @Parameters | 
    Select-Object @{N = 'ComputerName'; E = { $_.CSName } }, LastBootupTime

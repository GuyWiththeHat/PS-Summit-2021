### Example1.ps1
[CmdletBinding()]
Param([String[]]$ComputerName)
### Using CIM - get the last reboot time from Win32_OperatingSystem.  No error handling.
Get-CIMInstance -ClassName Win32_OperatingSystem -ComputerName $ComputerName -OperationTimeoutSec 30 | 
    Select-Object @{N = 'ComputerName'; E = { $_.CSName } }, LastBootupTime
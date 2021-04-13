### ParameterValidationIPv4.ps1
[CmdletBinding()]
Param (
    [ValidatePattern('\b((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\.|$)){4}\b')]
    [String]$IPv4Address
)
Write-Output $IPv4Address
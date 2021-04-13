### BetterParameterValidationIPv4.psm1
Function Test-IPv4Address {
    Param(
        [String]$IPv4Address
    )
    If ($_ -match '\b((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\.|$)){4}\b') {
        $True
    }
    Else {
        Throw "$_ is not a valid IPv4 address."
    }
} #Function
Function New-IPv4Address {
    [CmdletBinding()]
    Param (
        [ValidateScript( { Test-IPv4Address -IPv4Address $_ })]
        [String]$IPv4Address
    )
    Write-Output $IPv4Address
}
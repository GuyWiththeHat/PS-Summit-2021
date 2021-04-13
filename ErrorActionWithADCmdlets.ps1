### ErrorActionWithADCmdlets.ps1
[CmdletBinding()]
Param()
Try {
    Get-ADUser nonexistentuser -ErrorAction Stop
    Write-Output "You shouldn't see this if Get-ADUser is working correctly"
    Get-Command Get-ADUser
}
Catch {
    Write-Output 'Get-ADUser threw a stop error'
}
### Example6.ps1
[CmdletBinding()]
Param()
Write-Output "Original value of ErrorActionPreference: $ErrorActionPreference"
$OrgErrorActionPreference = $ErrorActionPreference
$ErrorActionPreference = 'Stop'
Try {
    Get-ADUser nonexistentusertwo 
} #Try
Catch {
    Write-Error "$_"
} #Catch
Finally {
    $ErrorActionPreference = $OrgErrorActionPreference
    Write-Output "Finally value of ErrorActionPreference: $ErrorActionPreference"
} #Finally
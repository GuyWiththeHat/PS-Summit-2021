### TerminatingError.ps1
[CmdletBinding()]
Param()
Throw 'This is a terminating error'
Write-Output 'You will not see this!'
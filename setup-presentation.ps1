Function Start-PSv7Session {
    [CmdletBinding()]
    Param([String]$SessionHeader,
        [String]$Program
    )
    $StartInfo = New-Object System.Diagnostics.ProcessStartInfo
    $StartInfo.FileName = "C:\Program Files\PowerShell\7\pwsh.exe"
    If ($Program) {
        $StartInfo.Arguments = "-NoProfile -NoExit -File Start-PSv7Session.ps1 -Program $Program -SessionHeader $SessionHeader"
    }
    Else {
        $StartInfo.Arguments = "-NoProfile -NoExit"
    } #If
    [System.Diagnostics.Process]::Start($StartInfo) | Out-Null
}

$PresentationDirectory = 'C:\scripts\simonsr\Presentation\PSSummit2021'

### Create four PS v7 windows
Start-PSv7Session -Program 'Example1.ps1' -SessionHeader 'Example1'
Start-PSv7Session -Program 'Example2.ps1' -SessionHeader 'Example2'
Start-PSv7Session -Program 'Example3.ps1' -SessionHeader 'Example3'
Start-PSv7Session -Program 'Example4.ps1' -SessionHeader 'Example4'

### Make sure that the security group exists and has the right membership.
$CurrentUsers = Get-ADGroupMember 'Expenses Approval'
If ($NULL -eq $CurrentUsers) {
    $Users = Get-Content (Join-Path $PresentationDirectory 'users.txt')
    Add-ADGroupMember -Identity "Expenses Approval" -Members $Users
} #If
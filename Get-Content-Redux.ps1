### Get-Content-Redux.ps1
### Business flow.
### HR supplies a list of authorized users to approve expense claims in a file
### We process that file daily and make sure that the people in the group are the people in
### the file.
[CmdletBinding()]
Param(
    [Parameter(Mandatory = $true)]
    [String]$InputFile
)

Try {
    $AuthorizedUsers = Get-Content $InputFile -ErrorAction Stop
    $CurrentUsers = Get-ADGroupMember "Expenses Approval" -ErrorAction Stop
    Foreach ($User in $CurrentUsers) {
        If ($AuthorizedUsers -notcontains $User) {
            Remove-ADGroupMember -Identity "Expenses Approval" -User $User -ErrorAction Stop
        } #If
    } #ForEach
} #Try
Catch [System.Management.Automation.ItemNotFoundException] {
    Write-Error 'File not found'
} #Catch
Catch [System.UnauthorizedAccessException] {
    Write-Error 'Access denied'
} #Catch
Catch {
    Write-Error "Unexpected error:  $_"
} #Catch
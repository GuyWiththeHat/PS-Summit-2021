### Example5.ps1
### Business flow.
### HR supplies a list of authorized users to approve expense claims in a file
### We process that file daily and make sure that the people in the AD group are the people in
### the file.
[CmdletBinding()]
Param()
$AuthorizedUsers = Get-Content '\\FileServer\HRShare\UserList.txt'
$CurrentUsers = Get-ADGroupMember "Expenses Approval"

Foreach ($User in $CurrentUsers) {
    If ($AuthorizedUsers -notcontains $User) {
        Remove-ADGroupMember -Identity "Expenses Approval" -Member $User -Confirm:$FALSE
    } #If
} #ForEach
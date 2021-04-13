### Get-Content-Redux-Part3.ps1
### Business flow.
### HR supplies a list of authorized users to approve expense claims in a file
### We process that file daily and make sure that the people in the group are the people in
### the file.
[CmdletBinding()]
Param([String]$InputFile)

Try {
    $AuthorizedUsers = Get-Content $InputFile -ErrorAction Stop
    Try {
        $CurrentUsers = Get-ADGroupMember "Expenses Approval" -ErrorAction Stop -Server 'NoDC'
        Foreach ($User in $CurrentUsers) {
            If ($AuthorizedUsers -notcontains $User) {
                Remove-ADGroupMember -Identity "Expenses Approval" -User $User -ErrorAction Stop
            } #If
        } #ForEach
    } #Try
    Catch [Microsoft.ActiveDirectory.Management.ADServerDownException] {
        Write-Error 'Supplied AD server is down.'
    } #Catch 
    Catch [System.Management.Automation.RemoteException] {
        Write-Error 'Issue accessing AD'
    } #Catch
    Catch {
        Write-Error "Unexpected error accessing AD:  $_"
    } #Catch     
} #Try
Catch [System.Management.Automation.ItemNotFoundException] {
    Write-Error 'File not found'
} #Catch
Catch [System.UnauthorizedAccessException] {
    Write-Error 'Accessed denied'
} #Catch
Catch {
    Write-Error "Unexpected error:  $_"
} #Catch
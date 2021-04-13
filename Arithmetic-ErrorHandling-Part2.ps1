### Arithmetic-ErrorHandling-Part2.ps1
[CmdletBinding()]
Param(
    [int]$Number1,
    [int]$Number2
)

### Addition
$Add = $Number1 + $Number2
Write-Output ('{0} + {1} = {2}' -F $Number1, $Number2, $Add)

### Subtraction
$Subtraction = $Number1 - $Number2
Write-Output ('{0} - {1} = {2}' -F $Number1, $Number2, $Subtraction)

### Divide
Try {
    $Divide = $Number1 / $Number2
    Write-Output ('{0} / {1} = {2}' -F $Number1, $Number2, $Divide)
} #Try
Catch [System.Management.Automation.RuntimeException] {
    Write-Error ('Unable to divide {0} by {1}' -F $Number1, $Number2)
}
Catch {
    Write-Error "$_.  Unexpected error."
}
### Multiple
$Multiply = $Number1 * $Number2
Write-Output ('{0} * {1} = {2}' -F $Number1, $Number2, $Multiply)
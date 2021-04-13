### Arithmetic.ps1
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
$Divide = $Number1 / $Number2
Write-Output ('{0} / {1} = {2}' -F $Number1, $Number2, $Divide)

### Multiple
$Multiply = $Number1 * $Number2
Write-Output ('{0} * {1} = {2}' -F $Number1, $Number2, $Multiply)
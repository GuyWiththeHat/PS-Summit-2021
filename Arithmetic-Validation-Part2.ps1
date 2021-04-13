### Arithmetic-Validation-Part2.ps1
[CmdletBinding()]
Param(
    [Int]$Number1,
    [ValidateScript( {
            If ($_ -ne 0) {
                $True
            }
            Else {
                Throw "Number2 cannot equal 0."
            } #If
        })][Int]$Number2
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
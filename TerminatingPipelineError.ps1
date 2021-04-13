### TerminatingPipelineError.ps1
[CmdletBinding()]
Param()
$PresentationDirectory = 'C:\scripts\simonsr\Presentation\PSSummit2021'
Push-Location $PresentationDirectory
Get-Childitem | Where-Obect LastWriteTime -gt ((Get-Date).AddDays(-7)) | Sort-Object LastWriteTime
Write-Output 'After error line.'
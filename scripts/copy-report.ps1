[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0)]
    [ValidateNotNullOrEmpty()]
    [string]$ReportPath
)

$ErrorActionPreference = 'Stop'
$reportItem = Get-Item -LiteralPath $ReportPath
if ($reportItem.PSIsContainer -or $reportItem.Extension -ne '.md') {
    throw 'Report path must identify a Markdown file.'
}
$reportText = [System.IO.File]::ReadAllText($reportItem.FullName)
if ([string]::IsNullOrEmpty($reportText)) {
    throw 'Report is empty; clipboard was not changed.'
}
Set-Clipboard -Value $reportText
$clipboardText = Get-Clipboard -Raw
if (-not [string]::Equals($reportText, $clipboardText, [System.StringComparison]::Ordinal)) {
    throw 'Clipboard verification failed: content does not exactly match the report.'
}
Write-Output 'Report copied; exact clipboard equality verified.'

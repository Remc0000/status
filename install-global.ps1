[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$repositoryRoot = $PSScriptRoot
$sourceInstructions = Join-Path $repositoryRoot ".github\copilot-instructions.md"
$sourceExtension = Join-Path $repositoryRoot ".github\extensions\status\extension.mjs"
$copilotRoot = Join-Path $HOME ".copilot"
$targetInstructions = Join-Path $copilotRoot "copilot-instructions.md"
$targetExtensionDirectory = Join-Path $copilotRoot "extensions\status"
$targetExtension = Join-Path $targetExtensionDirectory "extension.mjs"

if (-not (Test-Path -LiteralPath $sourceInstructions -PathType Leaf)) {
    throw "Missing source instructions: $sourceInstructions"
}

if (-not (Test-Path -LiteralPath $sourceExtension -PathType Leaf)) {
    throw "Missing source extension: $sourceExtension"
}

New-Item -ItemType Directory -Path $copilotRoot -Force | Out-Null
New-Item -ItemType Directory -Path $targetExtensionDirectory -Force | Out-Null
Copy-Item -LiteralPath $sourceExtension -Destination $targetExtension -Force

$statusInstructions = Get-Content -LiteralPath $sourceInstructions -Raw
if (Test-Path -LiteralPath $targetInstructions -PathType Leaf) {
    $existingInstructions = Get-Content -LiteralPath $targetInstructions -Raw
    if ($existingInstructions -notmatch "(?m)^# Copilot Status Dashboard\s*$") {
        $separator = if ($existingInstructions.EndsWith("`n")) { "`n" } else { "`n`n" }
        [System.IO.File]::AppendAllText(
            $targetInstructions,
            $separator + $statusInstructions,
            [System.Text.UTF8Encoding]::new($false)
        )
    }
}
else {
    [System.IO.File]::WriteAllText(
        $targetInstructions,
        $statusInstructions,
        [System.Text.UTF8Encoding]::new($false)
    )
}

Write-Output "Installed global Copilot status command."
Write-Output "Extension: $targetExtension"
Write-Output "Instructions: $targetInstructions"
Write-Output "Restart Copilot CLI, then run /status."

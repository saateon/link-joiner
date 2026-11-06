<#
.SYNOPSIS
  Join many lines of a text file into one line.
.EXAMPLE
  .\Join-Links.ps1 -InputPath ..\input\links.txt
#>
param(
    [string]$InputPath = (Join-Path $PSScriptRoot '..\input\links.txt'),
    [string]$OutputPath,
    [string]$Separator = ' ',
    [switch]$NoClipboard
)

$ErrorActionPreference = 'Stop'

function Get-CleanLines([string]$Path) {
    Get-Content -LiteralPath $Path -Encoding UTF8 |
        ForEach-Object { $_.Trim() } |
        Where-Object { $_ }
}

if (-not (Test-Path -LiteralPath $InputPath)) {
    Write-Host "ERROR: File not found: $InputPath" -ForegroundColor Red
    exit 1
}

$InputPath = (Resolve-Path -LiteralPath $InputPath).Path

if (-not $OutputPath) {
    $dir  = Split-Path $InputPath -Parent
    $name = [IO.Path]::GetFileNameWithoutExtension($InputPath)
    $OutputPath = Join-Path $dir "$name.joined.txt"
}

$lines = @(Get-CleanLines $InputPath)
if ($lines.Count -eq 0) {
    Write-Host 'ERROR: The file has no text.' -ForegroundColor Red
    exit 1
}

$result = $lines -join $Separator
[IO.File]::WriteAllText($OutputPath, $result, (New-Object Text.UTF8Encoding $false))

if (-not $NoClipboard) { Set-Clipboard -Value $result }

Write-Host "OK: $($lines.Count) lines joined." -ForegroundColor Green
Write-Host "Saved to: $OutputPath"
if (-not $NoClipboard) { Write-Host 'Copied to clipboard.' }

# Stage game data for Emscripten preload — same layout as the working reference web build.
$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $PSScriptRoot
$Src = Join-Path $Root 'gamefiles'
$Dst = Join-Path $PSScriptRoot 'gamedata'

if (-not (Test-Path (Join-Path $Src 'blood.rff'))) {
    Write-Error "Missing gamefiles\blood.rff at $Src"
}
if (Test-Path $Dst) { Remove-Item -Recurse -Force $Dst }
New-Item -ItemType Directory -Path $Dst | Out-Null
Copy-Item -Path (Join-Path $Src '*') -Destination $Dst -Recurse -Force
Write-Host "Staged $(@(Get-ChildItem $Dst -Recurse -File).Count) files from gamefiles -> $Dst"

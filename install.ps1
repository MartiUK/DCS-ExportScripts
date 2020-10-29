$LocalPath = '.\Scripts\DCS-ExportScript'
$DCSDir = "$env:USERPROFILE\Saved Games\DCS"
$OpenBetaDir = "$DCSDir.openbeta"

$InstallDCS = $false
$InstallOpenBeta = $false

if (Test-Path $DCSDir) {
    $InstallDCS = $true
}

If (Test-Path $OpenBetaDir) {
    $InstallOpenBeta = $true
}

If ($InstallDCS -eq $true) {
    $reply = Read-Host -Prompt "Install DCS-ExportScript into DCS? [y/n]"
    If ( $reply -match "[yY]" ) {
        Remove-Item -Recurse -ErrorAction SilentlyContinue "$DCSDir\Scripts\DCS-ExportScript"
        Copy-Item -Recurse $LocalPath "$DCSDir\Scripts\DCS-ExportScript"
    }
}

If ($InstallOpenBeta -eq $true) {
    $reply = Read-Host -Prompt "Install DCS-ExportScript into DCS.openbeta? [y/n]"
    If ( $reply -match "[yY]" ) {
        Remove-Item -Recurse -ErrorAction SilentlyContinue "$OpenBetaDir\Scripts\DCS-ExportScript"
        Copy-Item -Recurse $LocalPath "$OpenBetaDir\Scripts\DCS-ExportScript"
    }
}

Write-Output "Copy Complete!"
Write-Output "Modify Export.lua in your DCS folder to look like Export.lua in the Scripts folder"

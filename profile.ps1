# include this file in $profile:
# notepad $profile.CurrentUserAllHost
# . m:\script\pwsh\profile.ps1

$InformationPreference = 'Continue' # SilentlyContinue (default); whether to display Write-Information message
$ver = $Host.Version;
$myDoc = [Environment]::GetFolderPath('MyDocument');
write-host "v$ver; profile: $PSCommandPath"
. $PSScriptRoot\alias.ps1
. $PSScriptRoot\presto\presto.ps1
$env:path += ";$PSScriptRoot"
$env:PSModulePath += ";$PSScriptRoot\Modules"
$env:path += ";" + ((get-childitem -attributes directory -path c:\program -name | % { join-path "c:\program\" $_ }) -join ';')
Set-PSReadlineKeyHandler -Chord Alt+F4 -Function ViExit
. $PSScriptRoot\utilities.ps1
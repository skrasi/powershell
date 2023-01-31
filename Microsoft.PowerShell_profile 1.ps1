Import-Module AzureAD
Import-Module MSOnline
Import-Module ExchangeOnlineManagement
Import-Module Az
Import-Module PSWindowsUpdate
Import-Module AzureADToolkit
Import-Module -Name Microsoft.RDInfra.RDPowerShell
Import-Module CorePosh
Set-PoshPrompt powerlevel10k_modern
# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'

. "C:\Users\shkadmin.YSU\lib\oracle-cli\Lib\site-packages\oci_cli\bin\OciTabExpansion.ps1"

. "C:\Users\shkrasinski\lib\oracle-cli\Lib\site-packages\oci_cli\bin\OciTabExpansion.ps1"

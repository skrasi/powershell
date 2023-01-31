Import-Module -Name AzureAD
Import-Module ActiveDirectory
Import-Module GroupPolicy	
Import-Module -Name PSWindowsUpdate
Import-Module ExchangeOnlineManagement
Import-Module -Name Az
Import-Module posh-git
Set-Theme Paradox
# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

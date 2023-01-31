#Powershell 5
Import-Module AzureAD
Import-Module MSOnline
Import-Module ExchangeOnlineManagement
Import-Module Az
Import-module Az.Resources
Import-module Az.DesktopVirtualization
Import-Module PSWindowsUpdate
Import-Module AzureADToolkit
Import-Module Azureadpreview -RequiredVersion 2.0.2.149
Import-Module -Name Microsoft.RDInfra.RDPowerShell
Import-Module CorePosh
Import-Module AADInternals
Import-Module PSReadLine
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\powerlevel10k_rainbow.omp.json" | Invoke-Expression
# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows
# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'
$today = Get-Date
$days = 1,11,22
if ($days -contains $today.day) {
    #update help
    Write-Host "Updating help via a background job" -ForegroundColor yellow
    [void](Start-Job {Update-Help -force})
}
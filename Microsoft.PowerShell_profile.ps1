#Powershell 5
Import-Module AzureAD
Import-Module MSOnline
Import-Module oh-my-posh
Import-Module ExchangeOnlineManagement
Import-Module AzureADPreview
Import-Module Az
Import-module Az.Resources
Import-module Az.DesktopVirtualization
Import-Module AzureADPreview
Import-Module PSWindowsUpdate
Import-Module -Name Terminal-Icons
Import-Module AzureADToolkit
Import-Module -Name Microsoft.RDInfra.RDPowerShell
oh-my-posh --init --shell pwsh --config ~/powerlevel10k_modern.omp.json | Invoke-Expression
Import-Module CorePosh
Import-Module PSReadLine
Import-Module TabExpansionPlusPlus
Set-PoshPrompt powerlevel10k_modern
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
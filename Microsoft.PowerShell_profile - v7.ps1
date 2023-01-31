#Powershell 7
Import-Module AzureAD
Import-Module MSOnline
Import-Module ExchangeOnlineManagement
Import-Module Az
Import-module Az.DesktopVirtualization
Import-Module PSWindowsUpdate
Import-Module AzureADToolkit
Import-Module -Name Microsoft.RDInfra.RDPowerShell
Import-Module oh-my-posh
Import-Module CorePosh
Import-Module -Name Terminal-Icons
Import-Module PSReadLine
Import-Module TabExpansionPlusPlus
Import-Module Microsoft.Graph
Set-PoshPrompt powerlevel10k_modern
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows
# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
Import-Module Az.Tools.Predictor
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'
$today = Get-Date
$days = 1,11,22
if ($days -contains $today.day) {
    #update help
    Write-Host "Updating help via a background job" -ForegroundColor yellow
    [void](Start-Job {Update-Help -force})
}
Import-Module Az.Tools.Predictor
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
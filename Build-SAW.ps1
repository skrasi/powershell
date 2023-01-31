# Call this script from a powershell command prompt using this command:

# Force TLS 1.2 (Required by PowerShell Gallery and Chocolatey)
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Preparation
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
Register-PSRepository -Default
Set-ExecutionPolicy RemoteSigned -Force
New-Item -Path C:\ -Name Scripts -ItemType Directory

# Install RSAT Windows 10
# Install RSAT Windows 11
Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online

# Install VMware PowerCLI
Install-Module -Name VMware.PowerCLI -AllowClobber -Force -SkipPublisherCheck
Set-PowerCLIConfiguration -Scope AllUsers -ParticipateInCEIP $false -InvalidCertificateAction Ignore -confirm:$false

# Miscellaneous Powershell Modules - Ignore missing modules warnings, a reboot is required.
Install-Module -Name Testimo -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name DSInternals -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name PSPKI -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name ExchangeOnlineManagement -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name AzureADPreview -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name Az -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name MSOnline -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name Microsoft.Online.SharePoint.PowerShell -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name MicrosoftTeams -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name Microsoft.PowerShell.SecretManagement -Force -SkipPublisherCheck
Install-Module -Name Microsoft.PowerShell.SecretStore -Force -SkipPublisherCheck
Install-Module -Name Microsoft.Graph -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name ADReportingTools -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name Microsoft.RDInfra.RDPowerShell -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name PSWindowsUpdate -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name Microsoft.PowerApps.Administration.PowerShell -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name Az.DesktopVirtualization -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name SharePointPnPPowerShellOnline -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name AzureRM -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name AADRM -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name RobustCloudCommand -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name PSReadLine -AllowPrerelease -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name Hawk -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name PackageManagement -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name PowerShellGet -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name PSLogging -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name Az.Tools.Predictor -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name Orca -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name PSHTML -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name PSWriteHTML -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name ReportHTML -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name PSWinReportingV2 -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name oh-my-posh -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name SHiPS -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name AzureADToolkit -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name TMOutput -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name CorePosh -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name dbatools -Scope AllUsers -Force -SkipPublisherCheck
Install-Module -Name Evergreen -Scope AllUsers -Force -SkipPublisherCheck
Update-Module
#Install-Module -Name AzureAD -Scope AllUsers -Force -SkipPublisherCheck

#Set PSReadLine Options
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -Colors @{ InlinePrediction = "$([char]0x1b)[36;7;238m"}
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Enable-AzPredictor -AllSession

# Install OCI CLI
Set-ExecutionPolicy RemoteSigned 
Invoke-WebRequest https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.ps1 -OutFile install.ps1
.\install.ps1 -AcceptAllDefaults  

# Chocolatey tools
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-WebRequest -uri "https://chocolatey.org/install.ps1" -UseBasicParsing | Invoke-Expression
Choco install chocolateygui -y
Choco install chocolatey-core.extension

# Essential tools
Choco install notepadplusplus -y
Choco install googlechrome -y
Choco install adobereader -y
Choco install firefox -y
Choco install 7zip -y
Choco install winscp -y
Choco install filezilla -y
Choco install openssh -y
Choco install git -y
choco install python -y
choco install pip -y
choco install nmap -y
choco install putty -y
choco install mremoteng -y
Choco install ad-tidy-free -y
Choco install sublimetext4 -y
Choco install jre8 -y
Choco install vim -y
Choco install rufus -y
Choco install deluge -y
Choco install oh-my-posh -y
Choco install poshgit -y
choco install nodejs -y
choco install nvm -y
choco install terraform -y

# Install Nerd Fonts for Powershell - This takes a long time
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.ps1

# Microsoft Tools
Choco install sysinternals -y
Choco install vscode -y
Choco install vscode-powershell -y
Choco install pswindowsupdate -y
Choco install vcredist140 -y

#Install M365 CLI - Needs Nodejs or Yarn
npm install -g @pnp/cli-microsoft365

# SQL Related
Choco install sql-server-management-studio -y
Choco install dbatools -y

# Cloud - Azure / Office365
Choco install azure-cli -y
Choco install azcopy -y
Choco install azure-data-studio -y
Choco install microsoftazurestorageexplorer -y

# Cloud - AWS
choco install awscli -y
pip3 install aws-shell

# Cloud - GCP
choco install gcloudsdk -y

# Kubernetes
choco install kubernetes-cli -y

# Vmware related
Choco install rvtools -y
Choco install vmware-tools -y
Set-PowerCLIConfiguration -Scope AllUsers -ParticipateInCEIP $false -confirm:$false

# SpecOps
Invoke-WebRequest -Uri "https://download.specopssoft.com/Release/gpupdate/specopsgpupdatesetup.exe" -OutFile C:\tools\specops.exe
7z x C:\tools\specops.exe -oC:\Temp\
Start-Process -FilePath "$env:systemroot\system32\msiexec.exe" -ArgumentList '/i "C:\Temp\Products\SpecOpsGPUpdate\SpecopsGpupdate-x64.msi" /qb' -Wait
Remove-Item -Path C:\Temp -Recurse -Force
Remove-Item C:\tools\specops.exe

# Install WAC
Invoke-WebRequest -Uri 'http://aka.ms/WACDownload' -OutFile C:\tools\WAC.msi
msiexec /i WAC.msi /qn /L*v log.txt SME_PORT=6516 SSL_CERTIFICATE_OPTION=generate

#Install MS Online Sign-In Assistant
Invoke-WebRequest -Uri 'https://download.microsoft.com/download/7/1/E/71EF1D05-A42C-4A1F-8162-96494B5E615C/msoidcli_64bit.msi' -OutFile C:\tools\MS-online.msi
msiexec /i MS-online.msi /qn

# Create default powershell profile for All Users / All Hosts
# Invoke-WebRequest -Uri #"https://raw.githubusercontent.com/SUBnet192/Scripts/master/profile.ps1" -Outfile #$PROFILE.AllusersAllHosts

# Reboot to complete installation
Restart-Computer

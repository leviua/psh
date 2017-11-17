# Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)
# Update path for SSH (Loaded in PowerShell Profile)
$env:path += ";" + (Get-Item "Env:ProgramFiles").Value + "\Git\bin";
$env:path += ";" + (Get-Item "Env:ProgramFiles").Value + "\Git\usr\bin";

# Load SSH agent utils
. (Resolve-Path ~/Documents/WindowsPowershell/ssh-agent-utils.ps1)

# Spoof terminal environment for git color.
$env:TERM = 'cygwin'

# Load posh-git example profile, which will setup a prompt
#. 'C:\tools\poshgit\dahlbyk-posh-git-869d4c5\profile.example.ps1'

Pop-Location

Add-SshKey

# Load posh-git module from current directory
Import-Module posh-git
#git aliases
$gitAliasses = "$Home\Documents\WindowsPowerShell\ps-git-functions.ps1";

if (Test-Path($gitAliasses)) {
. $Home\Documents\WindowsPowerShell\ps-git-functions.ps1
}

# If module is installed in a default location ($env:PSModulePath),
# use this instead (see about_Modules for more information):
# Import-Module posh-git

# Set up a simple prompt, adding the git prompt parts inside git repos

# function global:prompt {
#     $realLASTEXITCODE = $LASTEXITCODE
#     $Host.UI.RawUI.ForegroundColor = "White"

#     Write-Host $pwd.ProviderPath -NoNewLine -ForegroundColor Green

#     Write-VcsStatus

#     Write-Host ""
#     $global:LASTEXITCODE = $realLASTEXITCODE

#     Write-Host "$([char]955)" -NoNewLine -ForegroundColor "DarkGray"
#     return " "
# }

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

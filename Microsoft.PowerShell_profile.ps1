Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

# Load posh-git module from current directory
# Import-Module .\posh-git

# If module is installed in a default location ($env:PSModulePath),
# use this instead (see about_Modules for more information):
Import-Module posh-git

Import-Module TabExpansionPlusPlus
Import-Module NPMTabCompletion

# Set up a simple prompt, adding the git prompt parts inside git repos
function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE
    $Host.UI.RawUI.ForegroundColor = "White"

    Write-Host $pwd.ProviderPath -NoNewLine -ForegroundColor Green

    Write-VcsStatus

    Write-Host ""
    $global:LASTEXITCODE = $realLASTEXITCODE

    Write-Host "$([char]955)" -NoNewLine -ForegroundColor "DarkGray"
    return " "
}

# Pop-Location

Start-SshAgent -Quiet

#git aliases
. ./ps-git-functions.ps1


# pshazz init # 6 - 7

# Chocolatey profile # 2 - 4
# $ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
# if (Test-Path($ChocolateyProfile)) {
#   Import-Module "$ChocolateyProfile"
# }

# starship
Invoke-Expression (&starship init powershell) # 1  -4

# Install-Module -Name posh-git -Scope CurrentUser
# Install-Module -Name posh-sshell -Scope CurrentUser
# Install-Module -Name BurntToast -Scope CurrentUser

# sudo Add-MpPreference -ExclusionPath 'C:\Users\varun\scoop'



Import-Module -Name posh-git # 9 - 10
Import-Module -Name posh-sshell
Start-SshAgent -Quiet # 6.3
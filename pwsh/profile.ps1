
try { $null = gcm pshazz -ea stop; pshazz init } catch { }

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# starship
# Invoke-Expression (&starship init powershell)

# $Install-Module -Name posh-git -Scope CurrentUser
# $Install-Module -Name posh-sshell -Scope CurrentUser

Import-Module -Name posh-git
Import-Module -Name posh-sshell
Start-SshAgent -Quiet
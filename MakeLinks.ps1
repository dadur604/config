cd $PSScriptRoot

$user = Read-Host -Prompt "Enter windows username: "
$homedir = "C:\Users\$($user)"

$cd = $PSScriptRoot

$PSProfile = "$($homedir)\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
if (Test-Path $PSProfile) {
	Remove-Item -Path $PSProfile | Out-Null
}
Unblock-File -Path "$($cd)\Microsoft.PowerShell_profile.ps1" | Out-Null
New-Item -ItemType SymbolicLink -Path $PSProfile -Target "$($cd)\Microsoft.PowerShell_profile.ps1" | Out-Null
Write-Host "PowerShell Profile Created"

$ConEmuXML = "$($homedir)\AppData\Roaming\ConEmu.xml"
if (Test-Path $ConEmuXML) {
	Remove-Item -Path $ConEmuXML | Out-Null
}
New-Item -ItemType SymbolicLink -Path $ConEmuXML -Target "$($cd)\ConEmu.xml" | Out-Null
Write-Host "ConEmu Config Created. You may have to import from ConEmu Settings (in %AppData%)" | Out-Null

$ConEmuTaskName = "ConEmu Admin"
Unregister-ScheduledTask -TaskName $ConEmuTaskName -Confirm:$false | Out-Null
Register-ScheduledTask -Xml (get-content "$($cd)\ConEmuAdminTask.xml" | out-string) -TaskName $ConEmuTaskName | Out-Null
Write-Host "Created ConEmu Admin Task"

$SSHConfig = "$($homedir)\.ssh\config"
if (Test-Path $SSHConfig) {
	Remove-Item -Path $SSHConfig | Out-Null
}
New-Item -ItemType SymbolicLink -Path $SSHConfig -Target "$($cd)\ssh-config" | Out-Null
Write-Host "ssh Config Created"

$EmacsConfigRoaming = "$($homedir)\AppData\Roaming\.emacs"
if (Test-Path $EmacsConfigRoaming) {
	Remove-Item -Path $EmacsConfigRoaming | Out-Null
}
New-Item -ItemType SymbolicLink -Path $EmacsConfigRoaming -Target "$($cd)\emacs\.emacs.roaming" | Out-Null

$EmacsConfig = "$($homedir)\.emacs"
if (Test-Path $EmacsConfig) {
	Remove-Item -Path $EmacsConfig | Out-Null
}
New-Item -ItemType SymbolicLink -Path $EmacsConfig -Target "$($cd)\emacs\.emacs" | Out-Null
Write-Host "Emacs Config Created"

$GitConfig = "$($homedir)\.gitconfig"
if (Test-Path $GitConfig) {
	Remove-Item -Path $GitConfig | Out-Null
}
New-Item -ItemType SymbolicLink -Path $GitConfig -Target "$($cd)\.gitconfig" | Out-Null
Write-Host "Emacs Config Created"

Write-Host "Manually Import QTTabBar Settings"

Read-Host -Prompt "Press Enter to exit"
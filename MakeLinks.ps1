cd $PSScriptRoot

$PSProfile = "C:\Users\dadur\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
if (Test-Path $PSProfile) {
	Remove-Item -Path $PSProfile | Out-Null
}
New-Item -ItemType SymbolicLink -Path $PSProfile -Force -Target ".\Microsoft.PowerShell_profile.ps1" | Out-Null
Write-Host "PowerShell Profile Created"

$ConEmuXML = "C:\Users\dadur\AppData\Roaming\ConEmu.xml"
if (Test-Path $ConEmuXML) {
	Remove-Item -Path $ConEmuXML | Out-Null
}
New-Item -ItemType SymbolicLink -Path $ConEmuXML -Target ".\ConEmu.xml" | Out-Null
Write-Host "ConEmu Config Created. You may have to import from ConEmu Settings (in %AppData%)" | Out-Null

$ConEmuTaskName = "ConEmu Admin"
Unregister-ScheduledTask -TaskName $ConEmuTaskName -Confirm:$false | Out-Null
Register-ScheduledTask -Xml (get-content '.\ConEmuAdminTask.xml' | out-string) -TaskName $ConEmuTaskName | Out-Null
Write-Host "Created ConEmu Admin Task"

$SSHConfig = "C:\Users\dadur\.ssh\config"
if (Test-Path $SSHConfig) {
	Remove-Item -Path $SSHConfig | Out-Null
}
New-Item -ItemType SymbolicLink -Path $SSHConfig -Target ".\ssh-config" | Out-Null
Write-Host "ssh Config Created"

Write-Host "Manually Import QTTabBar Settings"

Read-Host -Prompt "Press Enter to exit"
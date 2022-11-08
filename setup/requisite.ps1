choco upgrade -y chocolatey vt-cli

# http://techrena.net/disable-ie-set-up-first-run-welcome-screen/
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Internet Explorer\Main" -Name "DisableFirstRunCustomize" -Value 1 -PropertyType "DWord" -Force | Out-Null
Write-Output "IE first run welcome screen has been disabled."

Write-Output 'Setting Windows Update service to Manual startup type.'
Set-Service -Name wuauserv -StartupType Manual

Write-Output 'Install PowerShellForGitHub module'
Install-Module -Name PowerShellForGitHub -Force
    $secureString = ("$env:github_api_key" | ConvertTo-SecureString -AsPlainText -Force)
    $cred = New-Object System.Management.Automation.PSCredential "username is ignored", $secureString
    Set-GitHubAuthentication -Credential $cred
    $secureString = $null # clear this out now that it's no longer needed
    $cred = $null # clear this out now that it's no longer needed
Write-Output 'Disabling Telemetry and update check' 
Set-GitHubConfiguration -DisableTelemetry # Not needed
Set-GitHubConfiguration -DisableUpdateCheck # Disabled because it crashes sometimes

Write-Output 'Importing repository modules' 
import-module "$PSScriptRoot\..\scripts\au_extensions.psm1"
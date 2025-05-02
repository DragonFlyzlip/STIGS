<#
.SYNOPSIS
    Disables the SMBv1 protocol on Windows 10 using registry settings.

.DESCRIPTION
    Remediates STIG ID: WN10-00-000165 by setting the registry value to disable SMBv1 on the SMB server.

.NOTES
    Author      : Ashraf
    LinkedIn    : https://www.linkedin.com/in/ashrafjamaal98/
    GitHub      : https://github.com/DragonFlyzlip/
    STIG-ID     : WN10-00-000165
    Created     : 2025-04-30

#>

try {
    $regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters"
    $regName = "SMB1"
    $regValue = 0

    # Create the key if it doesn't exist
    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    # Set the registry value to disable SMBv1
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue -Type DWord
    Write-Output "[+] Registry value set: SMB1 disabled (STIG: WN10-00-000165). A system reboot is required to take effect."
}
catch {
    Write-Error "[-] Failed to apply SMBv1 registry fix: $_"
}






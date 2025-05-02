<#
.SYNOPSIS
    Restricts local accounts with blank passwords from accessing the system over the network.

.DESCRIPTION
    Remediates STIG ID: WN10-SO-000015 by setting the appropriate registry key to deny network access to local accounts with blank passwords.

.NOTES
    Author      : Ashraf
    LinkedIn    : https://www.linkedin.com/in/ashrafjamaal98/
    GitHub      : https://github.com/DragonFlyzlip/
    STIG-ID     : WN10-SO-000015
    Created     : 2025-04-30

#>

try {
    $regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"
    $regName = "LimitBlankPasswordUse"
    $desiredValue = 1

    # Ensure the registry path exists
    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    # Apply the STIG fix
    Set-ItemProperty -Path $regPath -Name $regName -Value $desiredValue -Type DWord
    Write-Output "[+] STIG WN10-SO-000015 applied: Local accounts with blank passwords are now restricted from network access."
}
catch {
    Write-Error "[-] Failed to apply registry fix for WN10-SO-000015: $_"
}

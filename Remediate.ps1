#Requires -RunAsAdministrator
$ErrorActionPreference = 'Stop'

#Run this command to allow powershell scripts to run
#& { Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force }

# ============================================================
# Check 26000: Ensure 'Enforce password history' is set to '24 or more password(s)'.
# ============================================================
net accounts /uniquepw:24

# ============================================================
# Check 26001: Ensure 'Maximum password age' is set to '365 or fewer days, but not 0'.
# ============================================================
net accounts /maxpwage:365

# ============================================================
# Check 26002: Ensure 'Minimum password age' is set to '1 or more day(s)'.
# ============================================================
net accounts /minpwage:1

# ============================================================
# Check 26003: Ensure 'Minimum password length' is set to '14 or more character(s)'.
# ============================================================
net accounts /minpwlen:14

# ============================================================
# Check 26004: Ensure 'Relax minimum password length limits' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Control\SAM')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Control\SAM' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\SAM' -Name 'RelaxMinimumPasswordLengthLimits' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26005: Ensure 'Account lockout duration' is set to '15 or more minute(s)'.
# ============================================================
net accounts /lockoutduration:15

# ============================================================
# Check 26006: Ensure 'Account lockout threshold' is set to '5 or fewer invalid logon attempt(s), but not 0'.
# ============================================================
net accounts /lockoutthreshold:5

# ============================================================
# Check 26007: Ensure 'Reset account lockout counter after' is set to '15 or more minute(s)'.
# ============================================================
net accounts /lockoutwindow:15

# ============================================================
# Check 26008: Ensure 'Accounts: Block Microsoft accounts' is set to 'Users can't add or log on with Microsoft accounts'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System')) { New-Item -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'NoConnectedUser' -Value 3 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26009: Ensure 'Accounts: Guest account status' is set to 'Disabled'.
# ============================================================
$guestAccount = Get-CimInstance -ClassName Win32_UserAccount -Filter "SID = 'S-1-5-32-546'"
if ($guestAccount) { $guestAccount | ForEach-Object { $_.Disable() } }

# ============================================================
# Check 26010: Ensure 'Accounts: Limit local account use of blank passwords to console logon only' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Control\Lsa')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Control\Lsa' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Lsa' -Name 'LimitBlankPasswordUse' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26011: Configure 'Accounts: Rename administrator account'.
# ============================================================
$adminAccount = Get-LocalUser -Name "Administrator" -ErrorAction SilentlyContinue
if ($adminAccount -and -not (Get-LocalUser -Name "SystemOperator" -ErrorAction SilentlyContinue)) {
    Rename-LocalUser -Name "Administrator" -NewName "SystemOperator"
}
$legacyAdminAccount = Get-LocalUser -Name "xAdministrator" -ErrorAction SilentlyContinue
if ($legacyAdminAccount -and -not (Get-LocalUser -Name "SystemOperator" -ErrorAction SilentlyContinue)) {
    Rename-LocalUser -Name "xAdministrator" -NewName "SystemOperator"
}

# ============================================================
# Check 26012: Configure 'Accounts: Rename guest account'.
# ============================================================
$guestAccount = Get-LocalUser -Name "Guest" -ErrorAction SilentlyContinue
if ($guestAccount -and -not (Get-LocalUser -Name "TemporaryUser" -ErrorAction SilentlyContinue)) {
    Rename-LocalUser -Name "Guest" -NewName "TemporaryUser"
}
$legacyGuestAccount = Get-LocalUser -Name "xGuest" -ErrorAction SilentlyContinue
if ($legacyGuestAccount -and -not (Get-LocalUser -Name "TemporaryUser" -ErrorAction SilentlyContinue)) {
    Rename-LocalUser -Name "xGuest" -NewName "TemporaryUser"
}

# ============================================================
# Check 26013: Ensure 'Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Control\Lsa')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Control\Lsa' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Lsa' -Name 'SCENoApplyLegacyAuditPolicy' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26014: Ensure 'Audit: Shut down system immediately if unable to log security audits' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Control\Lsa')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Control\Lsa' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Lsa' -Name 'CrashOnAuditFail' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26015: Ensure 'Devices: Prevent users from installing printer drivers' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers' -Name 'AddPrinterDrivers' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26016: Ensure 'Domain member: Digitally encrypt or sign secure channel data (always)' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters' -Name 'RequireSignOrSeal' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26017: Ensure 'Domain member: Digitally encrypt secure channel data (when possible)' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters' -Name 'SealSecureChannel' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26018: Ensure 'Domain member: Digitally sign secure channel data (when possible)' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters' -Name 'SignSecureChannel' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26019: Ensure 'Domain member: Disable machine account password changes' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters' -Name 'DisablePasswordChange' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26020: Ensure 'Domain member: Maximum machine account password age' is set to '30 or fewer days, but not 0'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters' -Name 'MaximumPasswordAge' -Value 30 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26021: Ensure 'Domain member: Require strong (Windows 2000 or later) session key' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters' -Name 'RequireStrongKey' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26022: Ensure 'Interactive logon: Do not require CTRL+ALT+DEL' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System')) { New-Item -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'DisableCAD' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26023: Ensure 'Interactive logon: Don't display last signed-in' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System')) { New-Item -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'DontDisplayLastUserName' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26024: Ensure 'Interactive logon: Machine account lockout threshold' is set to '10 or fewer invalid logon attempts, but not 0'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System')) { New-Item -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'MaxDevicePasswordFailedAttempts' -Value 10 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26025: Ensure 'Interactive logon: Machine inactivity limit' is set to '900 or fewer second(s), but not 0'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System')) { New-Item -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'InactivityTimeoutSecs' -Value 900 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26026: Configure 'Interactive logon: Message text for users attempting to log on'.
# ============================================================
$policyKey = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system'
if (-not (Test-Path $policyKey)) { New-Item -Path $policyKey -Force | Out-Null }
New-ItemProperty -Path $policyKey -Name 'legalnoticetext' -Value 'WARNING: This computer is the property of the organization. Unauthorized access is prohibited and may be punishable by law.' -PropertyType String -Force | Out-Null

# ============================================================
# Check 26027: Configure 'Interactive logon: Message title for users attempting to log on'.
# ============================================================
$policyKey = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system'
if (-not (Test-Path $policyKey)) { New-Item -Path $policyKey -Force | Out-Null }
New-ItemProperty -Path $policyKey -Name 'legalnoticecaption' -Value 'Security Policy' -PropertyType String -Force | Out-Null

# ============================================================
# Check 26028: Ensure 'Interactive logon: Number of previous logons to cache (in case domain controller is not available)' is set to '4 or fewer logon(s)'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name 'CachedLogonsCount' -Value 4 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26029: Ensure 'Interactive logon: Prompt user to change password before expiration' is set to 'between 5 and 14 days'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon')) { New-Item -Path 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name 'PasswordExpiryWarning' -Value 14 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26030: Ensure 'Interactive logon: Smart card removal behavior' is set to 'Lock Workstation' or higher.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon')) { New-Item -Path 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name 'ScRemoveOption' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26031: Ensure 'Microsoft network client: Digitally sign communications (always)' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters' -Name 'RequireSecuritySignature' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26032: Ensure 'Microsoft network client: Digitally sign communications (if server agrees)' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters' -Name 'EnableSecuritySignature' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26033: Ensure 'Microsoft network client: Send unencrypted password to third-party SMB servers' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters' -Name 'EnablePlainTextPassword' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26034: Ensure 'Microsoft network server: Amount of idle time required before suspending session' is set to '15 or fewer minute(s)'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters' -Name 'AutoDisconnect' -Value 15 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26035: Ensure 'Microsoft network server: Digitally sign communications (always)' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters' -Name 'RequireSecuritySignature' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26036: Ensure 'Microsoft network server: Digitally sign communications (if client agrees)' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters' -Name 'EnableSecuritySignature' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26037: Ensure 'Microsoft network server: Disconnect clients when logon hours expire' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters' -Name 'EnableForcedLogOff' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26038: Ensure 'Microsoft network server: Server SPN target name validation level' is set to 'Accept if provided by client' or higher.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters' -Name 'SMBServerNameHardeningLevel' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26039: Ensure 'Network access: Do not allow anonymous enumeration of SAM accounts' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'RestrictAnonymousSAM' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26040: Ensure 'Network access: Do not allow anonymous enumeration of SAM accounts and shares' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'RestrictAnonymous' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26041: Ensure 'Network access: Do not allow storage of passwords and credentials for network authentication' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'DisableDomainCreds' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26042: Ensure 'Network access: Let Everyone permissions apply to anonymous users' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Control\Lsa')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Control\Lsa' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Lsa' -Name 'EveryoneIncludesAnonymous' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26043: Ensure 'Network access: Named Pipes that can be accessed anonymously' is set to 'None'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters' -Name 'NullSessionPipes' -Value '' -PropertyType String -Force | Out-Null

# ============================================================
# Check 26044: Ensure 'Network access: Remotely accessible registry paths' is configured.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths' -Name 'Machine' -Value 'System\CurrentControlSet\Control\ProductOptions System\CurrentControlSet\Control\Server Applications Software\Microsoft\Windows NT\CurrentVersion' -PropertyType String -Force | Out-Null

# ============================================================
# Check 26045: Ensure 'Network access: Remotely accessible registry paths and sub-paths' is configured.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths' -Name 'Machine' -Value 'Software\Microsoft\OLAP Server Software\Microsoft\Windows NT\CurrentVersion\Perflib Software\Microsoft\Windows NT\CurrentVersion\Print Software\Microsoft\Windows NT\CurrentVersion\Windows System\CurrentControlSet\Control\ContentIndex System\CurrentControlSet\Control\Print\Printers System\CurrentControlSet\Control\Terminal Server System\CurrentControlSet\Control\Terminal Server\DefaultUserConfiguration System\CurrentControlSet\Control\Terminal Server\UserConfig System\CurrentControlSet\Services\Eventlog System\CurrentControlSet\Services\SysmonLog' -PropertyType String -Force | Out-Null

# ============================================================
# Check 26046: Ensure 'Network access: Restrict anonymous access to Named Pipes and Shares' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters' -Name 'RestrictNullSessAccess' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26047: Ensure 'Network access: Restrict clients allowed to make remote calls to SAM' is set to 'Administrators: Remote Access: Allow'.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'restrictremotesam' -Value 'O:BAG:BAD:(A;;RC;;;BA)' -PropertyType String -Force | Out-Null

# ============================================================
# Check 26048: Ensure 'Network access: Shares that can be accessed anonymously' is set to 'None'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters' -Name 'NullSessionShares' -Value '' -PropertyType String -Force | Out-Null

# ============================================================
# Check 26049: Ensure 'Network access: Sharing and security model for local accounts' is set to 'Classic - local users authenticate as themselves'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Control\Lsa')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Control\Lsa' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Lsa' -Name 'ForceGuest' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26050: Ensure 'Network security: Allow Local System to use computer identity for NTLM' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Control\Lsa')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Control\Lsa' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Lsa' -Name 'UseMachineId' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26051: Ensure 'Network security: Allow LocalSystem NULL session fallback' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0' -Name 'allownullsessionfallback' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26052: Ensure 'Network Security: Allow PKU2U authentication requests to this computer to use online identities' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Control\Lsa\pku2u')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Control\Lsa\pku2u' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Lsa\pku2u' -Name 'AllowOnlineID' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26053: Ensure 'Network security: Configure encryption types allowed for Kerberos' is set to 'AES128_HMAC_SHA1, AES256_HMAC_SHA1, Future encryption types'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters')) { New-Item -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters' -Name 'SupportedEncryptionTypes' -Value 2147483644 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26054: Ensure 'Network security: Do not store LAN Manager hash value on next password change' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Control\Lsa')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Control\Lsa' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Lsa' -Name 'NoLMHash' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26055: Ensure 'Network security: Force logoff when logon hours expire' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters' -Name 'EnableForcedLogOff' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26056: Ensure 'Network security: LAN Manager authentication level' is set to 'Send NTLMv2 response only. Refuse LM & NTLM'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Control\Lsa')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Control\Lsa' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Lsa' -Name 'LmCompatibilityLevel' -Value 5 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26057: Ensure 'Network security: LDAP client signing requirements' is set to 'Negotiate signing' or higher.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Services\LDAP')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Services\LDAP' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Services\LDAP' -Name 'LDAPClientIntegrity' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26058: Ensure 'Network security: Minimum session security for NTLM SSP based (including secure RPC) clients' is set to 'Require NTLMv2 session security, Require 128-bit encryption'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0' -Name 'NTLMMinClientSec' -Value 537395200 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26059: Ensure 'Network security: Minimum session security for NTLM SSP based (including secure RPC) servers' is set to 'Require NTLMv2 session security, Require 128-bit encryption'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0' -Name 'NTLMMinServerSec' -Value 537395200 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26060: Ensure 'Network security: Restrict NTLM: Audit Incoming NTLM Traffic' is set to 'Enable auditing for all accounts'.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0' -Name 'AuditReceivingNTLMTraffic' -Value 2 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26061: Ensure 'Network security: Restrict NTLM: Outgoing NTLM traffic to remote servers' is set to 'Audit all' or higher.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0' -Name 'RestrictSendingNTLMTraffic' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26062: Ensure 'System objects: Require case insensitivity for non-Windows subsystems' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Control\Session Manager\Kernel')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Control\Session Manager\Kernel' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Session Manager\Kernel' -Name 'ObCaseInsensitive' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26063: Ensure 'System objects: Strengthen default permissions of internal system objects (e.g. Symbolic Links)' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\System\CurrentControlSet\Control\Session Manager')) { New-Item -Path 'HKLM:\System\CurrentControlSet\Control\Session Manager' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Session Manager' -Name 'ProtectionMode' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26064: Ensure 'User Account Control: Admin Approval Mode for the Built-in Administrator account' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System')) { New-Item -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'FilterAdministratorToken' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26065: Ensure 'User Account Control: Behavior of the elevation prompt for administrators in Admin Approval Mode' is set to 'Prompt for consent on the secure desktop'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System')) { New-Item -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'ConsentPromptBehaviorAdmin' -Value 2 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26066: Ensure 'User Account Control: Behavior of the elevation prompt for standard users' is set to 'Automatically deny elevation requests'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System')) { New-Item -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'ConsentPromptBehaviorUser' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26067: Ensure 'User Account Control: Detect application installations and prompt for elevation' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System')) { New-Item -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'EnableInstallerDetection' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26068: Ensure 'User Account Control: Only elevate UIAccess applications that are installed in secure locations' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System')) { New-Item -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'EnableSecureUIAPaths' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26069: Ensure 'User Account Control: Run all administrators in Admin Approval Mode' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System')) { New-Item -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'EnableLUA' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26070: Ensure 'User Account Control: Switch to the secure desktop when prompting for elevation' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System')) { New-Item -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'PromptOnSecureDesktop' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26071: Ensure 'User Account Control: Virtualize file and registry write failures to per-user locations' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System')) { New-Item -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'EnableVirtualization' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26072: Ensure 'Bluetooth Audio Gateway Service (BTAGService)' is set to 'Disabled'.
# ============================================================
$serviceName = 'BTAGService'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26073: Ensure 'Bluetooth Support Service (bthserv)' is set to 'Disabled'.
# ============================================================
$serviceName = 'bthserv'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26074: Ensure 'Computer Browser (Browser)' is set to 'Disabled' or 'Not Installed'.
# ============================================================
$serviceName = 'Browser'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26075: Ensure 'Downloaded Maps Manager (MapsBroker)' is set to 'Disabled'.
# ============================================================
$serviceName = 'MapsBroker'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26076: Ensure 'Geolocation Service (lfsvc)' is set to 'Disabled'.
# ============================================================
$serviceName = 'lfsvc'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26077: Ensure 'IIS Admin Service (IISADMIN)' is set to 'Disabled' or 'Not Installed'.
# ============================================================
$serviceName = 'IISADMIN'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26078: Ensure 'Infrared monitor service (irmon)' is set to 'Disabled' or 'Not Installed'.
# ============================================================
$serviceName = 'irmon'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26079: Ensure 'Link-Layer Topology Discovery Mapper (lltdsvc)' is set to 'Disabled'.
# ============================================================
$serviceName = 'lltdsvc'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26080: Ensure 'LxssManager (LxssManager)' is set to 'Disabled' or 'Not Installed'.
# ============================================================
$serviceName = 'LxssManager'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26081: Ensure 'Microsoft FTP Service (FTPSVC)' is set to 'Disabled' or 'Not Installed'.
# ============================================================
$serviceName = 'FTPSVC'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26082: Ensure 'Microsoft iSCSI Initiator Service (MSiSCSI)' is set to 'Disabled'.
# ============================================================
$serviceName = 'MSiSCSI'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26083: Ensure 'OpenSSH SSH Server (sshd)' is set to 'Disabled' or 'Not Installed'.
# ============================================================
$serviceName = 'sshd'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26084: Ensure 'Peer Name Resolution Protocol (PNRPsvc)' is set to 'Disabled'.
# ============================================================
$serviceName = 'PNRPsvc'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26085: Ensure 'Peer Networking Grouping (p2psvc)' is set to 'Disabled'.
# ============================================================
$serviceName = 'p2psvc'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26086: Ensure 'Peer Networking Identity Manager (p2pimsvc)' is set to 'Disabled'.
# ============================================================
$serviceName = 'p2pimsvc'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26087: Ensure 'PNRP Machine Name Publication Service (PNRPAutoReg)' is set to 'Disabled'.
# ============================================================
$serviceName = 'PNRPAutoReg'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26088: Ensure 'Print Spooler (Spooler)' is set to 'Disabled'.
# ============================================================
$serviceName = 'Spooler'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26089: Ensure 'Problem Reports and Solutions Control Panel Support (wercplsupport)' is set to 'Disabled'.
# ============================================================
$serviceName = 'wercplsupport'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26090: Ensure 'Remote Access Auto Connection Manager (RasAuto)' is set to 'Disabled'.
# ============================================================
$serviceName = 'RasAuto'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26091: Ensure 'Remote Desktop Configuration (SessionEnv)' is set to 'Disabled'.
# ============================================================
$serviceName = 'SessionEnv'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26092: Ensure 'Remote Desktop Services (TermService)' is set to 'Disabled'.
# ============================================================
$serviceName = 'TermService'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26093: Ensure 'Remote Desktop Services UserMode Port Redirector (UmRdpService)' is set to 'Disabled'.
# ============================================================
$serviceName = 'UmRdpService'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26094: Ensure 'Remote Procedure Call (RPC) Locator (RpcLocator)' is set to 'Disabled'.
# ============================================================
$serviceName = 'RpcLocator'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26095: Ensure 'Remote Registry (RemoteRegistry)' is set to 'Disabled'.
# ============================================================
$serviceName = 'RemoteRegistry'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26096: Ensure 'Routing and Remote Access (RemoteAccess)' is set to 'Disabled'.
# ============================================================
$serviceName = 'RemoteAccess'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26097: Ensure 'Server (LanmanServer)' is set to 'Disabled'.
# ============================================================
$serviceName = 'LanmanServer'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26098: Ensure 'Simple TCP/IP Services (simptcp)' is set to 'Disabled' or 'Not Installed'.
# ============================================================
$serviceName = 'simptcp'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26099: Ensure 'SNMP Service (SNMP)' is set to 'Disabled' or 'Not Installed'.
# ============================================================
$serviceName = 'SNMP'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26100: Ensure 'Special Administration Console Helper (sacsvr)' is set to 'Disabled' or 'Not Installed'.
# ============================================================
$serviceName = 'sacsvr'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26101: Ensure 'SSDP Discovery (SSDPSRV)' is set to 'Disabled'.
# ============================================================
$serviceName = 'SSDPSRV'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26102: Ensure 'UPnP Device Host (upnphost)' is set to 'Disabled'.
# ============================================================
$serviceName = 'upnphost'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26103: Ensure 'Web Management Service (WMSvc)' is set to 'Disabled' or 'Not Installed'.
# ============================================================
$serviceName = 'WMSvc'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26104: Ensure 'Windows Error Reporting Service (WerSvc)' is set to 'Disabled'.
# ============================================================
$serviceName = 'WerSvc'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26105: Ensure 'Windows Event Collector (Wecsvc)' is set to 'Disabled'.
# ============================================================
$serviceName = 'Wecsvc'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26106: Ensure 'Windows Media Player Network Sharing Service (WMPNetworkSvc)' is set to 'Disabled' or 'Not Installed'.
# ============================================================
$serviceName = 'WMPNetworkSvc'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26107: Ensure 'Windows Mobile Hotspot Service (icssvc)' is set to 'Disabled'.
# ============================================================
$serviceName = 'icssvc'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26108: Ensure 'Windows Push Notifications System Service (WpnService)' is set to 'Disabled'.
# ============================================================
$serviceName = 'WpnService'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26109: Ensure 'Windows PushToInstall Service (PushToInstall)' is set to 'Disabled'.
# ============================================================
$serviceName = 'PushToInstall'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26110: Ensure 'Windows Remote Management (WS- Management) (WinRM)' is set to 'Disabled'.
# ============================================================
$serviceName = 'WinRM'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26111: Ensure 'World Wide Web Publishing Service (W3SVC)' is set to 'Disabled' or 'Not Installed'.
# ============================================================
$serviceName = 'W3SVC'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26112: Ensure 'Xbox Accessory Management Service (XboxGipSvc)' is set to 'Disabled'.
# ============================================================
$serviceName = 'XboxGipSvc'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26113: Ensure 'Xbox Live Auth Manager (XblAuthManager)' is set to 'Disabled'.
# ============================================================
$serviceName = 'XblAuthManager'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26114: Ensure 'Xbox Live Game Save (XblGameSave)' is set to 'Disabled'.
# ============================================================
$serviceName = 'XblGameSave'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26115: Ensure 'Xbox Live Networking Service (XboxNetApiSvc)' is set to 'Disabled'.
# ============================================================
$serviceName = 'XboxNetApiSvc'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26116: Ensure 'Windows Firewall: Domain: Firewall state' is set to 'On (recommended)'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile' -Name 'EnableFirewall' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26117: Ensure 'Windows Firewall: Domain: Inbound connections' is set to 'Block (default)'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile' -Name 'DefaultInboundAction' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26118: Ensure 'Windows Firewall: Domain: Settings: Display a notification' is set to 'No'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile' -Name 'DisableNotifications' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26119: Ensure 'Windows Firewall: Domain: Logging: Name' is set to '%SystemRoot%System32\logfiles\firewall\domainfw.log'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging' -Name 'LogFilePath' -Value '%SystemRoot%\System32\logfiles\firewall\domainfw.log' -PropertyType String -Force | Out-Null

# ============================================================
# Check 26120: Ensure 'Windows Firewall: Domain: Logging: Size limit (KB)' is set to '16,384 KB or greater'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging' -Name 'LogFileSize' -Value 16384 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26121: Ensure 'Windows Firewall: Domain: Logging: Log dropped packets' is set to 'Yes'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging' -Name 'LogDroppedPackets' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26122: Ensure 'Windows Firewall: Domain: Logging: Log successful connections' is set to 'Yes'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging' -Name 'LogSuccessfulConnections' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26123: Ensure 'Windows Firewall: Private: Firewall state' is set to 'On (recommended)'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile' -Name 'EnableFirewall' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26124: Ensure 'Windows Firewall: Private: Inbound connections' is set to 'Block (default)'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile' -Name 'DefaultInboundAction' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26125: Ensure 'Windows Firewall: Private: Settings: Display a notification' is set to 'No'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile' -Name 'DisableNotifications' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26126: Ensure 'Windows Firewall: Private: Logging: Name' is set to '%SystemRoot%\System32\logfiles\firewall\privatefw.log'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging' -Name 'LogFilePath' -Value '%SystemRoot%\System32\logfiles\firewall\privatefw.log' -PropertyType String -Force | Out-Null

# ============================================================
# Check 26127: Ensure 'Windows Firewall: Private: Logging: Size limit (KB)' is set to '16,384 KB or greater'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging' -Name 'LogFileSize' -Value 16384 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26128: Ensure 'Windows Firewall: Private: Logging: Log dropped packets' is set to 'Yes'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging' -Name 'LogDroppedPackets' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26129: Ensure 'Windows Firewall: Private: Logging: Log successful connections' is set to 'Yes'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging' -Name 'LogSuccessfulConnections' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26130: Ensure 'Windows Firewall: Public: Firewall state' is set to 'On (recommended)'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile' -Name 'EnableFirewall' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26131: Ensure 'Windows Firewall: Public: Inbound connections' is set to 'Block (default)'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile' -Name 'DefaultInboundAction' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26132: Ensure 'Windows Firewall: Public: Settings: Display a notification' is set to 'No'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile' -Name 'DisableNotifications' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26133: Ensure 'Windows Firewall: Public: Settings: Apply local firewall rules' is set to 'No'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile' -Name 'AllowLocalPolicyMerge' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26134: Ensure 'Windows Firewall: Public: Settings: Apply local connection security rules' is set to 'No'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile' -Name 'AllowLocalIPsecPolicyMerge' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26135: Ensure 'Windows Firewall: Public: Logging: Name' is set to '%SystemRoot%\System32\logfiles\firewall\publicfw.log'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging' -Name 'LogFilePath' -Value '%SystemRoot%\System32\logfiles\firewall\publicfw.log' -PropertyType String -Force | Out-Null

# ============================================================
# Check 26136: Ensure 'Windows Firewall: Public: Logging: Size limit (KB)' is set to '16,384 KB or greater'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging' -Name 'LogFileSize' -Value 16384 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26137: Ensure 'Windows Firewall: Public: Logging: Log dropped packets' is set to 'Yes'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging' -Name 'LogDroppedPackets' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26138: Ensure 'Windows Firewall: Public: Logging: Log successful connections' is set to 'Yes'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging' -Name 'LogSuccessfulConnections' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26139: Ensure 'Audit Credential Validation' is set to 'Success and Failure'.
# ============================================================
& auditpol.exe /set /subcategory:"Credential Validation" /success:enable /failure:enable

# ============================================================
# Check 26140: Ensure 'Audit Application Group Management' is set to 'Success and Failure'.
# ============================================================
& auditpol.exe /set /subcategory:"Application Group Management" /success:enable /failure:enable

# ============================================================
# Check 26141: Ensure 'Audit Security Group Management' is set to include 'Success'.
# ============================================================
& auditpol.exe /set /subcategory:"Security Group Management" /success:enable /failure:disable

# ============================================================
# Check 26142: Ensure 'Audit User Account Management' is set to 'Success and Failure'.
# ============================================================
& auditpol.exe /set /subcategory:"User Account Management" /success:enable /failure:enable

# ============================================================
# Check 26143: Ensure 'Audit PNP Activity' is set to include 'Success'.
# ============================================================
& auditpol.exe /set /subcategory:"Plug and Play Events" /success:enable /failure:disable

# ============================================================
# Check 26144: Ensure 'Audit Process Creation' is set to include 'Success'.
# ============================================================
& auditpol.exe /set /subcategory:"Process Creation" /success:enable /failure:disable

# ============================================================
# Check 26145: Ensure 'Audit Account Lockout' is set to include 'Failure'.
# ============================================================
& auditpol.exe /set /subcategory:"Account Lockout" /success:disable /failure:enable

# ============================================================
# Check 26146: Ensure 'Audit Group Membership' is set to include 'Success'.
# ============================================================
& auditpol.exe /set /subcategory:"Group Membership" /success:enable /failure:disable

# ============================================================
# Check 26147: Ensure 'Audit Logoff' is set to include 'Success'.
# ============================================================
& auditpol.exe /set /subcategory:"Logoff" /success:enable /failure:disable

# ============================================================
# Check 26148: Ensure 'Audit Logon' is set to 'Success and Failure'.
# ============================================================
& auditpol.exe /set /subcategory:"Logon" /success:enable /failure:enable

# ============================================================
# Check 26149: Ensure 'Audit Other Logon/Logoff Events' is set to 'Success and Failure'.
# ============================================================
& auditpol.exe /set /subcategory:"Other Logon/Logoff Events" /success:enable /failure:enable

# ============================================================
# Check 26150: Ensure 'Audit Special Logon' is set to include 'Success'.
# ============================================================
& auditpol.exe /set /subcategory:"Special Logon" /success:enable /failure:disable

# ============================================================
# Check 26151: Ensure 'Audit Detailed File Share' is set to include 'Failure'.
# ============================================================
& auditpol.exe /set /subcategory:"Detailed File Share" /success:disable /failure:enable

# ============================================================
# Check 26152: Ensure 'Audit File Share' is set to 'Success and Failure'.
# ============================================================
& auditpol.exe /set /subcategory:"File Share" /success:enable /failure:enable

# ============================================================
# Check 26153: Ensure 'Audit Other Object Access Events' is set to 'Success and Failure'.
# ============================================================
& auditpol.exe /set /subcategory:"Other Object Access Events" /success:enable /failure:enable

# ============================================================
# Check 26154: Ensure 'Audit Removable Storage' is set to 'Success and Failure'.
# ============================================================
& auditpol.exe /set /subcategory:"Removable Storage" /success:enable /failure:enable

# ============================================================
# Check 26155: Ensure 'Audit Audit Policy Change' is set to include 'Success'.
# ============================================================
& auditpol.exe /set /subcategory:"Audit Policy Change" /success:enable /failure:disable

# ============================================================
# Check 26156: Ensure 'Audit Authentication Policy Change' is set to include 'Success'.
# ============================================================
& auditpol.exe /set /subcategory:"Authentication Policy Change" /success:enable /failure:disable

# ============================================================
# Check 26157: Ensure 'Audit Authorization Policy Change' is set to include 'Success'.
# ============================================================
& auditpol.exe /set /subcategory:"Authorization Policy Change" /success:enable /failure:disable

# ============================================================
# Check 26158: Ensure 'Audit MPSSVC Rule-Level Policy Change' is set to 'Success and Failure'.
# ============================================================
& auditpol.exe /set /subcategory:"MPSSVC Rule-Level Policy Change" /success:enable /failure:enable

# ============================================================
# Check 26159: Ensure 'Audit Other Policy Change Events' is set to include 'Failure'.
# ============================================================
& auditpol.exe /set /subcategory:"Other Policy Change Events" /success:disable /failure:enable

# ============================================================
# Check 26160: Ensure 'Audit Sensitive Privilege Use' is set to 'Success and Failure'.
# ============================================================
& auditpol.exe /set /subcategory:"Sensitive Privilege Use" /success:enable /failure:enable

# ============================================================
# Check 26161: Ensure 'Audit IPsec Driver' is set to 'Success and Failure'.
# ============================================================
& auditpol.exe /set /subcategory:"IPsec Driver" /success:enable /failure:enable

# ============================================================
# Check 26162: Ensure 'Audit Other System Events' is set to 'Success and Failure'.
# ============================================================
& auditpol.exe /set /subcategory:"Other System Events" /success:enable /failure:enable

# ============================================================
# Check 26163: Ensure 'Audit Security State Change' is set to include 'Success'.
# ============================================================
& auditpol.exe /set /subcategory:"Security State Change" /success:enable /failure:disable

# ============================================================
# Check 26164: Ensure 'Audit Security System Extension' is set to include 'Success'.
# ============================================================
& auditpol.exe /set /subcategory:"Security System Extension" /success:enable /failure:disable

# ============================================================
# Check 26165: Ensure 'Audit System Integrity' is set to 'Success and Failure'.
# ============================================================
& auditpol.exe /set /subcategory:"System Integrity" /success:enable /failure:enable

# ============================================================
# Check 26166: Ensure 'Prevent enabling lock screen camera' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization' -Name 'NoLockScreenCamera' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26167: Ensure 'Prevent enabling lock screen slide show' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization' -Name 'NoLockScreenSlideshow' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26168: Ensure 'Allow users to enable online speech recognition services' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\InputPersonalization')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\InputPersonalization' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\InputPersonalization' -Name 'AllowInputPersonalization' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26169: Ensure 'Allow Online Tips' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'AllowOnlineTips' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26170: Ensure 'Apply UAC restrictions to local accounts on network logons' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'LocalAccountTokenFilterPolicy' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26171: Ensure 'Configure RPC packet level privacy setting for incoming connections' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Print')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Print' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Print' -Name 'RpcAuthnLevelPrivacyEnabled' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26172: Ensure 'Configure SMB v1 client driver' is set to 'Enabled: Disable driver (recommended)'.
# ============================================================
$serviceName = 'mrxsmb10'
$serviceKey = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
if (Test-Path $serviceKey) {
    Stop-Service -Name $serviceName -Force -ErrorAction SilentlyContinue
    New-ItemProperty -Path $serviceKey -Name 'Start' -Value 4 -PropertyType DWord -Force | Out-Null
}

# ============================================================
# Check 26173: Ensure 'Configure SMB v1 server' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters' -Name 'SMB1' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26174: Ensure 'Enable Certificate Padding' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Cryptography\Wintrust\Config')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Cryptography\Wintrust\Config' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Cryptography\Wintrust\Config' -Name 'EnableCertPaddingCheck' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26175: Ensure 'Enable Structured Exception Handling Overwrite Protection (SEHOP)' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel' -Name 'DisableExceptionChainValidation' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26176: Ensure 'NetBT NodeType configuration' is set to 'Enabled: P-node (recommended)'.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters' -Name 'NodeType' -Value 2 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26177: Ensure 'WDigest Authentication' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest' -Name 'UseLogonCredential' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26178: Ensure 'MSS: (AutoAdminLogon) Enable Automatic Logon' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name 'AutoAdminLogon' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26179: Ensure 'MSS: (DisableIPSourceRouting IPv6) IP source routing protection level is set to 'Enabled: Highest protection, source routing is completely disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters' -Name 'DisableIPSourceRouting' -Value 2 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26180: Ensure 'MSS: (DisableIPSourceRouting) IP source routing protection level ' is set to 'Enabled: Highest protection, source routing is completely disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters' -Name 'DisableIPSourceRouting' -Value 2 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26181: Ensure 'MSS: (DisableSavePassword) Prevent the dial-up password from being saved' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\RasMan\Parameters')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\RasMan\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\RasMan\Parameters' -Name 'DisableSavePassword' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26182: Ensure 'MSS: (EnableICMPRedirect) Allow ICMP redirects to override OSPF generated routes' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters' -Name 'EnableICMPRedirect' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26183: Ensure 'MSS: (KeepAliveTime) How often keep-alive packets are sent in milliseconds' is set to 'Enabled: 300,000 or 5 minutes'.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters' -Name 'KeepAliveTime' -Value 300000 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26184: Ensure 'MSS: (NoNameReleaseOnDemand) Allow the computer to ignore NetBIOS name release requests except from WINS servers' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters' -Name 'NoNameReleaseOnDemand' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26185: Ensure 'MSS: (PerformRouterDiscovery) Allow IRDP to detect and configure Default Gateway addresses' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters' -Name 'PerformRouterDiscovery' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26186: Ensure 'MSS: (SafeDllSearchMode) Enable Safe DLL search mode' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager' -Name 'SafeDllSearchMode' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26187: Ensure 'MSS: (ScreenSaverGracePeriod) The time in seconds before the screen saver grace period expires' is set to 'Enabled: 5 or fewer seconds'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name 'ScreenSaverGracePeriod' -Value 5 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26188: Ensure 'MSS: (TcpMaxDataRetransmissions IPv6) How many times unacknowledged data is retransmitted' is set to 'Enabled: 3'.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters' -Name 'TcpMaxDataRetransmissions' -Value 3 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26189: Ensure 'MSS: (TcpMaxDataRetransmissions) How many times unacknowledged data is retransmitted' is set to 'Enabled: 3'.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters' -Name 'TcpMaxDataRetransmissions' -Value 3 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26190: Ensure 'MSS: (WarningLevel) Percentage threshold for the security event log at which the system will generate a warning' is set to 'Enabled: 90% or less'.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Eventlog\Security')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Eventlog\Security' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Eventlog\Security' -Name 'WarningLevel' -Value 90 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26191: Ensure 'Configure DNS over HTTPS (DoH) name resolution' is set to 'Enabled: Allow DoH' or higher.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient' -Name 'DoHPolicy' -Value 2 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26192: Ensure 'Configure NetBIOS settings' is set to 'Enabled: Disable NetBIOS name resolution on public networks'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient' -Name 'EnableNetbios' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26193: Ensure 'Turn off multicast name resolution' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient' -Name 'EnableMulticast' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26194: Ensure 'Enable Font Providers' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'EnableFontProviders' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26195: Ensure 'Enable insecure guest logons' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation' -Name 'AllowInsecureGuestAuth' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26196: Ensure 'Turn on Mapper I/O (LLTDIO) driver' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\LLTD')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\LLTD' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\LLTD' -Name 'EnableLLTDIO' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26197: Ensure 'Turn on Responder (RSPNDR) driver' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\LLTD')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\LLTD' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\LLTD' -Name 'EnableRspndr' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26198: Ensure 'Turn off Microsoft Peer-to-Peer Networking Services' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Peernet')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Peernet' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Peernet' -Name 'Disabled' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26199: Ensure 'Prohibit installation and configuration of Network Bridge on your DNS domain network' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections' -Name 'NC_AllowNetBridge_NLA' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26200: Ensure 'Prohibit use of Internet Connection Sharing on your DNS domain network' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections' -Name 'NC_ShowSharedAccessUI' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26201: Ensure 'Require domain users to elevate when setting a network's location' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections' -Name 'NC_StdDomainUserSetLocation' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26202: Ensure 'Hardened UNC Paths' is set to 'Enabled, with "Require Mutual Authentication" and "Require Integrity" set for all NETLOGON and SYSVOL shares'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths' -Name '\\*\NETLOGON' -Value 'RequireMutualAuthentication=1, RequireIntegrity=1, RequirePrivacy=1' -PropertyType String -Force | Out-Null
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths' -Name '\\*\SYSVOL' -Value 'RequireMutualAuthentication=1, RequireIntegrity=1, RequirePrivacy=1' -PropertyType String -Force | Out-Null

# ============================================================
# Check 26203: Disable IPv6 (Ensure TCPIP6 Parameter 'DisabledComponents' is set to '0xff (255)').
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters' -Name 'DisabledComponents' -Value 255 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26204: Ensure 'Configuration of wireless settings using Windows Connect Now' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars' -Name 'DisableFlashConfigRegistrar' -Value 0 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars' -Name 'DisableInBand802DOT11Registrar' -Value 0 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars' -Name 'DisableUPnPRegistrar' -Value 0 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars' -Name 'DisableWPDRegistrar' -Value 0 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars' -Name 'EnableRegistrars' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26205: Ensure 'Prohibit access of the Windows Connect Now wizards' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\UI')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\UI' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WCN\UI' -Name 'DisableWcnUi' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26206: Ensure 'Minimize the number of simultaneous connections to the Internet or a Windows Domain' is set to 'Enabled: 3 = Prevent Wi-Fi when on Ethernet'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy' -Name 'fMinimizeConnections' -Value 3 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26207: Ensure 'Prohibit connection to non-domain networks when connected to domain authenticated network' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy' -Name 'fBlockNonDomain' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26208: Ensure 'Allow Windows to automatically connect to suggested open hotspots, to networks shared by contacts, and to hotspots offering paid services' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config' -Name 'AutoConnectAllowedOEM' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26209: Ensure 'Allow Print Spooler to accept client connections' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers')) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers' -Name 'RegisterSpoolerRemoteRpcEndPoint' -Value 2 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26210: Ensure 'Configure Redirection Guard' is set to 'Enabled: Redirection Guard Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers')) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers' -Name 'RedirectionguardPolicy' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26211: Ensure 'Configure RPC connection settings: Protocol to use for outgoing RPC connections' is set to 'Enabled: RPC over TCP'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers\RPC')) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers\RPC' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers\RPC' -Name 'RpcUseNamedPipeProtocol' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26212: Ensure 'Configure RPC connection settings: Use authentication for outgoing RPC connections' is set to 'Enabled: Default'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers\RPC')) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers\RPC' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers\RPC' -Name 'RpcAuthentication' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26213: Ensure 'Configure RPC listener settings: Protocols to allow for incoming RPC connections' is set to 'Enabled: RPC over TCP'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers\RPC')) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers\RPC' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers\RPC' -Name 'RpcProtocols' -Value 5 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26214: Ensure 'Configure RPC listener settings: Authentication protocol to use for incoming RPC connections:' is set to 'Enabled: Negotiate' or higher.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers\RPC')) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers\RPC' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers\RPC' -Name 'ForceKerberosForRpc' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26215: Ensure 'Configure RPC over TCP port' is set to 'Enabled: 0'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers\RPC')) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers\RPC' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers\RPC' -Name 'RpcTcpPort' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26216: Ensure 'Limits print driver installation to Administrators' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint' -Name 'RestrictDriverInstallationToAdministrators' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26217: Ensure 'Manage processing of Queue-specific files' is set to 'Enabled: Limit Queue-specific files to Color profiles'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers')) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers' -Name 'CopyFilesPolicy' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26218: Ensure 'Point and Print Restrictions: When installing drivers for a new connection' is set to 'Enabled: Show warning and elevation prompt'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint')) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint' -Name 'NoWarningNoElevationOnInstall' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26219: Ensure 'Point and Print Restrictions: When updating drivers for an existing connection' is set to 'Enabled: Show warning and elevation prompt'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint')) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint' -Name 'UpdatePromptSettings' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26220: Ensure 'Turn off notifications network usage' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications' -Name 'NoCloudApplicationNotification' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26221: Ensure 'Remove Personalized Website Recommendations from the Recommended section in the Start Menu' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name 'HideRecommendedPersonalizedSites' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26222: Ensure 'Include command line in process creation events' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit' -Name 'ProcessCreationIncludeCmdLine_Enabled' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26223: Ensure 'Encryption Oracle Remediation' is set to 'Enabled: Force Updated Clients'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\CredSSP\Parameters')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\CredSSP\Parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\CredSSP\Parameters' -Name 'AllowEncryptionOracle' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26224: Ensure 'Remote host allows delegation of non- exportable credentials' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation' -Name 'AllowProtectedCreds' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26225: Ensure 'Turn On Virtualization Based Security' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard' -Name 'EnableVirtualizationBasedSecurity' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26226: Ensure 'Turn On Virtualization Based Security: Select Platform Security Level' is set to 'Secure Boot' or higher.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard' -Name 'RequirePlatformSecurityFeatures' -Value 3 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26227: Ensure 'Turn On Virtualization Based Security: Virtualization Based Protection of Code Integrity' is set to 'Enabled with UEFI lock'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard' -Name 'HypervisorEnforcedCodeIntegrity' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26228: Ensure 'Turn On Virtualization Based Security: Require UEFI Memory Attributes Table' is set to 'True (checked)'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard' -Name 'HVCIMATRequired' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26229: Ensure 'Turn On Virtualization Based Security: Credential Guard Configuration' is set to 'Enabled with UEFI lock'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard' -Name 'LsaCfgFlags' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26230: Ensure 'Turn On Virtualization Based Security: Kernel-mode Hardware-enforced Stack Protection' is set to 'Enabled: Enabled in enforcement mode'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard' -Name 'ConfigureKernelShadowStacksLaunch' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26231: Ensure 'Prevent installation of devices that match any of these device IDs' is set to 'Enabled'.
# ============================================================
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceIDs" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions" /v DenyDeviceIDs /t REG_DWORD /d 1 /f

# ============================================================
# Check 26232: Ensure 'Prevent installation of devices that match any of these device IDs: Prevent installation of devices that match any of these device IDs' is set to 'PCI\CC_0C0A'.
# ============================================================
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceIDs" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceIDs" /v 1 /t REG_SZ /d "PCI\CC_0C0A" /f

# ============================================================
# Check 26233: Ensure 'Prevent installation of devices that match any of these device IDs: Also apply to matching devices that are already installed.' is set to 'True'.
# ============================================================
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceIDsRetroactive" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions" /v DenyDeviceIDsRetroactive /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceIDsRetroactive" /v 1 /t REG_DWORD /d 1 /f

# ============================================================
# Check 26234: Ensure 'Prevent installation of devices using drivers that match these device setup classes' is set to 'Enabled'.
# ============================================================
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceClasses" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions" /v DenyDeviceClasses /t REG_DWORD /d 1 /f

# ============================================================
# Check 26235: Ensure 'Prevent installation of devices using drivers that match these device setup classes: Prevent installation of devices using drivers for these device setup' is set to 'IEEE 1394 device setup classes'.
# ============================================================
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceClasses" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceClasses" /v 1 /t REG_SZ /d "{d48179be-ec20-11d1-b6b8-00c04fa372a7}" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceClasses" /v 2 /t REG_SZ /d "{7ebefbc0-3200-11d2-b4c2-00a0C9697d07}" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceClasses" /v 3 /t REG_SZ /d "{c06ff265-ae09-48f0-812c-16753d7cba83}" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceClasses" /v 4 /t REG_SZ /d "{6bdd1fc1-810f-11d0-bec7-08002be2092f}" /f

# ============================================================
# Check 26236: Ensure 'Prevent installation of devices using drivers that match these device setup classes: Also apply to matching devices that are already installed.' is set to 'True'.
# ============================================================
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceClassesRetroactive" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions" /v DenyDeviceClassesRetroactive /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceClassesRetroactive" /v 1 /t REG_DWORD /d 1 /f

# ============================================================
# Check 26237: Ensure 'Prevent device metadata retrieval from the Internet' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata' -Name 'PreventDeviceMetadataFromNetwork' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26238: Ensure 'Boot-Start Driver Initialization Policy' is set to 'Enabled: Good, unknown and bad but critical'.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Policies\EarlyLaunch')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Policies\EarlyLaunch' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Policies\EarlyLaunch' -Name 'DriverLoadPolicy' -Value 3 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26239: Ensure 'Configure registry policy processing: Do not apply during periodic background processing' is set to 'Enabled: FALSE'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}' -Name 'NoBackgroundPolicy' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26240: Ensure 'Configure registry policy processing: Process even if the Group Policy objects have not changed' is set to 'Enabled: TRUE'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}' -Name 'NoGPOListChanges' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26241: Ensure 'Configure security policy processing: Do not apply during periodic background processing' is set to 'Enabled: FALSE'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{827D319E-6EAC-11D2-A4EA-00C04F79F83A}')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{827D319E-6EAC-11D2-A4EA-00C04F79F83A}' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{827D319E-6EAC-11D2-A4EA-00C04F79F83A}' -Name 'NoBackgroundPolicy' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26242: Ensure 'Configure security policy processing: Process even if the Group Policy objects have not changed' is set to 'Enabled: TRUE'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{827D319E-6EAC-11D2-A4EA-00C04F79F83A}')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{827D319E-6EAC-11D2-A4EA-00C04F79F83A}' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{827D319E-6EAC-11D2-A4EA-00C04F79F83A}' -Name 'NoGPOListChanges' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26243: Ensure 'Continue experiences on this device' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'EnableCdp' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26244: Ensure 'Turn off background refresh of Group Policy' is set to 'Disabled'.
# ============================================================
$gpKey = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System'
if (Test-Path $gpKey) { Remove-ItemProperty -Path $gpKey -Name 'DisableBkGndGroupPolicy' -ErrorAction SilentlyContinue }

# ============================================================
# Check 26245: Ensure 'Turn off access to the Store' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name 'NoUseStoreOpenWith' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26246: Ensure 'Turn off downloading of print drivers over HTTP' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers' -Name 'DisableWebPnPDownload' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26247: Ensure 'Turn off handwriting personalization data sharing' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\TabletPC')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\TabletPC' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\TabletPC' -Name 'PreventHandwritingDataSharing' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26248: Ensure 'Turn off handwriting recognition error reporting' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports' -Name 'PreventHandwritingErrorReports' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26249: Ensure 'Turn off Internet Connection Wizard if URL connection is referring to Microsoft.com' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Internet Connection Wizard')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Internet Connection Wizard' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Internet Connection Wizard' -Name 'ExitOnMSICW' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26250: Ensure 'Turn off Internet download for Web publishing and online ordering wizards' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'NoWebServices' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26251: Ensure 'Turn off printing over HTTP' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers' -Name 'DisableHTTPPrinting' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26252: Ensure 'Turn off Registration if URL connection is referring to Microsoft.com' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Registration Wizard Control')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Registration Wizard Control' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Registration Wizard Control' -Name 'NoRegistration' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26253: Ensure 'Turn off Search Companion content file updates' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\SearchCompanion')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\SearchCompanion' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\SearchCompanion' -Name 'DisableContentFileUpdates' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26254: Ensure 'Turn off the "Order Prints" picture task' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'NoOnlinePrintsWizard' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26255: Ensure 'Turn off the "Publish to Web" task for files and folders' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'NoPublishingWizard' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26256: Ensure 'Turn off the Windows Messenger Customer Experience Improvement Program' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Messenger\Client')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Messenger\Client' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Messenger\Client' -Name 'CEIP' -Value 2 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26257: Ensure 'Turn off Windows Customer Experience Improvement Program' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\SQMClient\Windows')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\SQMClient\Windows' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\SQMClient\Windows' -Name 'CEIPEnable' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26258: Ensure 'Turn off Windows Error Reporting' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting' -Name 'Disabled' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26259: Ensure 'Support device authentication using certificate' is set to 'Enabled: Automatic'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\kerberos\parameters')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\kerberos\parameters' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\kerberos\parameters' -Name 'DevicePKInitBehavior' -Value 0 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\kerberos\parameters' -Name 'DevicePKInitEnabled' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26260: Ensure 'Enumeration policy for external devices incompatible with Kernel DMA Protection' is set to 'Enabled: Block All'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Kernel DMA Protection')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Kernel DMA Protection' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Kernel DMA Protection' -Name 'DeviceEnumerationPolicy' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26261: Ensure 'Configure password backup directory' is set to 'Enabled: Active Directory' or 'Enabled: Azure Active Directory'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS' -Name 'BackupDirectory' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26262: Ensure 'Do not allow password expiration time longer than required by policy' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS' -Name 'PwdExpirationProtectionEnabled' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26263: Ensure 'Enable password encryption' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS' -Name 'ADPasswordEncryptionEnabled' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26264: Ensure 'Password Settings: Password Complexity' is set to 'Enabled: Large letters + small letters + numbers + special characters'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS' -Name 'PasswordComplexity' -Value 4 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26265: Ensure 'Password Settings: Password Length' is set to 'Enabled: 15 or more'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS' -Name 'PasswordLength' -Value 15 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26266: Ensure 'Password Settings: Password Age (Days)' is set to 'Enabled: 30 or fewer'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS' -Name 'PasswordAgeDays' -Value 30 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26267: Ensure 'Post-authentication actions: Grace period (hours)' is set to 'Enabled: 8 or fewer hours, but not 0'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS' -Name 'PostAuthenticationResetDelay' -Value 8 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26268: Ensure 'Post-authentication actions: Actions' is set to 'Enabled: Reset the password and logoff the managed account' or higher.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS' -Name 'PostAuthenticationActions' -Value 3 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26269: Ensure 'Allow Custom SSPs and APs to be loaded into LSASS' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'AllowCustomSSPsAPs' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26270: Ensure 'Configures LSASS to run as a protected process' is set to 'Enabled: Enabled with UEFI Lock'.
# ============================================================
if (-not (Test-Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa')) { New-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'RunAsPPL' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26271: Ensure 'Disallow copying of user input methods to the system account for sign-in' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Control Panel\International')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Control Panel\International' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Control Panel\International' -Name 'BlockUserInputMethodsForSignIn' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26272: Ensure 'Block user from showing account details on sign-in' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'BlockUserFromShowingAccountDetailsOnSignin' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26273: Ensure 'Do not display network selection UI' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'DontDisplayNetworkSelectionUI' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26274: Ensure 'Do not enumerate connected users on domain-joined computers' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'DontEnumerateConnectedUsers' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26275: Ensure 'Enumerate local users on domain-joined computers' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'EnumerateLocalUsers' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26276: Ensure 'Turn off app notifications on the lock screen' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'DisableLockScreenAppNotifications' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26277: Ensure 'Turn off picture password sign-in' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'BlockDomainPicturePassword' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26278: Ensure 'Turn on convenience PIN sign-in' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'AllowDomainPINLogon' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26279: Ensure 'Allow Clipboard synchronization across devices' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'AllowCrossDeviceClipboard' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26280: Ensure 'Allow upload of User Activities' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'UploadUserActivities' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26281: Ensure 'Allow network connectivity during connected-standby (on battery)' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9' -Name 'DCSettingIndex' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26282: Ensure 'Allow network connectivity during connected-standby (plugged in)' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9' -Name 'ACSettingIndex' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26283: Ensure 'Allow standby states (S1-S3) when sleeping (on battery)' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab' -Name 'DCSettingIndex' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26284: Ensure 'Allow standby states (S1-S3) when sleeping (plugged in)' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab' -Name 'ACSettingIndex' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26285: Ensure 'Require a password when a computer wakes (on battery)' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51' -Name 'DCSettingIndex' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26286: Ensure 'Require a password when a computer wakes (plugged in)' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51' -Name 'ACSettingIndex' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26287: Ensure 'Configure Offer Remote Assistance' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'fAllowUnsolicited' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26288: Ensure 'Configure Solicited Remote Assistance' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'fAllowToGetHelp' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26289: Ensure 'Enable RPC Endpoint Mapper Client Authentication' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Rpc')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Rpc' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Rpc' -Name 'EnableAuthEpResolution' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26290: Ensure 'Restrict Unauthenticated RPC clients' is set to 'Enabled: Authenticated'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Rpc')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Rpc' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Rpc' -Name 'RestrictRemoteClients' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26291: Ensure 'Microsoft Support Diagnostic Tool: Turn on MSDT interactive communication with support provider' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy' -Name 'DisableQueryRemoteServer' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26292: Ensure 'Enable/Disable PerfTrack' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}' -Name 'ScenarioExecutionEnabled' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26293: Ensure 'Turn off the advertising ID' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo' -Name 'DisabledByGroupPolicy' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26294: Ensure 'Enable Windows NTP Client' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\W32Time\TimeProviders\NtpClient')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\W32Time\TimeProviders\NtpClient' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\W32Time\TimeProviders\NtpClient' -Name 'Enabled' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26295: Ensure 'Enable Windows NTP Server' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\W32Time\TimeProviders\NtpServer')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\W32Time\TimeProviders\NtpServer' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\W32Time\TimeProviders\NtpServer' -Name 'Enabled' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26296: Ensure 'Allow a Windows app to share application data between users' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\AppModel\StateManager')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\AppModel\StateManager' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\AppModel\StateManager' -Name 'AllowSharedLocalAppData' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26297: Ensure 'Prevent non-admin users from installing packaged Windows apps' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Appx')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Appx' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Appx' -Name 'BlockNonAdminUserInstall' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26298: Ensure 'Let Windows apps activate with voice while the system is locked' is set to 'Enabled: Force Deny'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' -Name 'LetAppsActivateWithVoiceAboveLock' -Value 2 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26299: Ensure 'Allow Microsoft accounts to be optional' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'MSAOptional' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26300: Ensure 'Block launching Universal Windows apps with Windows Runtime API access from hosted content.' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'BlockHostedAppAccessWinRT' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26301: Ensure 'Disallow Autoplay for non-volume devices' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name 'NoAutoplayfornonVolume' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26302: Ensure 'Set the default behavior for AutoRun' is set to 'Enabled: Do not execute any autorun commands'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'NoAutorun' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26303: Ensure 'Turn off Autoplay' is set to 'Enabled: All drives'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'NoDriveTypeAutoRun' -Value 255 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26304: Ensure 'Configure enhanced anti-spoofing' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Biometrics\FacialFeatures')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Biometrics\FacialFeatures' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Biometrics\FacialFeatures' -Name 'EnhancedAntiSpoofing' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26305: Ensure 'Allow access to BitLocker-protected fixed data drives from earlier versions of Windows' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'FDVRecovery' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26306: Ensure 'Choose how BitLocker-protected fixed drives can be recovered' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'FDVRecovery' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26307: Ensure 'Choose how BitLocker-protected fixed drives can be recovered: Allow data recovery agent' is set to 'Enabled: True'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'FDVManageDRA' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26308: Ensure 'Choose how BitLocker-protected fixed drives can be recovered: Recovery Password' is set to 'Enabled: Allow 48-digit recovery password' or higher.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'FDVRecoveryPassword' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26309: Ensure 'Choose how BitLocker-protected fixed drives can be recovered: Recovery Key' is set to 'Enabled: Allow 256-bit recovery key' or higher.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'FDVRecoveryKey' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26310: Ensure 'Choose how BitLocker-protected fixed drives can be recovered: Omit recovery options from the BitLocker setup wizard' is set to 'Enabled: True'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'FDVHideRecoveryPage' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26311: Ensure 'Choose how BitLocker-protected fixed drives can be recovered: Save BitLocker recovery information to AD DS for fixed data drives' is set to 'Enabled: False'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'FDVActiveDirectoryBackup' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26312: Ensure 'Choose how BitLocker-protected fixed drives can be recovered: Configure storage of BitLocker recovery information to AD DS' is set to 'Enabled: Backup recovery passwords and key packages'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'FDVActiveDirectoryInfoToStore' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26313: Ensure 'Choose how BitLocker-protected fixed drives can be recovered: Do not enable BitLocker until recovery information is stored to AD DS for fixed data drives' is set to 'Enabled: False'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'FDVRequireActiveDirectoryBackup' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26314: Ensure 'Configure use of hardware-based encryption for fixed data drives' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'FDVHardwareEncryption' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26315: Ensure 'Configure use of passwords for fixed data drives' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'FDVPassphrase' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26316: Ensure 'Configure use of smart cards on fixed data drives' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'FDVAllowUserCert' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26317: Ensure 'Configure use of smart cards on fixed data drives: Require use of smart cards on fixed data drives' is set to 'Enabled: True'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'FDVEnforceUserCert' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26318: Ensure 'Allow enhanced PINs for startup' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'UseEnhancedPin' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26319: Ensure 'Allow Secure Boot for integrity validation' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'OSAllowSecureBootForIntegrity' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26320: Ensure 'Choose how BitLocker-protected operating system drives can be recovered' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'OSRecovery' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26321: Ensure 'Choose how BitLocker-protected operating system drives can be recovered: Allow data recovery agent' is set to 'Enabled: False'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'OSManageDRA' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26322: Ensure 'Choose how BitLocker-protected operating system drives can be recovered: Recovery Password' is set to 'Enabled: Require 48-digit recovery password'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'OSRecoveryPassword' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26323: Ensure 'Choose how BitLocker-protected operating system drives can be recovered: Recovery Key' is set to 'Enabled: Do not allow 256-bit recovery key'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'OSRecoveryKey' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26324: Ensure 'Choose how BitLocker-protected operating system drives can be recovered: Omit recovery options from the BitLocker setup wizard' is set to 'Enabled: True'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'OSHideRecoveryPage' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26325: Ensure 'Choose how BitLocker-protected operating system drives can be recovered: Allow data recovery agent' is set to 'Enabled: False'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'OSActiveDirectoryBackup' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26326: Ensure 'Choose how BitLocker-protected operating system drives can be recovered: Configure storage of BitLocker recovery information to AD DS:' is set to 'Enabled: Store recovery passwords and key packages'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'OSActiveDirectoryInfoToStore' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26327: Ensure 'Choose how BitLocker-protected operating system drives can be recovered: Do not enable BitLocker until recovery information is stored to AD DS for operating system drives' is set to 'Enabled: True'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'OSRequireActiveDirectoryBackup' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26328: Ensure 'Configure use of hardware-based encryption for operating system drives' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'OSHardwareEncryption' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26329: Ensure 'Configure use of passwords for operating system drives' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'OSPassphrase' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26330: Ensure 'Require additional authentication at startup' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'UseAdvancedStartup' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26331: Ensure 'Require additional authentication at startup: Allow BitLocker without a compatible TPM' is set to 'Enabled: False'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'EnableBDEWithNoTPM' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26332: Ensure 'Require additional authentication at startup: Configure TPM startup:' is set to 'Enabled: Do not allow TPM'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'UseTPM' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26333: Ensure 'Require additional authentication at startup: Configure TPM startup PIN:' is set to 'Enabled: Require startup PIN with TPM'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'UseTPMPIN' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26334: Ensure 'Require additional authentication at startup: Configure TPM startup key:' is set to 'Enabled: Do not allow startup key with TPM'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'UseTPMKey' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26335: Ensure 'Require additional authentication at startup: Configure TPM startup key and PIN:' is set to 'Enabled: Do not allow startup key and PIN with TPM'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'UseTPMKeyPIN' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26336: Ensure 'Allow access to BitLocker-protected removable data drives from earlier versions of Windows' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name RDVDiscoveryVolumeType -Value "<none>"

# ============================================================
# Check 26337: Ensure 'Choose how BitLocker-protected removable drives can be recovered' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVRecovery' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26338: Ensure 'Choose how BitLocker-protected removable drives can be recovered: Allow data recovery agent' is set to 'Enabled: True'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVManageDRA' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26339: Ensure 'Choose how BitLocker-protected removable drives can be recovered: Recovery Password' is set to 'Enabled: Do not allow 48-digit recovery password'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVRecoveryPassword' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26340: Ensure 'Choose how BitLocker-protected removable drives can be recovered: Recovery Key' is set to 'Enabled: Do not allow 256-bit recovery key'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVRecoveryKey' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26341: Ensure 'Choose how BitLocker-protected removable drives can be recovered: Omit recovery options from the BitLocker setup wizard' is set to 'Enabled: True'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVHideRecoveryPage' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26342: Ensure 'Choose how BitLocker-protected removable drives can be recovered: Save BitLocker recovery information to AD DS for removable data drives' is set to 'Enabled: False'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVActiveDirectoryBackup' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26343: Ensure 'Choose how BitLocker-protected removable drives can be recovered: Configure storage of BitLocker recovery information to AD DS:' is set to 'Enabled: Backup recovery passwords and key packages'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVActiveDirectoryInfoToStore' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26344: Ensure 'Choose how BitLocker-protected removable drives can be recovered: Do not enable BitLocker until recovery information is stored to AD DS for removable data drives' is set to 'Enabled: False'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVRequireActiveDirectoryBackup' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26345: Ensure 'Configure use of hardware-based encryption for removable data drives' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVHardwareEncryption' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26346: Ensure 'Configure use of passwords for removable data drives' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVPassphrase' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26347: Ensure 'Configure use of smart cards on removable data drives' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVAllowUserCert' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26348: Ensure 'Configure use of smart cards on removable data drives: Require use of smart cards on removable data drives' is set to 'Enabled: True'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVEnforceUserCert' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26349: Ensure 'Deny write access to removable drives not protected by BitLocker' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVDenyWriteAccess' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26350: Ensure 'Deny write access to removable drives not protected by BitLocker: Do not allow write access to devices configured in another organization' is set to 'Enabled: False'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'RDVDenyCrossOrg' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26351: Ensure 'Disable new DMA devices when this computer is locked' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\FVE' -Name 'DisableExternalDMAUnderLock' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26352: Ensure 'Allow Use of Camera' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Camera')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Camera' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Camera' -Name 'AllowCamera' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26353: Ensure 'Turn off cloud consumer account state content' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableConsumerAccountStateContent' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26354: Ensure 'Turn off cloud optimized content' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableCloudOptimizedContent' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26355: Ensure 'Turn off Microsoft consumer experiences' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent' -Name 'DisableWindowsConsumerFeatures' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26356: Ensure 'Require pin for pairing' is set to 'Enabled: First Time' OR 'Enabled: Always'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Connect')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Connect' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Connect' -Name 'RequirePinForPairing' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26357: Ensure 'Do not display the password reveal button' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredUI')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredUI' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredUI' -Name 'DisablePasswordReveal' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26358: Ensure 'Enumerate administrator accounts on elevation' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI' -Name 'EnumerateAdministrators' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26359: Ensure 'Prevent the use of security questions for local accounts' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'NoLocalPasswordResetQuestions' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26360: Ensure 'Allow Diagnostic Data' is set to 'Enabled: Diagnostic data off (not recommended)' or 'Enabled: Send required diagnostic data'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'AllowTelemetry' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26361: Ensure 'Configure Authenticated Proxy usage for the Connected User Experience and Telemetry service' is set to 'Enabled: Disable Authenticated Proxy usage'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'DisableEnterpriseAuthProxy' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26362: Ensure 'Disable OneSettings Downloads' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'DisableOneSettingsDownloads' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26363: Ensure 'Do not show feedback notifications' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'DoNotShowFeedbackNotifications' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26364: Ensure 'Enable OneSettings Auditing' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'EnableOneSettingsAuditing' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26365: Ensure 'Limit Diagnostic Log Collection' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'LimitDiagnosticLogCollection' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26366: Ensure 'Limit Dump Collection' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'LimitDumpCollection' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26367: Ensure 'Toggle user control over Insider builds' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds' -Name 'AllowBuildPreview' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26368: Ensure 'Download Mode' is NOT set to 'Enabled: Internet'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization' -Name 'DODownloadMode' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26369: Ensure 'Enable App Installer' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppInstaller')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppInstaller' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppInstaller' -Name 'EnableAppInstaller' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26370: Ensure 'Enable App Installer Experimental Features' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppInstaller')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppInstaller' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppInstaller' -Name 'EnableExperimentalFeatures' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26371: Ensure 'Enable App Installer Hash Override' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppInstaller')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppInstaller' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppInstaller' -Name 'EnableHashOverride' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26372: Ensure 'Enable App Installer ms-appinstaller protocol' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppInstaller')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppInstaller' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppInstaller' -Name 'EnableMSAppInstallerProtocol' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26373: Ensure 'Application: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application' -Name 'Retention' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26374: Ensure 'Application: Specify the maximum log file size (KB)' is set to 'Enabled: 32,768 or greater'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application' -Name 'MaxSize' -Value 32768 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26375: Ensure 'Security: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security' -Name 'Retention' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26376: Ensure 'Security: Specify the maximum log file size (KB)' is set to 'Enabled: 196,608 or greater'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security' -Name 'MaxSize' -Value 196608 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26377: Ensure 'Setup: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Setup')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Setup' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Setup' -Name 'Retention' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26378: Ensure 'Setup: Specify the maximum log file size (KB)' is set to 'Enabled: 32,768 or greater'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Setup')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Setup' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Setup' -Name 'MaxSize' -Value 32768 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26379: Ensure 'System: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\System')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\System' -Name 'Retention' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26380: Ensure 'System: Specify the maximum log file size (KB)' is set to 'Enabled: 32,768 or greater'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\System')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\System' -Name 'MaxSize' -Value 32768 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26381: Ensure 'Turn off account-based insights, recent, favorite, and recommended files in File Explorer' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name 'DisableGraphRecentItems' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26382: Ensure 'Turn off Data Execution Prevention for Explorer' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name 'NoDataExecutionPrevention' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26383: Ensure 'Turn off heap termination on corruption' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name 'NoHeapTerminationOnCorruption' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26384: Ensure 'Turn off shell protocol protected mode' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'PreXPSP2ShellProtocolBehavior' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26385: Ensure 'Turn off location' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors' -Name 'DisableLocation' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26386: Ensure 'Allow Message Service Cloud Sync' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Messaging')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Messaging' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Messaging' -Name 'AllowMessageSync' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26387: Ensure 'Block all consumer Microsoft account user authentication' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftAccount')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftAccount' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftAccount' -Name 'DisableUserAuth' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26388: Ensure 'Configure local setting override for reporting to Microsoft MAPS' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet' -Name 'LocalSettingOverrideSpynetReporting' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26389: Ensure 'Join Microsoft MAPS' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet' -Name 'SpynetReporting' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26390: Ensure 'Configure Attack Surface Reduction rules' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR')) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR' -Name 'ExploitGuard_ASR_Rules' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26391: Ensure 'Configure Attack Surface Reduction rules: Set the state for each ASR rule' is configured.
# ============================================================
if (-not (Test-Path 'HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules')) { New-Item -Path 'HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules' -Name '26190899-1602-49E8-8B27-eB1D0A1CE869' -Value 1 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules' -Name '3B576869-A4EC-4529-8536-B80A7769E899' -Value 1 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules' -Name '5BEB7EFE-FD9A-4556-801D-275E5FFC04CC' -Value 1 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules' -Name '75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84' -Value 1 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules' -Name '7674BA52-37EB-4A4F-A9A1-F0F9A1619A2C' -Value 1 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules' -Name '92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B' -Value 1 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules' -Name '9E6C4E1F-7D60-472F-bA1A-A39EF669E4B2' -Value 1 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules' -Name 'B2B3F03D-6A65-4F7B-A9C7-1C7EF74A9BA4' -Value 1 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules' -Name 'BE9BA2D9-53EA-4CDC-84E5-9B1EEEE46550' -Value 1 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules' -Name 'D3E037E1-3EB8-44C8-A917-57927947596D' -Value 1 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules' -Name 'D4F940AB-401B-4EFC-AADC-AD5F3C50688A' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26392: Ensure 'Prevent users and apps from accessing dangerous websites' is set to 'Enabled: Block'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection' -Name 'EnableNetworkProtection' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26393: Ensure 'Enable file hash computation feature' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine' -Name 'EnableFileHashComputation' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26394: Ensure 'Scan all downloaded files and attachments' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-TimeProtection')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-TimeProtection' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-TimeProtection' -Name 'DisableIOAVProtection' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26395: Ensure 'Turn off real-time protection' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-TimeProtection')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-TimeProtection' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-TimeProtection' -Name 'DisableRealtimeMonitoring' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26396: Ensure 'Turn on behavior monitoring' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-TimeProtection')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-TimeProtection' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-TimeProtection' -Name 'DisableBehaviorMonitoring' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26397: Ensure 'Turn on script scanning' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-TimeProtection')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-TimeProtection' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-TimeProtection' -Name 'DisableScriptScanning' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26398: Ensure 'Configure Watson events' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting' -Name 'DisableGenericRePorts' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26399: Ensure 'Scan packed executables' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan' -Name 'DisablePackedExeScanning' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26400: Ensure 'Scan removable drives' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan' -Name 'DisableRemovableDriveScanning' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26401: Ensure 'Turn on e-mail scanning' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan' -Name 'DisableEmailScanning' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26402: Ensure 'Configure detection for potentially unwanted applications' is set to 'Enabled: Block'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender' -Name 'PUAProtection' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26403: Ensure 'Turn off Microsoft Defender AntiVirus' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender' -Name 'DisableAntiSpyware' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26404: Ensure 'Allow auditing events in Microsoft Defender Application Guard' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\AppHVSI')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\AppHVSI' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\AppHVSI' -Name 'AuditApplicationGuard' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26405: Ensure 'Allow camera and microphone access in Microsoft Defender Application Guard' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\AppHVSI')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\AppHVSI' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\AppHVSI' -Name 'AllowCameraMicrophoneRedirection' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26406: Ensure 'Allow data persistence for Microsoft Defender Application Guard' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\AppHVSI')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\AppHVSI' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\AppHVSI' -Name 'AllowPersistence' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26407: Ensure 'Allow files to download and save to the host operating system from Microsoft Defender Application Guard' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\AppHVSI')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\AppHVSI' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\AppHVSI' -Name 'SaveFilesToHost' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26408: Ensure 'Configure Microsoft Defender Application Guard clipboard settings: Clipboard behavior setting' is set to 'Enabled: Enable clipboard operation from an isolated session to the host'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\AppHVSI')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\AppHVSI' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\AppHVSI' -Name 'AppHVSIClipboardSettings' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26409: Ensure 'Turn on Microsoft Defender Application Guard in Managed Mode' is set to 'Enabled: 1'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\AppHVSI')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\AppHVSI' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\AppHVSI' -Name 'AllowAppHVSI_ProviderSet' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26410: Ensure 'Enable news and interests on the taskbar' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds' -Name 'EnableFeeds' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26411: Ensure 'Prevent the usage of OneDrive for file storage' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive' -Name 'DisableFileSyncNGSC' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26412: Ensure 'Turn off Push To Install service' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\PushToInstall')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\PushToInstall' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\PushToInstall' -Name 'DisablePushToInstall' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26413: Ensure 'Disable Cloud Clipboard integration for server-to-client data transfer' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\Client')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\Client' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\Client' -Name 'DisableCloudClipboardIntegration' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26414: Ensure 'Do not allow passwords to be saved' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'DisablePasswordSaving' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26415: Ensure 'Allow users to connect remotely by using Remote Desktop Services' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'fDenyTSConnections' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26416: Ensure 'Allow UI Automation redirection' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'EnableUiaRedirection' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26417: Ensure 'Do not allow COM port redirection' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'fDisableCcm' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26418: Ensure 'Do not allow drive redirection' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'fDisableCdm' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26419: Ensure 'Do not allow location redirection' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'fDisableLocationRedir' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26420: Ensure 'Do not allow LPT port redirection' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'fDisableLPT' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26421: Ensure 'Do not allow supported Plug and Play device redirection' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'fDisablePNPRedir' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26422: Ensure 'Do not allow WebAuthn redirection' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'fDisableWebAuthn' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26423: Ensure 'Always prompt for password upon connection' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'fPromptForPassword' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26424: Ensure 'Require secure RPC communication' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'fEncryptRPCTraffic' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26425: Ensure 'Require use of specific security layer for remote (RDP) connections' is set to 'Enabled: SSL'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'SecurityLayer' -Value 2 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26426: Ensure 'Require user authentication for remote connections by using Network Level Authentication' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'UserAuthentication' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26427: Ensure 'Set client connection encryption level' is set to 'Enabled: High Level'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'MinEncryptionLevel' -Value 3 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26428: Ensure 'Set time limit for active but idle Remote Desktop Services sessions' is set to 'Enabled: 15 minutes or less, but not Never (0)'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'MaxIdleTime' -Value 900 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26429: Ensure 'Set time limit for disconnected sessions' is set to 'Enabled: 1 minute'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'MaxDisconnectionTime' -Value 60000 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26430: Ensure 'Do not delete temp folders upon exit' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Name 'DeleteTempDirsOnExit' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26431: Ensure 'Prevent downloading of enclosures' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds' -Name 'DisableEnclosureDownload' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26432: Ensure 'Allow Cloud Search' is set to 'Enabled: Disable Cloud Search'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'AllowCloudSearch' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26433: Ensure 'Allow Cortana' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'AllowCortana' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26434: Ensure 'Allow Cortana above lock screen' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'AllowCortanaAboveLock' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26435: Ensure 'Allow indexing of encrypted files' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'AllowIndexingEncryptedStoresOrItems' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26436: Ensure 'Allow search and Cortana to use location' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'AllowSearchToUseLocation' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26437: Ensure 'Allow search highlights' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'EnableDynamicContentInWSB' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26438: Ensure 'Turn off KMS Client Online AVS Validation' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform' -Name 'NoGenTicket' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26439: Ensure 'Disable all apps from Microsoft Store' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore' -Name 'DisableStoreApps' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26440: Ensure 'Only display the private store within the Microsoft Store' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore' -Name 'RequirePrivateStoreOnly' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26441: Ensure 'Turn off Automatic Download and Install of updates' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore' -Name 'AutoDownload' -Value 4 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26442: Ensure 'Turn off the offer to update to the latest version of Windows' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore' -Name 'DisableOSUpgrade' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26443: Ensure 'Turn off the Store application' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore' -Name 'RemoveWindowsStore' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26444: Ensure 'Allow widgets' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Dsh')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Dsh' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Dsh' -Name 'AllowNewsAndInterests' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26445: Ensure 'Automatic Data Collection' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components' -Name 'CaptureThreatWindow' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26446: Ensure 'Notify Malicious' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components' -Name 'NotifyMalicious' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26447: Ensure 'Notify Password Reuse' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components' -Name 'NotifyPasswordReuse' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26448: Ensure 'Notify Unsafe App' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components' -Name 'NotifyUnsafeApp' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26449: Ensure 'Service Enabled' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components' -Name 'ServiceEnabled' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26450: Ensure 'Configure Windows Defender SmartScreen' is set to 'Enabled: Warn and prevent bypass'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'EnableSmartScreen' -Value 1 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'ShellSmartScreenLevel' -Value 'Block' -PropertyType String -Force | Out-Null

# ============================================================
# Check 26451: Ensure 'Enables or disables Windows Game Recording and Broadcasting' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR' -Name 'AllowGameDVR' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26452: Ensure 'Enable ESS with Supported Peripherals' is set to 'Enabled: 1'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR' -Name 'EnableESSwithSupportedPeripherals' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26453: Ensure 'Allow suggested apps in Windows Ink Workspace' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace' -Name 'AllowSuggestedAppsInWindowsInkWorkspace' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26454: Ensure 'Allow Windows Ink Workspace' is set to 'Enabled: On, but disallow access above lock' OR 'Enabled: Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace' -Name 'AllowWindowsInkWorkspace' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26455: Ensure 'Allow user control over installs' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer' -Name 'EnableUserControl' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26456: Ensure 'Always install with elevated privileges' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer' -Name 'AlwaysInstallElevated' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26457: Ensure 'Prevent Internet Explorer security prompt for Windows Installer scripts' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer' -Name 'SafeForScripting' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26458: Ensure 'Enable MPR notifications for the system' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'EnableMPR' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26459: Ensure 'Sign-in and lock last interactive user automatically after a restart' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System')) { New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'DisableAutomaticRestartSignOn' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26460: Ensure 'Turn on PowerShell Script Block Logging' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging' -Name 'EnableScriptBlockLogging' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26461: Ensure 'Turn on PowerShell Transcription' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription' -Name 'EnableTranscripting' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26462: Ensure 'Allow Basic authentication' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client' -Name 'AllowBasic' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26463: Ensure 'Allow unencrypted traffic' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client' -Name 'AllowUnencryptedTraffic' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26464: Ensure 'Disallow Digest authentication' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client' -Name 'AllowDigest' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26465: Ensure 'Allow Basic authentication' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service' -Name 'AllowBasic' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26466: Ensure 'Allow remote server management through WinRM' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service' -Name 'AllowAutoConfig' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26467: Ensure 'Allow unencrypted traffic' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service' -Name 'AllowUnencryptedTraffic' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26468: Ensure 'Disallow WinRM from storing RunAs credentials' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service' -Name 'DisableRunAs' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26469: Ensure 'Allow Remote Shell Access' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service\WinRS')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service\WinRS' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service\WinRS' -Name 'AllowRemoteShellAccess' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26470: Ensure 'Allow clipboard sharing with Windows Sandbox' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Sandbox')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Sandbox' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Sandbox' -Name 'AllowClipboardRedirection' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26471: Ensure 'Allow networking in Windows Sandbox' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Sandbox')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Sandbox' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Sandbox' -Name 'AllowNetworking' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26472: Ensure 'Prevent users from modifying settings' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\App and Browser protection')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\App and Browser protection' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\App and Browser protection' -Name 'DisallowExploitProtectionOverride' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26473: Ensure 'No auto-restart with logged on users for scheduled automatic updates installations' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'NoAutoRebootWithLoggedOnUsers' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26474: Ensure 'Configure Automatic Updates' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'NoAutoUpdate' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26475: Ensure 'Configure Automatic Updates: Scheduled install day' is set to '0 - Every day'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'ScheduledInstallDay' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26476: Ensure 'Enable features introduced via servicing that are off by default' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'AllowTemporaryEnterpriseFeatureControl' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26477: Ensure 'Remove access to "Pause updates" feature' is set to 'Enabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'SetDisablePauseUXAccess' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26478: Ensure 'Manage preview builds' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'ManagePreviewBuildsPolicyValue' -Value 1 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26479: Ensure 'Select when Preview Builds and Feature Updates are received' is set to 'Enabled: 180 or more days'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'DeferFeatureUpdates' -Value 1 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'DeferFeatureUpdatesPeriodInDays' -Value 180 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26480: Ensure 'Select when Quality Updates are received' is set to 'Enabled: 0 days'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'DeferQualityUpdates' -Value 1 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'DeferQualityUpdatesPeriodInDays' -Value 0 -PropertyType DWord -Force | Out-Null

# ============================================================
# Check 26481: Ensure 'Enable optional updates' is set to 'Disabled'.
# ============================================================
if (-not (Test-Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate')) { New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Force | Out-Null }
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'AllowOptionalContent' -Value 0 -PropertyType DWord -Force | Out-Null
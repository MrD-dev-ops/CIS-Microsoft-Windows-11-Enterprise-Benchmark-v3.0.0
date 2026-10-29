# Detected Changes — CIS Microsoft Windows 11 Stand-alone: v5.0.0 vs. Remediate.ps1 (v3.0.0)

Cross-reference of the new CIS Microsoft Windows 11 Stand-alone Benchmark v5.0.0 (`/home/mrd/Downloads/Wazuh/cis_win11.txt`) against the older remediation script settings (`/home/mrd/Downloads/Wazuh/Remediate.ps1`, authored for v3.0.0).

Batches completed so far:
- Checks 26000–26025
- Checks 26026–26050 (this batch)
- Checks 26051–26075 (this batch)
- Checks 26076–26100 (this batch)
- Checks 26101–26130 (this batch)
- Checks 26131–26175 (this batch)

## Overall summary (Checks 26000–26175)

- Checks evaluated: 176 (26000–26175)
- No change required — remediation script already compliant with v5.0.0: 153
- Recommendation removed / no v5.0.0 counterpart found: 20
- Value changed: 3

## Checks 26000–26025

### Check 26000
- Remediation title: Ensure 'Enforce password history' is set to '24 or more password(s)'.
- Remediation script action/value: `net accounts /uniquepw:24`
- v5.0.0 benchmark required value: 24 or more password(s)
- Change detected: NO_CHANGE
- Details: Remediation sets password history via `net accounts /uniquepw:24`. v5.0.0 requires 24 or more passwords; script value of 24 satisfies the requirement.

### Check 26001
- Remediation title: Ensure 'Maximum password age' is set to '365 or fewer days, but not 0'.
- Remediation script action/value: `net accounts /maxpwage:365`
- v5.0.0 benchmark required value: 365 or fewer days, but not 0
- Change detected: NO_CHANGE
- Details: Remediation sets max password age via `net accounts /maxpwage:365`. v5.0.0 requires 365 or fewer days, not 0; compliant.

### Check 26002
- Remediation title: Ensure 'Minimum password age' is set to '1 or more day(s)'.
- Remediation script action/value: `net accounts /minpwage:1`
- v5.0.0 benchmark required value: 1 or more day(s)
- Change detected: NO_CHANGE
- Details: Remediation sets minimum password age via `net accounts /minpwage:1`. v5.0.0 requires 1 or more day(s); compliant.

### Check 26003
- Remediation title: Ensure 'Minimum password length' is set to '14 or more character(s)'.
- Remediation script action/value: `net accounts /minpwlen:14`
- v5.0.0 benchmark required value: 14 or more character(s)
- Change detected: NO_CHANGE
- Details: Remediation sets minimum password length via `net accounts /minpwlen:14`. v5.0.0 requires 14 or more characters; compliant.

### Check 26004
- Remediation title: Ensure 'Relax minimum password length limits' is set to 'Enabled'.
- Remediation script action/value: `New-ItemProperty ... -Name 'RelaxMinimumPasswordLengthLimits' -Value 1 ...`
- v5.0.0 benchmark required value: Enabled
- Change detected: NO_CHANGE
- Details: Remediation sets `RelaxMinimumPasswordLengthLimits=1`. v5.0.0 requires Enabled; compliant.

### Check 26005
- Remediation title: Ensure 'Account lockout duration' is set to '15 or more minute(s)'.
- Remediation script action/value: `net accounts /lockoutduration:15`
- v5.0.0 benchmark required value: 15 or more minute(s)
- Change detected: NO_CHANGE
- Details: Remediation sets lockout duration via `net accounts /lockoutduration:15`. v5.0.0 requires 15 or more minutes; compliant.

### Check 26006
- Remediation title: Ensure 'Account lockout threshold' is set to '5 or fewer invalid logon attempt(s), but not 0'.
- Remediation script action/value: `net accounts /lockoutthreshold:5`
- v5.0.0 benchmark required value: 5 or fewer invalid logon attempt(s), but not 0
- Change detected: NO_CHANGE
- Details: Remediation sets lockout threshold via `net accounts /lockoutthreshold:5`. v5.0.0 requires 5 or fewer attempts; compliant.

### Check 26007
- Remediation title: Ensure 'Reset account lockout counter after' is set to '15 or more minute(s)'.
- Remediation script action/value: `net accounts /lockoutwindow:15`
- v5.0.0 benchmark required value: 15 or more minute(s)
- Change detected: NO_CHANGE
- Details: Remediation sets reset counter via `net accounts /lockoutwindow:15`. v5.0.0 requires 15 or more minutes; compliant.

### Check 26008
- Remediation title: Ensure 'Accounts: Block Microsoft accounts' is set to 'Users can't add or log on with Microsoft accounts'.
- Remediation script action/value: `New-ItemProperty ... -Name 'NoConnectedUser' -Value 3 ...`
- v5.0.0 benchmark required value: Not found (recommendation removed in v5.0.0)
- Change detected: MISSING
- Details: Remediation script retains the Block Microsoft accounts check; v5.0.0 removed it (Accounts 2.3.1). Remediation script check should be reviewed/removed for v5.0.0 alignment.

### Check 26009
- Remediation title: Ensure 'Accounts: Guest account status' is set to 'Disabled'.
- Remediation script action/value: Disable Guest via `Win32_UserAccount -Filter "SID = 'S-1-5-32-546'"` / `$_.Disable()`
- v5.0.0 benchmark required value: Disabled
- Change detected: NO_CHANGE
- Details: Remediation disables Guest; v5.0.0 requires Disabled; compliant.

### Check 26010
- Remediation title: Ensure 'Accounts: Limit local account use of blank passwords to console logon only' is set to 'Enabled'.
- Remediation script action/value: `New-ItemProperty ... -Name 'LimitBlankPasswordUse' -Value 1 ...`
- v5.0.0 benchmark required value: Enabled
- Change detected: NO_CHANGE
- Details: Remediation sets `LimitBlankPasswordUse=1`. v5.0.0 requires Enabled; compliant.

### Check 26011
- Remediation title: Configure 'Accounts: Rename administrator account'.
- Remediation script action/value: `Rename-LocalUser -Name "Administrator" -NewName "SystemOperator"` (and legacy `xAdministrator` → `SystemOperator`)
- v5.0.0 benchmark required value: Rename administrator account (CIS 2.3.1.3)
- Change detected: NO_CHANGE
- Details: Remediation performs rename; v5.0.0 requires rename; compliant.

### Check 26012
- Remediation title: Configure 'Accounts: Rename guest account'.
- Remediation script action/value: `Rename-LocalUser -Name "Guest" -NewName "TemporaryUser"` (and legacy `xGuest` → `TemporaryUser`)
- v5.0.0 benchmark required value: Rename guest account (CIS 2.3.1.4)
- Change detected: NO_CHANGE
- Details: Remediation performs rename; v5.0.0 requires rename; compliant.

## Checks 26013–26025

### Check 26013
- Remediation title: Ensure 'Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings' is set to 'Enabled'.
- Remediation script action/value: `New-ItemProperty ... -Name 'SCENoApplyLegacyAuditPolicy' -Value 1 ...`
- v5.0.0 benchmark required value: Enabled
- Change detected: NO_CHANGE
- Details: Remediation sets `SCENoApplyLegacyAuditPolicy=1`; v5.0.0 requires Enabled; compliant.

### Check 26014
- Remediation title: Ensure 'Audit: Shut down system immediately if unable to log security audits' is set to 'Disabled'.
- Remediation script action/value: `New-ItemProperty ... -Name 'CrashOnAuditFail' -Value 0 ...`
- v5.0.0 benchmark required value: Disabled
- Change detected: NO_CHANGE
- Details: Remediation sets `CrashOnAuditFail=0`; v5.0.0 requires Disabled; compliant.

### Check 26015
- Remediation title: Ensure 'Devices: Prevent users from installing printer drivers' is set to 'Enabled'.
- Remediation script action/value: `New-ItemProperty ... -Name 'AddPrinterDrivers' -Value 1 ...`
- v5.0.0 benchmark required value: Enabled
- Change detected: NO_CHANGE
- Details: Remediation sets `AddPrinterDrivers=1`; v5.0.0 requires Enabled; compliant.

### Check 26016
- Remediation title: Ensure 'Domain member: Digitally encrypt or sign secure channel data (always)' is set to 'Enabled'.
- Remediation script action/value: `New-ItemProperty ... -Name 'RequireSignOrSeal' -Value 1 ...`
- v5.0.0 benchmark required value: Not found (section 2.3.6 Domain member intentionally blank)
- Change detected: MISSING
- Details: Remediation writes Netlogon `RequireSignOrSeal=1`; no comparable v5.0.0 required value exists.

### Check 26017
- Remediation title: Ensure 'Domain member: Digitally encrypt secure channel data (when possible)' is set to 'Enabled'.
- Remediation script action/value: `New-ItemProperty ... -Name 'SealSecureChannel' -Value 1 ...`
- v5.0.0 benchmark required value: Not found (section 2.3.6 Domain member intentionally blank)
- Change detected: MISSING
- Details: Remediation writes Netlogon `SealSecureChannel=1`; no comparable v5.0.0 required value exists.

### Check 26018
- Remediation title: Ensure 'Domain member: Digitally sign secure channel data (when possible)' is set to 'Enabled'.
- Remediation script action/value: `New-ItemProperty ... -Name 'SignSecureChannel' -Value 1 ...`
- v5.0.0 benchmark required value: Not found (section 2.3.6 Domain member intentionally blank)
- Change detected: MISSING
- Details: Remediation writes Netlogon `SignSecureChannel=1`; no comparable v5.0.0 required value exists.

### Check 26019
- Remediation title: Ensure 'Domain member: Disable machine account password changes' is set to 'Disabled'.
- Remediation script action/value: `New-ItemProperty ... -Name 'DisablePasswordChange' -Value 0 ...`
- v5.0.0 benchmark required value: Not found (section 2.3.6 Domain member intentionally blank)
- Change detected: MISSING
- Details: Remediation writes Netlogon `DisablePasswordChange=0`; no comparable v5.0.0 required value exists.

### Check 26020
- Remediation title: Ensure 'Domain member: Maximum machine account password age' is set to '30 or fewer days, but not 0'.
- Remediation script action/value: `New-ItemProperty ... -Name 'MaximumPasswordAge' -Value 30 ...`
- v5.0.0 benchmark required value: Not found (section 2.3.6 Domain member intentionally blank)
- Change detected: MISSING
- Details: Remediation writes Netlogon `MaximumPasswordAge=30`; no comparable v5.0.0 required value exists.

### Check 26021
- Remediation title: Ensure 'Domain member: Require strong (Windows 2000 or later) session key' is set to 'Enabled'.
- Remediation script action/value: `New-ItemProperty ... -Name 'RequireStrongKey' -Value 1 ...`
- v5.0.0 benchmark required value: Not found (section 2.3.6 Domain member intentionally blank)
- Change detected: MISSING
- Details: Remediation writes Netlogon `RequireStrongKey=1`; no comparable v5.0.0 required value exists.

### Check 26022
- Remediation title: Ensure 'Interactive logon: Do not require CTRL+ALT+DEL' is set to 'Disabled'.
- Remediation script action/value: `New-ItemProperty ... -Name 'DisableCAD' -Value 0 ...`
- v5.0.0 benchmark required value: Disabled
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableCAD=0`; v5.0.0 requires Disabled; compliant.

### Check 26023
- Remediation title: Ensure 'Interactive logon: Don't display last signed-in' is set to 'Enabled'.
- Remediation script action/value: `New-ItemProperty ... -Name 'DontDisplayLastUserName' -Value 1 ...`
- v5.0.0 benchmark required value: Enabled
- Change detected: NO_CHANGE
- Details: Remediation sets `DontDisplayLastUserName=1`; v5.0.0 requires Enabled; compliant.

### Check 26024
- Remediation title: Ensure 'Interactive logon: Machine account lockout threshold' is set to '10 or fewer invalid logon attempts, but not 0'.
- Remediation script action/value: `New-ItemProperty ... -Name 'MaxDevicePasswordFailedAttempts' -Value 10 ...`
- v5.0.0 benchmark required value: Not found (recommendation removed in v5.0.0)
- Change detected: MISSING
- Details: Remediation writes `MaxDevicePasswordFailedAttempts=10`; v5.0.0 removed this recommendation (Interactive logon 2.3.7, REMOVE, Ticket #26461).

### Check 26025
- Remediation title: Ensure 'Interactive logon: Machine inactivity limit' is set to '900 or fewer second(s), but not 0'.
- Remediation script action/value: `New-ItemProperty ... -Name 'InactivityTimeoutSecs' -Value 900 ...`
- v5.0.0 benchmark required value: 900 or fewer second(s), but not 0
- Change detected: NO_CHANGE
- Details: Remediation sets `InactivityTimeoutSecs=900`; v5.0.0 requires 900 or fewer seconds, not 0; compliant.

## Checks 26026–26050 (this batch)

### Check 26026
- Remediation title: Configure 'Interactive logon: Message text for users attempting to log on'.
- Remediation script action/value: `New-ItemProperty ... -Name 'legalnoticetext' -Value 'WARNING: ...' ...`
- v5.0.0 benchmark required value: Value consistent with security/operational requirements (Automated, L1); default: No message; audit registry: LegalNoticeText REG_SZ
- Change detected: NO_CHANGE
- Details: Remediation sets LegalNoticeText; v5.0.0 requires a value consistent with org requirements; compliant.

### Check 26027
- Remediation title: Configure 'Interactive logon: Message title for users attempting to log on'.
- Remediation script action/value: `New-ItemProperty ... -Name 'legalnoticecaption' -Value 'Security Policy' ...`
- v5.0.0 benchmark required value: Value consistent with security/operational requirements (Automated, L1); default: No message; audit registry: LegalNoticeCaption REG_SZ
- Change detected: NO_CHANGE
- Details: Remediation sets LegalNoticeCaption; v5.0.0 requires a value consistent with org requirements; compliant.

### Check 26028
- Remediation title: Ensure 'Interactive logon: Number of previous logons to cache (in case domain controller is not available)' is set to '4 or fewer logon(s)'.
- Remediation script action/value: `New-ItemProperty ... -Name 'CachedLogonsCount' -Value 4 ...`
- v5.0.0 benchmark required value: Not found (no matching v5.0.0 recommendation found)
- Change detected: MISSING
- Details: Remediation writes CachedLogonsCount=4; no matching v5.0.0 required value exists; classified MISSING.

### Check 26029
- Remediation title: Ensure 'Interactive logon: Prompt user to change password before expiration' is set to 'between 5 and 14 days'.
- Remediation script action/value: `New-ItemProperty ... -Name 'PasswordExpiryWarning' -Value 14 ...`
- v5.0.0 benchmark required value: Between 5 and 14 days (Automated, L1)
- Change detected: NO_CHANGE
- Details: Remediation sets PasswordExpiryWarning=14; within required 5–14 days; compliant.

### Check 26030
- Remediation title: Ensure 'Interactive logon: Smart card removal behavior' is set to 'Lock Workstation' or higher.
- Remediation script action/value: `New-ItemProperty ... -Name 'ScRemoveOption' -Value 1 ...`
- v5.0.0 benchmark required value: Lock Workstation or higher (ScRemoveOption = 1, 2 or 3)
- Change detected: NO_CHANGE
- Details: Remediation sets ScRemoveOption=1 (Lock Workstation); satisfies required value; compliant.

### Check 26031
- Remediation title: Ensure 'Microsoft network client: Digitally sign communications (always)' is set to 'Enabled'.
- Remediation script action/value: `New-ItemProperty ... -Name 'RequireSecuritySignature' -Value 1 ...`
- v5.0.0 benchmark required value: Enabled (Automated, L1)
- Change detected: NO_CHANGE
- Details: Remediation sets RequireSecuritySignature=1; maps to Enabled; compliant.

### Check 26032
- Remediation title: Ensure 'Microsoft network client: Digitally sign communications (if server agrees)' is set to 'Enabled'.
- Remediation script action/value: `New-ItemProperty ... -Name 'EnableSecuritySignature' -Value 1 ...`
- v5.0.0 benchmark required value: Not found (REMOVE in v5.0.0, Ticket #25347)
- Change detected: MISSING
- Details: Remediation writes EnableSecuritySignature=1; v5.0.0 removed this recommendation; classified MISSING.

### Check 26033
- Remediation title: Ensure 'Microsoft network client: Send unencrypted password to third-party SMB servers' is set to 'Disabled'.
- Remediation script action/value: `New-ItemProperty ... -Name 'EnablePlainTextPassword' -Value 0 ...`
- v5.0.0 benchmark required value: Disabled (Automated, L1)
- Change detected: NO_CHANGE
- Details: Remediation sets EnablePlainTextPassword=0; maps to Disabled; compliant.

### Check 26034
- Remediation title: Ensure 'Microsoft network server: Amount of idle time required before suspending session' is set to '15 or fewer minute(s)'.
- Remediation script action/value: `New-ItemProperty ... -Name 'AutoDisconnect' -Value 15 ...`
- v5.0.0 benchmark required value: 15 or fewer minute(s) (Automated, L1)
- Change detected: NO_CHANGE
- Details: Remediation sets AutoDisconnect=15; within required value; compliant.

### Check 26035
- Remediation title: Ensure 'Microsoft network server: Digitally sign communications (always)' is set to 'Enabled'.
- Remediation script action/value: `New-ItemProperty ... -Name 'RequireSecuritySignature' -Value 1 ...`
- v5.0.0 benchmark required value: Enabled (Automated, L1)
- Change detected: NO_CHANGE
- Details: Remediation sets RequireSecuritySignature=1; maps to Enabled; compliant.

### Check 26036
- Remediation title: Ensure 'Microsoft network server: Digitally sign communications (if client agrees)' is set to 'Enabled'.
- Remediation script action/value: `New-ItemProperty ... -Name 'EnableSecuritySignature' -Value 1 ...`
- v5.0.0 benchmark required value: Not found (REMOVE in v5.0.0, Ticket #25550)
- Change detected: MISSING
- Details: Remediation writes EnableSecuritySignature=1; v5.0.0 removed this recommendation; classified MISSING.

### Check 26037
- Remediation title: Ensure 'Microsoft network server: Disconnect clients when logon hours expire' is set to 'Enabled'.
- Remediation script action/value: `New-ItemProperty ... -Name 'EnableForcedLogOff' -Value 1 ...`
- v5.0.0 benchmark required value: Enabled (Automated, L1)
- Change detected: NO_CHANGE
- Details: Remediation sets EnableForcedLogOff=1; maps to Enabled; compliant.

### Check 26038
- Remediation title: Ensure 'Microsoft network server: Server SPN target name validation level' is set to 'Accept if provided by client' or higher.
- Remediation script action/value: `New-ItemProperty ... -Name 'SMBServerNameHardeningLevel' -Value 1 ...`
- v5.0.0 benchmark required value: Accept if provided by client or higher (SMBServerNameHardeningLevel = 1 or 2)
- Change detected: NO_CHANGE
- Details: Remediation sets SMBServerNameHardeningLevel=1; corresponds to 'Accept if provided by client'; compliant.

### Check 26039
- Remediation title: Ensure 'Network access: Do not allow anonymous enumeration of SAM accounts' is set to 'Enabled'.
- Remediation script action/value: `New-ItemProperty ... -Name 'RestrictAnonymousSAM' -Value 1 ...`
- v5.0.0 benchmark required value: Enabled (REG_DWORD 1)
- Change detected: NO_CHANGE
- Details: Remediation sets RestrictAnonymousSAM=1; compliant.

### Check 26040
- Remediation title: Ensure 'Network access: Do not allow anonymous enumeration of SAM accounts and shares' is set to 'Enabled'.
- Remediation script action/value: `New-ItemProperty ... -Name 'RestrictAnonymous' -Value 1 ...`
- v5.0.0 benchmark required value: Enabled (REG_DWORD 1)
- Change detected: NO_CHANGE
- Details: Remediation sets RestrictAnonymous=1; compliant.

### Check 26041
- Remediation title: Ensure 'Network access: Do not allow storage of passwords and credentials for network authentication' is set to 'Enabled'.
- Remediation script action/value: `New-ItemProperty ... -Name 'DisableDomainCreds' -Value 1 ...`
- v5.0.0 benchmark required value: Enabled (REG_DWORD 1)
- Change detected: NO_CHANGE
- Details: Remediation sets DisableDomainCreds=1; compliant.

### Check 26042
- Remediation title: Ensure 'Network access: Let Everyone permissions apply to anonymous users' is set to 'Disabled'.
- Remediation script action/value: `New-ItemProperty ... -Name 'EveryoneIncludesAnonymous' -Value 0 ...`
- v5.0.0 benchmark required value: Disabled (REG_DWORD 0)
- Change detected: NO_CHANGE
- Details: Remediation sets EveryoneIncludesAnonymous=0; compliant.

### Check 26043
- Remediation title: Ensure 'Network access: Named Pipes that can be accessed anonymously' is set to 'None'.
- Remediation script action/value: `New-ItemProperty ... -Name 'NullSessionPipes' -Value '' ...`
- v5.0.0 benchmark required value: None (blank REG_MULTI_SZ)
- Change detected: NO_CHANGE
- Details: Remediation sets NullSessionPipes=''; compliant.

### Check 26044
- Remediation title: Ensure 'Network access: Remotely accessible registry paths' is configured.
- Remediation script action/value: `New-ItemProperty ... -Name 'Machine' -Value 'System\CurrentControlSet\Control\ProductOptions ...' ...`
- v5.0.0 benchmark required value: REG_MULTI_SZ list of paths (AllowedExactPaths Machine)
- Change detected: VALUE_CHANGED
- Details: Remediation sets AllowedExactPaths Machine as a single-line string; v5.0.0 requires REG_MULTI_SZ line-feed-delimited list; remediation change required.

### Check 26045
- Remediation title: Ensure 'Network access: Remotely accessible registry paths and sub-paths' is configured.
- Remediation script action/value: `New-ItemProperty ... -Name 'Machine' -Value 'Software\Microsoft\OLAP Server ...' ...`
- v5.0.0 benchmark required value: REG_MULTI_SZ list of paths (AllowedPaths Machine)
- Change detected: VALUE_CHANGED
- Details: Remediation sets AllowedPaths Machine not matching required REG_MULTI_SZ list; remediation change required.

### Check 26046
- Remediation title: Ensure 'Network access: Restrict anonymous access to Named Pipes and Shares' is set to 'Enabled'.
- Remediation script action/value: `New-ItemProperty ... -Name 'RestrictNullSessAccess' -Value 1 ...`
- v5.0.0 benchmark required value: Enabled (REG_DWORD 1)
- Change detected: NO_CHANGE
- Details: Remediation sets RestrictNullSessAccess=1; compliant.

### Check 26047
- Remediation title: Ensure 'Network access: Restrict clients allowed to make remote calls to SAM' is set to 'Administrators: Remote Access: Allow'.
- Remediation script action/value: `New-ItemProperty ... -Name 'restrictremotesam' -Value 'O:BAG:BAD:(A;;RC;;;BA)' ...`
- v5.0.0 benchmark required value: REG_SZ `O:BAG:BAD:(A;;RC;;;BA)` (Administrators: Remote Access: Allow)
- Change detected: NO_CHANGE
- Details: Remediation sets restrictremotesam; v5.0.0 requires same REG_SZ; compliant.

### Check 26048
- Remediation title: Ensure 'Network access: Shares that can be accessed anonymously' is set to 'None'.
- Remediation script action/value: `New-ItemProperty ... -Name 'NullSessionShares' -Value '' ...`
- v5.0.0 benchmark required value: None (blank REG_MULTI_SZ)
- Change detected: NO_CHANGE
- Details: Remediation sets NullSessionShares=''; compliant.

### Check 26049
- Remediation title: Ensure 'Network access: Sharing and security model for local accounts' is set to 'Classic - local users authenticate as themselves'.
- Remediation script action/value: `New-ItemProperty ... -Name 'ForceGuest' -Value 0 ...`
- v5.0.0 benchmark required value: Classic (REG_DWORD 0)
- Change detected: NO_CHANGE
- Details: Remediation sets ForceGuest=0; compliant.

### Check 26050
- Remediation title: Ensure 'Network security: Allow Local System to use computer identity for NTLM' is set to 'Enabled'.
- Remediation script action/value: `New-ItemProperty ... -Name 'UseMachineId' -Value 1 ...`
- v5.0.0 benchmark required value: Enabled (REG_DWORD 1)
- Change detected: NO_CHANGE
- Details: Remediation sets UseMachineId=1; compliant.

## Checks 26051–26075 (this batch)

### Check 26051
- Remediation title: Ensure 'Network security: Allow LocalSystem NULL session fallback' is set to 'Disabled'.
- Remediation script action/value: Creates `HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0` if absent; sets `allownullsessionfallback` = 0 (DWORD) via `New-ItemProperty`.
- v5.0.0 benchmark required value: Disabled; audit registry `HKLM\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0:AllowNullSessionFallback` REG_DWORD value of 0.
- Change detected: NO_CHANGE
- Details: Remediation sets `allownullsessionfallback=0`, which corresponds to the v5.0.0 required value Disabled (registry REG_DWORD 0). Remediation script value is compliant; no change required.

### Check 26052
- Remediation title: Ensure 'Network Security: Allow PKU2U authentication requests to this computer to use online identities' is set to 'Disabled'.
- Remediation script action/value: Creates `HKLM:\System\CurrentControlSet\Control\Lsa\pku2u` if absent; sets `AllowOnlineID` = 0 (DWORD) via `New-ItemProperty`.
- v5.0.0 benchmark required value: Disabled; audit registry `HKLM\SYSTEM\CurrentControlSet\Control\Lsa\pku2u:AllowOnlineID` REG_DWORD value of 0.
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowOnlineID=0`, which corresponds to the v5.0.0 required value Disabled (registry REG_DWORD 0). Remediation script value is compliant; no change required.

### Check 26053
- Remediation title: Ensure 'Network security: Configure encryption types allowed for Kerberos' is set to 'AES128_HMAC_SHA1, AES256_HMAC_SHA1, Future encryption types'.
- Remediation script action/value: Creates `HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters` if absent; sets `SupportedEncryptionTypes` = 2147483644 (DWORD) via `New-ItemProperty`.
- v5.0.0 benchmark required value: 'AES128_HMAC_SHA1, AES256_HMAC_SHA1, Future encryption types'; audit registry `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters:SupportedEncryptionTypes` REG_DWORD value of 2147483640.
- Change detected: VALUE_CHANGED
- Details: Remediation script sets `SupportedEncryptionTypes` to 2147483644, but the v5.0.0 benchmark requires the audit value of 2147483640 (the remediation/check script `CIS_MSWin11.ps1` also sets 2147483640). Remediation script value does not match the v5.0.0 required value; remediation change required.

### Check 26054
- Remediation title: Ensure 'Network security: Do not store LAN Manager hash value on next password change' is set to 'Enabled'.
- Remediation script action/value: Creates `HKLM:\System\CurrentControlSet\Control\Lsa` if absent; sets `NoLMHash` = 1 (DWORD) via `New-ItemProperty`.
- v5.0.0 benchmark required value: Enabled; audit registry `HKLM\SYSTEM\CurrentControlSet\Control\Lsa -> NoLMHash -> 1`.
- Change detected: NO_CHANGE
- Details: Remediation sets `NoLMHash=1`; compliant.

### Check 26055
- Remediation title: Ensure 'Network security: Force logoff when logon hours expire' is set to 'Enabled'.
- Remediation script action/value: Creates `HKLM:\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters` if absent; sets `EnableForcedLogOff` = 1 (DWORD) via `New-ItemProperty`.
- v5.0.0 benchmark required value: Enabled; audit registry `HKLM\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters -> EnableForcedLogOff -> 1`.
- Change detected: NO_CHANGE
- Details: Remediation sets `EnableForcedLogOff=1`; compliant.

### Check 26056
- Remediation title: Ensure 'Network security: LAN Manager authentication level' is set to 'Send NTLMv2 response only. Refuse LM & NTLM'.
- Remediation script action/value: Creates `HKLM:\System\CurrentControlSet\Control\Lsa` if absent; sets `LmCompatibilityLevel` = 5 (DWORD) via `New-ItemProperty`.
- v5.0.0 benchmark required value: 'Send NTLMv2 response only. Refuse LM & NTLM'; audit registry `HKLM\SYSTEM\CurrentControlSet\Control\Lsa -> LmCompatibilityLevel -> 5`.
- Change detected: NO_CHANGE
- Details: Remediation sets `LmCompatibilityLevel=5`; compliant.

### Check 26057
- Remediation title: Ensure 'Network security: LDAP client signing requirements' is set to 'Negotiate signing' or higher.
- Remediation script action/value: Creates `HKLM:\System\CurrentControlSet\Services\LDAP` if absent; sets `LDAPClientIntegrity` = 1 (DWORD) via `New-ItemProperty`.
- v5.0.0 benchmark required value: 'Negotiate signing' or higher; audit registry `HKLM\SYSTEM\CurrentControlSet\Services\LDAP -> LDAPClientIntegrity -> n:(\d+) compare >= 1`.
- Change detected: NO_CHANGE
- Details: Remediation sets `LDAPClientIntegrity=1`; satisfies 'Negotiate signing' or higher; compliant.

### Check 26058
- Remediation title: Ensure 'Network security: Minimum session security for NTLM SSP based (including secure RPC) clients' is set to 'Require NTLMv2 session security, Require 128-bit encryption'.
- Remediation script action/value: Creates `HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0` if absent; sets `NTLMMinClientSec` = 537395200 (DWORD) via `New-ItemProperty`.
- v5.0.0 benchmark required value: 'Require NTLMv2 session security, Require 128-bit encryption'; audit registry `HKLM\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0 -> NTLMMinClientSec -> 537395200`.
- Change detected: NO_CHANGE
- Details: Remediation sets `NTLMMinClientSec=537395200`; matches required value; compliant.

### Check 26059
- Remediation title: Ensure 'Network security: Minimum session security for NTLM SSP based (including secure RPC) servers' is set to 'Require NTLMv2 session security, Require 128-bit encryption'.
- Remediation script action/value: Creates `HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0` if absent; sets `NTLMMinServerSec` = 537395200 (DWORD) via `New-ItemProperty`.
- v5.0.0 benchmark required value: 'Require NTLMv2 session security, Require 128-bit encryption'; audit registry `HKLM\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0 -> NTLMMinServerSec -> 537395200`.
- Change detected: NO_CHANGE
- Details: Remediation sets `NTLMMinServerSec=537395200`; matches required value; compliant.

### Check 26060
- Remediation title: Ensure 'Network security: Restrict NTLM: Audit Incoming NTLM Traffic' is set to 'Enable auditing for all accounts'.
- Remediation script action/value: Creates `HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0` if absent; sets `AuditReceivingNTLMTraffic` = 2 (DWORD) via `New-ItemProperty`.
- v5.0.0 benchmark required value: 'Enable auditing for all accounts'; audit registry `HKLM\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0 -> AuditReceivingNTLMTraffic -> 2`.
- Change detected: NO_CHANGE
- Details: Remediation sets `AuditReceivingNTLMTraffic=2`; satisfies required value; compliant.

### Check 26061
- Remediation title: Ensure 'Network security: Restrict NTLM: Outgoing NTLM traffic to remote servers' is set to 'Audit all' or higher.
- Remediation script action/value: Creates `HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0` if absent; sets `RestrictSendingNTLMTraffic` = 1 (DWORD) via `New-ItemProperty`.
- v5.0.0 benchmark required value: 'Audit all' or higher; audit registry `HKLM\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0 -> RestrictSendingNTLMTraffic -> r:^1$|^2$`.
- Change detected: NO_CHANGE
- Details: Remediation sets `RestrictSendingNTLMTraffic=1`; satisfies 'Audit all' or higher; compliant.

### Check 26062
- Remediation title: Ensure 'System objects: Require case insensitivity for non-Windows subsystems' is set to 'Enabled'.
- Remediation script action/value: Creates `HKLM:\System\CurrentControlSet\Control\Session Manager\Kernel` if absent; sets `ObCaseInsensitive` = 1 (DWORD) via `New-ItemProperty`.
- v5.0.0 benchmark required value: Enabled; audit registry `HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel -> ObCaseInsensitive -> 1`.
- Change detected: NO_CHANGE
- Details: Remediation sets `ObCaseInsensitive=1`; compliant.

### Check 26063
- Remediation title: Ensure 'System objects: Strengthen default permissions of internal system objects (e.g. Symbolic Links)' is set to 'Enabled'.
- Remediation script action/value: Creates `HKLM:\System\CurrentControlSet\Control\Session Manager` if absent; sets `ProtectionMode` = 1 (DWORD) via `New-ItemProperty`.
- v5.0.0 benchmark required value: Enabled; audit registry `HKLM\SYSTEM\CurrentControlSet\Control\Session Manager -> ProtectionMode -> 1`.
- Change detected: NO_CHANGE
- Details: Remediation sets `ProtectionMode=1`; compliant.

### Check 26064
- Remediation title: Ensure 'User Account Control: Admin Approval Mode for the Built-in Administrator account' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'FilterAdministratorToken' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System:FilterAdministratorToken REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets FilterAdministratorToken=1; compliant.

### Check 26065
- Remediation title: Ensure 'User Account Control: Behavior of the elevation prompt for administrators in Admin Approval Mode' is set to 'Prompt for consent on the secure desktop'.
- Remediation script action/value: New-ItemProperty ... -Name 'ConsentPromptBehaviorAdmin' -Value 2 ...
- v5.0.0 benchmark required value: 'Prompt for consent on the secure desktop' or higher; accepted values 1 or 2
- Change detected: NO_CHANGE
- Details: Remediation sets ConsentPromptBehaviorAdmin=2; compliant.

### Check 26066
- Remediation title: Ensure 'User Account Control: Behavior of the elevation prompt for standard users' is set to 'Automatically deny elevation requests'.
- Remediation script action/value: New-ItemProperty ... -Name 'ConsentPromptBehaviorUser' -Value 0 ...
- v5.0.0 benchmark required value: Automatically deny elevation requests — REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets ConsentPromptBehaviorUser=0; compliant.

### Check 26067
- Remediation title: Ensure 'User Account Control: Detect application installations and prompt for elevation' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableInstallerDetection' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets EnableInstallerDetection=1; compliant.

### Check 26068
- Remediation title: Ensure 'User Account Control: Only elevate UIAccess applications that are installed in secure locations' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableSecureUIAPaths' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets EnableSecureUIAPaths=1; compliant.

### Check 26069
- Remediation title: Ensure 'User Account Control: Run all administrators in Admin Approval Mode' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableLUA' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets EnableLUA=1; compliant.

### Check 26070
- Remediation title: Ensure 'User Account Control: Switch to the secure desktop when prompting for elevation' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'PromptOnSecureDesktop' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets PromptOnSecureDesktop=1; compliant.

### Check 26071
- Remediation title: Ensure 'User Account Control: Virtualize file and registry write failures to per-user locations' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableVirtualization' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets EnableVirtualization=1; compliant.

### Check 26072
- Remediation title: Ensure 'Bluetooth Audio Gateway Service (BTAGService)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name BTAGService -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26073
- Remediation title: Ensure 'Bluetooth Support Service (bthserv)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name bthserv -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26074
- Remediation title: Ensure 'Computer Browser (Browser)' is set to 'Disabled' or 'Not Installed'.
- Remediation script action/value: Stop-Service -Name Browser -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled or Not Installed — REG_DWORD = 4 or key absent
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26075
- Remediation title: Ensure 'Downloaded Maps Manager (MapsBroker)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name MapsBroker -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

## Checks 26076–26100 (this batch)

### Check 26076
- Remediation title: Ensure 'Geolocation Service (lfsvc)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name lfsvc -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26077
- Remediation title: Ensure 'IIS Admin Service (IISADMIN)' is set to 'Disabled' or 'Not Installed'.
- Remediation script action/value: Stop-Service -Name IISADMIN -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled or Not Installed — REG_DWORD = 4 or key absent
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26078
- Remediation title: Ensure 'Infrared monitor service (irmon)' is set to 'Disabled' or 'Not Installed'.
- Remediation script action/value: Stop-Service -Name irmon -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled or Not Installed — REG_DWORD = 4 or key absent
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26079
- Remediation title: Ensure 'Link-Layer Topology Discovery Mapper (lltdsvc)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name lltdsvc -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26080
- Remediation title: Ensure 'LxssManager (LxssManager)' is set to 'Disabled' or 'Not Installed'.
- Remediation script action/value: Stop-Service -Name LxssManager -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled or Not Installed — REG_DWORD = 4 or key absent
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26081
- Remediation title: Ensure 'Microsoft FTP Service (FTPSVC)' is set to 'Disabled' or 'Not Installed'.
- Remediation script action/value: Stop-Service -Name FTPSVC -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled or Not Installed — REG_DWORD = 4 or key absent
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26082
- Remediation title: Ensure 'Microsoft iSCSI Initiator Service (MSiSCSI)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name MSiSCSI -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26083
- Remediation title: Ensure 'OpenSSH SSH Server (sshd)' is set to 'Disabled' or 'Not Installed'.
- Remediation script action/value: Stop-Service -Name sshd -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled or Not Installed — REG_DWORD = 4 or key absent
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26084
- Remediation title: Ensure 'Peer Name Resolution Protocol (PNRPsvc)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name PNRPsvc -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26085
- Remediation title: Ensure 'Peer Networking Grouping (p2psvc)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name p2psvc -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26086
- Remediation title: Ensure 'Peer Networking Identity Manager (p2pimsvc)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name p2pimsvc -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26087
- Remediation title: Ensure 'PNRP Machine Name Publication Service (PNRPAutoReg)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name PNRPAutoReg -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26088
- Remediation title: Ensure 'Print Spooler (Spooler)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name Spooler -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26089
- Remediation title: Ensure 'Problem Reports and Solutions Control Panel Support (wercplsupport)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name wercplsupport -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26090
- Remediation title: Ensure 'Remote Access Auto Connection Manager (RasAuto)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name RasAuto -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26091
- Remediation title: Ensure 'Remote Desktop Configuration (SessionEnv)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name SessionEnv -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26092
- Remediation title: Ensure 'Remote Desktop Services (TermService)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name TermService -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26093
- Remediation title: Ensure 'Remote Desktop Services UserMode Port Redirector (UmRdmService)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name UmRdmService -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26094
- Remediation title: Ensure 'Remote Procedure Call (RPC) Locator (RpcLocator)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name RpcLocator -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26095
- Remediation title: Ensure 'Remote Registry (RemoteRegistry)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name RemoteRegistry -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26096
- Remediation title: Ensure 'Routing and Remote Access (RemoteAccess)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name RemoteAccess -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26097
- Remediation title: Ensure 'Server (LanmanServer)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name LanmanServer -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26098
- Remediation title: Ensure 'Simple TCP/IP Services (simptcp)' is set to 'Disabled' or 'Not Installed'.
- Remediation script action/value: Stop-Service -Name simptcp -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled or Not Installed — REG_DWORD = 4 or key absent
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26099
- Remediation title: Ensure 'SNMP Service (SNMP)' is set to 'Disabled' or 'Not Installed'.
- Remediation script action/value: Stop-Service -Name SNMP -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled or Not Installed — REG_DWORD = 4 or key absent
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26100
- Remediation title: Ensure 'Special Administration Console Helper (sacsvr)' is set to 'Disabled' or 'Not Installed'.
- Remediation script action/value: Stop-Service -Name sacsvr -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled or Not Installed — REG_DWORD = 4 or key absent
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

## Checks 26101–26130 (this batch)

### Check 26101
- Remediation title: Ensure 'SSDP Discovery (SSDPSRV)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name SSDPSRV -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26102
- Remediation title: Ensure 'UPnP Device Host (upnphost)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name upnphost -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26103
- Remediation title: Ensure 'Web Management Service (WMSvc)' is set to 'Disabled' or 'Not Installed'.
- Remediation script action/value: Stop-Service -Name WMSvc -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled or Not Installed — REG_DWORD = 4 or key absent
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26104
- Remediation title: Ensure 'Windows Error Reporting Service (WerSvc)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name WerSvc -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26105
- Remediation title: Ensure 'Windows Event Collector (Wecsvc)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name Wecsvc -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26106
- Remediation title: Ensure 'Windows Media Player Network Sharing Service (WMPNetworkSvc)' is set to 'Disabled' or 'Not Installed'.
- Remediation script action/value: Stop-Service -Name WMPNetworkSvc -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled or Not Installed — REG_DWORD = 4 or key absent
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26107
- Remediation title: Ensure 'Windows Mobile Hotspot Service (icssvc)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name icssvc -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26108
- Remediation title: Ensure 'Windows Push Notifications System Service (WpnService)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name WpnService -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26109
- Remediation title: Ensure 'Windows PushToInstall Service (PushToInstall)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name PushToInstall -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26110
- Remediation title: Ensure 'Windows Remote Management (WS- Management) (WinRM)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name WinRM -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26111
- Remediation title: Ensure 'World Wide Web Publishing Service (W3SVC)' is set to 'Disabled' or 'Not Installed'.
- Remediation script action/value: Stop-Service -Name W3SVC -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled or Not Installed — REG_DWORD = 4 or key absent
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26112
- Remediation title: Ensure 'Xbox Accessory Management Service (XboxGipSvc)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name XboxGipSvc -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26113
- Remediation title: Ensure 'Xbox Live Auth Manager (XblAuthManager)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name XblAuthManager -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26114
- Remediation title: Ensure 'Xbox Live Game Save (XblGameSave)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name XblGameSave -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26115
- Remediation title: Ensure 'Xbox Live Networking Service (XboxNetApiSvc)' is set to 'Disabled'.
- Remediation script action/value: Stop-Service -Name XboxNetApiSvc -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26116
- Remediation title: Ensure 'Windows Firewall: Domain: Firewall state' is set to 'On (recommended)'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableFirewall' -Value 1 ...
- v5.0.0 benchmark required value: On (recommended) — HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile:EnableFirewall REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets EnableFirewall=1; compliant.

### Check 26117
- Remediation title: Ensure 'Windows Firewall: Domain: Inbound connections' is set to 'Block (default)'.
- Remediation script action/value: New-ItemProperty ... -Name 'DefaultInboundAction' -Value 1 ...
- v5.0.0 benchmark required value: Block (default) — HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile:DefaultInboundAction REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets DefaultInboundAction=1; compliant.

### Check 26118
- Remediation title: Ensure 'Windows Firewall: Domain: Settings: Display a notification' is set to 'No'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableNotifications' -Value 1 ...
- v5.0.0 benchmark required value: No — HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile:DisableNotifications REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets DisableNotifications=1; compliant.

### Check 26119
- Remediation title: Ensure 'Windows Firewall: Domain: Logging: Name' is set to '%SystemRoot%\System32\logfiles\firewall\domainfw.log'.
- Remediation script action/value: New-ItemProperty ... -Name 'LogFilePath' -Value '%SystemRoot%\System32\logfiles\firewall\domainfw.log' ...
- v5.0.0 benchmark required value: Log file path configured (domainfw.log) — HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging:LogFilePath REG_SZ
- Change detected: NO_CHANGE
- Details: Remediation sets LogFilePath; compliant.

### Check 26120
- Remediation title: Ensure 'Windows Firewall: Domain: Logging: Size limit (KB)' is set to '16,384 KB or greater'.
- Remediation script action/value: New-ItemProperty ... -Name 'LogFileSize' -Value 16384 ...
- v5.0.0 benchmark required value: 16,384 KB or greater — HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging:LogFileSize REG_DWORD = 16384
- Change detected: NO_CHANGE
- Details: Remediation sets LogFileSize=16384; compliant.

### Check 26121
- Remediation title: Ensure 'Windows Firewall: Domain: Logging: Log dropped packets' is set to 'Yes'.
- Remediation script action/value: New-ItemProperty ... -Name 'LogDroppedPackets' -Value 1 ...
- v5.0.0 benchmark required value: Yes — HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging:LogDroppedPackets REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets LogDroppedPackets=1; compliant.

### Check 26122
- Remediation title: Ensure 'Windows Firewall: Domain: Logging: Log successful connections' is set to 'Yes'.
- Remediation script action/value: New-ItemProperty ... -Name 'LogSuccessfulConnections' -Value 1 ...
- v5.0.0 benchmark required value: Yes — HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging:LogSuccessfulConnections REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets LogSuccessfulConnections=1; compliant.

### Check 26123
- Remediation title: Ensure 'Windows Firewall: Private: Firewall state' is set to 'On (recommended)'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableFirewall' -Value 1 ...
- v5.0.0 benchmark required value: On (recommended) — HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile:EnableFirewall REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets EnableFirewall=1; compliant.

### Check 26124
- Remediation title: Ensure 'Windows Firewall: Private: Inbound connections' is set to 'Block (default)'.
- Remediation script action/value: New-ItemProperty ... -Name 'DefaultInboundAction' -Value 1 ...
- v5.0.0 benchmark required value: Block (default) — HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile:DefaultInboundAction REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets DefaultInboundAction=1; compliant.

### Check 26125
- Remediation title: Ensure 'Windows Firewall: Private: Settings: Display a notification' is set to 'No'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableNotifications' -Value 1 ...
- v5.0.0 benchmark required value: No — HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile:DisableNotifications REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets DisableNotifications=1; compliant.

### Check 26126
- Remediation title: Ensure 'Windows Firewall: Private: Logging: Name' is set to '%SystemRoot%\System32\logfiles\firewall\privatefw.log'.
- Remediation script action/value: New-ItemProperty ... -Name 'LogFilePath' -Value '%SystemRoot%\System32\logfiles\firewall\privatefw.log' ...
- v5.0.0 benchmark required value: Log file path configured (privatefw.log) — HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging:LogFilePath REG_SZ
- Change detected: NO_CHANGE
- Details: Remediation sets LogFilePath; compliant.

### Check 26127
- Remediation title: Ensure 'Windows Firewall: Private: Logging: Size limit (KB)' is set to '16,384 KB or greater'.
- Remediation script action/value: New-ItemProperty ... -Name 'LogFileSize' -Value 16384 ...
- v5.0.0 benchmark required value: 16,384 KB or greater — HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging:LogFileSize REG_DWORD = 16384
- Change detected: NO_CHANGE
- Details: Remediation sets LogFileSize=16384; compliant.

### Check 26128
- Remediation title: Ensure 'Windows Firewall: Private: Logging: Log dropped packets' is set to 'Yes'.
- Remediation script action/value: New-ItemProperty ... -Name 'LogDroppedPackets' -Value 1 ...
- v5.0.0 benchmark required value: Yes — HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging:LogDroppedPackets REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets LogDroppedPackets=1; compliant.

### Check 26129
- Remediation title: Ensure 'Windows Firewall: Private: Logging: Log successful connections' is set to 'Yes'.
- Remediation script action/value: New-ItemProperty ... -Name 'LogSuccessfulConnections' -Value 1 ...
- v5.0.0 benchmark required value: Yes — HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging:LogSuccessfulConnections REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets LogSuccessfulConnections=1; compliant.

### Check 26130
- Remediation title: Ensure 'Windows Firewall: Public: Firewall state' is set to 'On (recommended)'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableFirewall' -Value 1 ...
- v5.0.0 benchmark required value: On (recommended) — HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile:EnableFirewall REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets EnableFirewall=1; compliant.

## Checks 26131–26175 (this batch)

### Check 26131
- Remediation title: Ensure 'Windows Firewall: Public: Inbound connections' is set to 'Block (default)'.
- Remediation script action/value: New-ItemProperty ... -Name 'DefaultInboundAction' -Value 1 ...
- v5.0.0 benchmark required value: Block (default) — HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile:DefaultInboundAction REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets DefaultInboundAction=1; compliant.

### Check 26132
- Remediation title: Ensure 'Windows Firewall: Public: Settings: Display a notification' is set to 'No'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableNotifications' -Value 1 ...
- v5.0.0 benchmark required value: No — HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile:DisableNotifications REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets DisableNotifications=1; compliant.

### Check 26133
- Remediation title: Ensure 'Windows Firewall: Public: Settings: Apply local firewall rules' is set to 'No'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowLocalPolicyMerge' -Value 0 ...
- v5.0.0 benchmark required value: No — HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile:AllowLocalPolicyMerge REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets AllowLocalPolicyMerge=0; compliant.

### Check 26134
- Remediation title: Ensure 'Windows Firewall: Public: Settings: Apply local connection security rules' is set to 'No'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowLocalIPsecPolicyMerge' -Value 0 ...
- v5.0.0 benchmark required value: No — HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile:AllowLocalIPsecPolicyMerge REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets AllowLocalIPsecPolicyMerge=0; compliant.

### Check 26135
- Remediation title: Ensure 'Windows Firewall: Public: Logging: Name' is set to '%SystemRoot%\System32\logfiles\firewall\publicfw.log'.
- Remediation script action/value: New-ItemProperty ... -Name 'LogFilePath' -Value '%SystemRoot%\System32\logfiles\firewall\publicfw.log' ...
- v5.0.0 benchmark required value: Log file path configured (publicfw.log) — HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging:LogFilePath REG_SZ
- Change detected: NO_CHANGE
- Details: Remediation sets LogFilePath; compliant.

### Check 26136
- Remediation title: Ensure 'Windows Firewall: Public: Logging: Size limit (KB)' is set to '16,384 KB or greater'.
- Remediation script action/value: New-ItemProperty ... -Name 'LogFileSize' -Value 16384 ...
- v5.0.0 benchmark required value: 16,384 KB or greater — HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging:LogFileSize REG_DWORD = 16384
- Change detected: NO_CHANGE
- Details: Remediation sets LogFileSize=16384; compliant.

### Check 26137
- Remediation title: Ensure 'Windows Firewall: Public: Logging: Log dropped packets' is set to 'Yes'.
- Remediation script action/value: New-ItemProperty ... -Name 'LogDroppedPackets' -Value 1 ...
- v5.0.0 benchmark required value: Yes — HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging:LogDroppedPackets REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets LogDroppedPackets=1; compliant.

### Check 26138
- Remediation title: Ensure 'Windows Firewall: Public: Logging: Log successful connections' is set to 'Yes'.
- Remediation script action/value: New-ItemProperty ... -Name 'LogSuccessfulConnections' -Value 1 ...
- v5.0.0 benchmark required value: Yes — HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging:LogSuccessfulConnections REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets LogSuccessfulConnections=1; compliant.

### Check 26139
- Remediation title: Ensure 'Audit Credential Validation' is set to 'Success and Failure'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"Credential Validation" /success:enable /failure:enable
- v5.0.0 benchmark required value: Success and Failure
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for Credential Validation; compliant.

### Check 26140
- Remediation title: Ensure 'Audit Application Group Management' is set to 'Success and Failure'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"Application Group Management" /success:enable /failure:enable
- v5.0.0 benchmark required value: Success and Failure
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for Application Group Management; compliant.

### Check 26141
- Remediation title: Ensure 'Audit Security Group Management' is set to include 'Success'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"Security Group Management" /success:enable /failure:disable
- v5.0.0 benchmark required value: include Success
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for Security Group Management; compliant.

### Check 26142
- Remediation title: Ensure 'Audit User Account Management' is set to 'Success and Failure'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"User Account Management" /success:enable /failure:enable
- v5.0.0 benchmark required value: Success and Failure
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for User Account Management; compliant.

### Check 26143
- Remediation title: Ensure 'Audit PNP Activity' is set to include 'Success'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"Plug and Play Events" /success:enable /failure:disable
- v5.0.0 benchmark required value: include Success
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for PNP Activity; compliant.

### Check 26144
- Remediation title: Ensure 'Audit Process Creation' is set to include 'Success'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"Process Creation" /success:enable /failure:disable
- v5.0.0 benchmark required value: include Success
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for Process Creation; compliant.

### Check 26145
- Remediation title: Ensure 'Audit Account Lockout' is set to include 'Failure'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"Account Lockout" /success:disable /failure:enable
- v5.0.0 benchmark required value: include Failure
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for Account Lockout; compliant.

### Check 26146
- Remediation title: Ensure 'Audit Group Membership' is set to include 'Success'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"Group Membership" /success:enable /failure:disable
- v5.0.0 benchmark required value: include Success
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for Group Membership; compliant.

### Check 26147
- Remediation title: Ensure 'Audit Logoff' is set to include 'Success'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"Logoff" /success:enable /failure:disable
- v5.0.0 benchmark required value: include Success
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for Logoff; compliant.

### Check 26148
- Remediation title: Ensure 'Audit Logon' is set to 'Success and Failure'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"Logon" /success:enable /failure:enable
- v5.0.0 benchmark required value: Success and Failure
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for Logon; compliant.

### Check 26149
- Remediation title: Ensure 'Audit Other Logon/Logoff Events' is set to 'Success and Failure'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"Other Logon/Logoff Events" /success:enable /failure:enable
- v5.0.0 benchmark required value: Success and Failure
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for Other Logon/Logoff Events; compliant.

### Check 26150
- Remediation title: Ensure 'Audit Special Logon' is set to include 'Success'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"Special Logon" /success:enable /failure:disable
- v5.0.0 benchmark required value: include Success
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for Special Logon; compliant.

### Check 26151
- Remediation title: Ensure 'Audit Detailed File Share' is set to include 'Failure'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"Detailed File Share" /success:disable /failure:enable
- v5.0.0 benchmark required value: include Failure
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for Detailed File Share; compliant.

### Check 26152
- Remediation title: Ensure 'Audit File Share' is set to 'Success and Failure'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"File Share" /success:enable /failure:enable
- v5.0.0 benchmark required value: Success and Failure
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for File Share; compliant.

### Check 26153
- Remediation title: Ensure 'Audit Other Object Access Events' is set to 'Success and Failure'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"Other Object Access Events" /success:enable /failure:enable
- v5.0.0 benchmark required value: Success and Failure
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for Other Object Access Events; compliant.

### Check 26154
- Remediation title: Ensure 'Audit Removable Storage' is set to 'Success and Failure'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"Removable Storage" /success:enable /failure:enable
- v5.0.0 benchmark required value: Success and Failure
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for Removable Storage; compliant.

### Check 26155
- Remediation title: Ensure 'Audit Audit Policy Change' is set to include 'Success'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"Audit Policy Change" /success:enable /failure:disable
- v5.0.0 benchmark required value: include Success
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for Audit Policy Change; compliant.

### Check 26156
- Remediation title: Ensure 'Audit Authentication Policy Change' is set to include 'Success'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"Authentication Policy Change" /success:enable /failure:disable
- v5.0.0 benchmark required value: include Success
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for Authentication Policy Change; compliant.

### Check 26157
- Remediation title: Ensure 'Audit Authorization Policy Change' is set to include 'Success'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"Authorization Policy Change" /success:enable /failure:disable
- v5.0.0 benchmark required value: include Success
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for Authorization Policy Change; compliant.

### Check 26158
- Remediation title: Ensure 'Audit MPSSVC Rule-Level Policy Change' is set to 'Success and Failure'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"MPSSVC Rule-Level Policy Change" /success:enable /failure:enable
- v5.0.0 benchmark required value: Success and Failure
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for MPSSVC Rule-Level Policy Change; compliant.

### Check 26159
- Remediation title: Ensure 'Audit Other Policy Change Events' is set to include 'Failure'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"Other Policy Change Events" /success:disable /failure:enable
- v5.0.0 benchmark required value: include Failure
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for Other Policy Change Events; compliant.

### Check 26160
- Remediation title: Ensure 'Audit Sensitive Privilege Use' is set to 'Success and Failure'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"Sensitive Privilege Use" /success:enable /failure:enable
- v5.0.0 benchmark required value: Success and Failure
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for Sensitive Privilege Use; compliant.

### Check 26161
- Remediation title: Ensure 'Audit IPsec Driver' is set to 'Success and Failure'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"IPsec Driver" /success:enable /failure:enable
- v5.0.0 benchmark required value: Success and Failure
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for IPsec Driver; compliant.

### Check 26162
- Remediation title: Ensure 'Audit Other System Events' is set to 'Success and Failure'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"Other System Events" /success:enable /failure:enable
- v5.0.0 benchmark required value: Success and Failure
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for Other System Events; compliant.

### Check 26163
- Remediation title: Ensure 'Audit Security State Change' is set to include 'Success'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"Security State Change" /success:enable /failure:disable
- v5.0.0 benchmark required value: include Success
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for Security State Change; compliant.

### Check 26164
- Remediation title: Ensure 'Audit Security System Extension' is set to include 'Success'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"Security System Extension" /success:enable /failure:disable
- v5.0.0 benchmark required value: include Success
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for Security System Extension; compliant.

### Check 26165
- Remediation title: Ensure 'Audit System Integrity' is set to 'Success and Failure'.
- Remediation script action/value: & auditpol.exe /set /subcategory:"System Integrity" /success:enable /failure:enable
- v5.0.0 benchmark required value: Success and Failure
- Change detected: NO_CHANGE
- Details: Remediation sets audit policy for System Integrity; compliant.

### Check 26166
- Remediation title: Ensure 'Prevent enabling lock screen camera' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'NoLockScreenCamera' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization:NoLockScreenCamera REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets NoLockScreenCamera=1; compliant.

### Check 26167
- Remediation title: Ensure 'Prevent enabling lock screen slide show' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'NoLockScreenSlideshow' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization:NoLockScreenSlideshow REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets NoLockScreenSlideshow=1; compliant.

### Check 26168
- Remediation title: Ensure 'Allow users to enable online speech recognition services' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowInputPersonalization' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\InputPersonalization:AllowInputPersonalization REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets AllowInputPersonalization=0; compliant.

### Check 26169
- Remediation title: Ensure 'Allow Online Tips' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowOnlineTips' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer:AllowOnlineTips REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets AllowOnlineTips=0; compliant.

### Check 26170
- Remediation title: Ensure 'Apply UAC restrictions to local accounts on network logons' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'LocalAccountTokenFilterPolicy' -Value 0 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System:LocalAccountTokenFilterPolicy REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets LocalAccountTokenFilterPolicy=0; compliant.

### Check 26171
- Remediation title: Ensure 'Configure RPC packet level privacy setting for incoming connections' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'RpcAuthnLevelPrivacyEnabled' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SYSTEM\CurrentControlSet\Control\Print:RpcAuthnLevelPrivacyEnabled REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets RpcAuthnLevelPrivacyEnabled=1; compliant.

### Check 26172
- Remediation title: Ensure 'Configure SMB v1 client driver' is set to 'Enabled: Disable driver (recommended)'.
- Remediation script action/value: Stop-Service -Name mrxsmb10 -Force -ErrorAction SilentlyContinue; New-ItemProperty ... -Name 'Start' -Value 4 ...
- v5.0.0 benchmark required value: Enabled: Disable driver (recommended) — REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets Start=4; compliant.

### Check 26173
- Remediation title: Ensure 'Configure SMB v1 server' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'SMB1' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets SMB1=0; compliant.

### Check 26174
- Remediation title: Ensure 'Enable Certificate Padding' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableCertPaddingCheck' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Microsoft\Cryptography\Wintrust\Config:EnableCertPaddingCheck REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets EnableCertPaddingCheck=1; compliant.

### Check 26175
- Remediation title: Ensure 'Enable Structured Exception Handling Overwrite Protection (SEHOP)' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableExceptionChainValidation' -Value 0 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel:DisableExceptionChainValidation REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets DisableExceptionChainValidation=0; compliant.

## Next steps

- Continue the cross-reference starting at Check 26176.
- Review the `MISSING` and `VALUE_CHANGED` findings for remediation script updates.

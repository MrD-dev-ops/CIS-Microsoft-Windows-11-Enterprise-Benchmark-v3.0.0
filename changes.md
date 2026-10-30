# Detected Changes — CIS Microsoft Windows 11 Stand-alone: v5.0.0 vs. Remediate.ps1 (v3.0.0)

Cross-reference of the new CIS Microsoft Windows 11 Stand-alone Benchmark v5.0.0 (`/home/mrd/Downloads/Wazuh/cis_win11.txt`) against the older remediation script settings (`/home/mrd/Downloads/Wazuh/Remediate.ps1`, authored for v3.0.0).

Batches completed so far:
- Checks 26000–26025
- Checks 26026–26050 (this batch)
- Checks 26051–26075 (this batch)
- Checks 26076–26100 (this batch)
- Checks 26101–26130 (this batch)
- Checks 26131–26175 (this batch)
- Checks 26176–26225 (this batch)
- Checks 26226–26270 (this batch)
- Checks 26271–26300 (this batch)
- Checks 26301–26350 (this batch)
- Checks 26351–26370 (this batch)
- Checks 26371–26400 (this batch)
- Checks 26401–26481 (this batch)

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

## Checks 26176–26225 (this batch)

### Check 26176
- Remediation title: Ensure 'NetBT NodeType configuration' is set to 'Enabled: P-node (recommended)'.
- Remediation script action/value: New-ItemProperty ... -Name 'NodeType' -Value 2 ...
- v5.0.0 benchmark required value: Enabled: P-node (recommended) — HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters:NodeType REG_DWORD = 2
- Change detected: NO_CHANGE
- Details: Remediation sets NodeType=2; compliant.

### Check 26177
- Remediation title: Ensure 'WDigest Authentication' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'UseLogonCredential' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest:UseLogonCredential REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets UseLogonCredential=0; compliant.

### Check 26178
- Remediation title: Ensure 'MSS: (AutoAdminLogon) Enable Automatic Logon' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AutoAdminLogon' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon:AutoAdminLogon REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets AutoAdminLogon=0; compliant.

### Check 26179
- Remediation title: Ensure 'MSS: (DisableIPSourceRouting IPv6) IP source routing protection level is set to 'Enabled: Highest protection, source routing is completely disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableIPSourceRouting' -Value 2 ...
- v5.0.0 benchmark required value: Enabled: Highest protection, source routing is completely disabled — HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters:DisableIPSourceRouting REG_DWORD = 2
- Change detected: NO_CHANGE
- Details: Remediation sets DisableIPSourceRouting=2; compliant.

### Check 26180
- Remediation title: Ensure 'MSS: (DisableIPSourceRouting) IP source routing protection level ' is set to 'Enabled: Highest protection, source routing is completely disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableIPSourceRouting' -Value 2 ...
- v5.0.0 benchmark required value: Enabled: Highest protection, source routing is completely disabled — HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters:DisableIPSourceRouting REG_DWORD = 2
- Change detected: NO_CHANGE
- Details: Remediation sets DisableIPSourceRouting=2; compliant.

### Check 26181
- Remediation title: Ensure 'MSS: (DisableSavePassword) Prevent the dial-up password from being saved' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableSavePassword' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SYSTEM\CurrentControlSet\Services\RasMan\Parameters:DisableSavePassword REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets DisableSavePassword=1; compliant.

### Check 26182
- Remediation title: Ensure 'MSS: (EnableICMPRedirect) Allow ICMP redirects to override OSPF generated routes' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableICMPRedirect' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters:EnableICMPRedirect REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets EnableICMPRedirect=0; compliant.

### Check 26183
- Remediation title: Ensure 'MSS: (KeepAliveTime) How often keep-alive packets are sent in milliseconds' is set to 'Enabled: 300,000 or 5 minutes'.
- Remediation script action/value: New-ItemProperty ... -Name 'KeepAliveTime' -Value 300000 ...
- v5.0.0 benchmark required value: Enabled: 300,000 or 5 minutes — HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters:KeepAliveTime REG_DWORD = 300000
- Change detected: NO_CHANGE
- Details: Remediation sets KeepAliveTime=300000; compliant.

### Check 26184
- Remediation title: Ensure 'MSS: (NoNameReleaseOnDemand) Allow the computer to ignore NetBIOS name release requests except from WINS servers' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'NoNameReleaseOnDemand' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters:NoNameReleaseOnDemand REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets NoNameReleaseOnDemand=1; compliant.

### Check 26185
- Remediation title: Ensure 'MSS: (PerformRouterDiscovery) Allow IRDP to detect and configure Default Gateway addresses' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'PerformRouterDiscovery' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters:PerformRouterDiscovery REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets PerformRouterDiscovery=0; compliant.

### Check 26186
- Remediation title: Ensure 'MSS: (SafeDllSearchMode) Enable Safe DLL search mode' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'SafeDllSearchMode' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SYSTEM\CurrentControlSet\Control\Session Manager:SafeDllSearchMode REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets SafeDllSearchMode=1; compliant.

### Check 26187
- Remediation title: Ensure 'MSS: (ScreenSaverGracePeriod) The time in seconds before the screen saver grace period expires' is set to 'Enabled: 5 or fewer seconds'.
- Remediation script action/value: New-ItemProperty ... -Name 'ScreenSaverGracePeriod' -Value 5 ...
- v5.0.0 benchmark required value: Enabled: 5 or fewer seconds — HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon:ScreenSaverGracePeriod REG_DWORD = 5
- Change detected: NO_CHANGE
- Details: Remediation sets ScreenSaverGracePeriod=5; compliant.

### Check 26188
- Remediation title: Ensure 'MSS: (TcpMaxDataRetransmissions IPv6) How many times unacknowledged data is retransmitted' is set to 'Enabled: 3'.
- Remediation script action/value: New-ItemProperty ... -Name 'TcpMaxDataRetransmissions' -Value 3 ...
- v5.0.0 benchmark required value: Enabled: 3 — HKLM\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters:TcpMaxDataRetransmissions REG_DWORD = 3
- Change detected: NO_CHANGE
- Details: Remediation sets TcpMaxDataRetransmissions=3; compliant.

### Check 26189
- Remediation title: Ensure 'MSS: (TcpMaxDataRetransmissions) How many times unacknowledged data is retransmitted' is set to 'Enabled: 3'.
- Remediation script action/value: New-ItemProperty ... -Name 'TcpMaxDataRetransmissions' -Value 3 ...
- v5.0.0 benchmark required value: Enabled: 3 — HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters:TcpMaxDataRetransmissions REG_DWORD = 3
- Change detected: NO_CHANGE
- Details: Remediation sets TcpMaxDataRetransmissions=3; compliant.

### Check 26190
- Remediation title: Ensure 'MSS: (WarningLevel) Percentage threshold for the security event log at which the system will generate a warning' is set to 'Enabled: 90% or less'.
- Remediation script action/value: New-ItemProperty ... -Name 'WarningLevel' -Value 90 ...
- v5.0.0 benchmark required value: Enabled: 90% or less — HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Security:WarningLevel REG_DWORD = 90
- Change detected: NO_CHANGE
- Details: Remediation sets WarningLevel=90; compliant.

### Check 26191
- Remediation title: Ensure 'Configure DNS over HTTPS (DoH) name resolution' is set to 'Enabled: Allow DoH' or higher.
- Remediation script action/value: New-ItemProperty ... -Name 'DoHPolicy' -Value 2 ...
- v5.0.0 benchmark required value: Enabled: Allow DoH or higher — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient:DoHPolicy REG_DWORD = 2
- Change detected: NO_CHANGE
- Details: Remediation sets DoHPolicy=2; compliant.

### Check 26192
- Remediation title: Ensure 'Configure NetBIOS settings' is set to 'Enabled: Disable NetBIOS name resolution on public networks'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableNetbios' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: Disable NetBIOS name resolution on public networks — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient:EnableNetbios REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets EnableNetbios=0; compliant.

### Check 26193
- Remediation title: Ensure 'Turn off multicast name resolution' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableMulticast' -Value 0 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient:EnableMulticast REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets EnableMulticast=0; compliant.

### Check 26194
- Remediation title: Ensure 'Enable Font Providers' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableFontProviders' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\System:EnableFontProviders REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets EnableFontProviders=0; compliant.

### Check 26195
- Remediation title: Ensure 'Enable insecure guest logons' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowInsecureGuestAuth' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation:AllowInsecureGuestAuth REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets AllowInsecureGuestAuth=0; compliant.

### Check 26196
- Remediation title: Ensure 'Turn on Mapper I/O (LLTDIO) driver' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableLLTDIO' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\LLTD:EnableLLTDIO REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets EnableLLTDIO=0; compliant.

### Check 26197
- Remediation title: Ensure 'Turn on Responder (RSPNDR) driver' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableRspndr' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\LLTD:EnableRspndr REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets EnableRspndr=0; compliant.

### Check 26198
- Remediation title: Ensure 'Turn off Microsoft Peer-to-Peer Networking Services' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'Disabled' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Peernet:Disabled REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets Disabled=1; compliant.

### Check 26199
- Remediation title: Ensure 'Prohibit installation and configuration of Network Bridge on your DNS domain network' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'NC_AllowNetBridge_NLA' -Value 0 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Network Connections:NC_AllowNetBridge_NLA REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets NC_AllowNetBridge_NLA=0; compliant.

### Check 26200
- Remediation title: Ensure 'Prohibit use of Internet Connection Sharing on your DNS domain network' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'NC_ShowSharedAccessUI' -Value 0 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Network Connections:NC_ShowSharedAccessUI REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets NC_ShowSharedAccessUI=0; compliant.

### Check 26201
- Remediation title: Ensure 'Require domain users to elevate when setting a network's location' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'NC_StdDomainUserSetLocation' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Network Connections:NC_StdDomainUserSetLocation REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets NC_StdDomainUserSetLocation=1; compliant.

### Check 26202
- Remediation title: Ensure 'Hardened UNC Paths' is set to 'Enabled, with "Require Mutual Authentication" and "Require Integrity" set for all NETLOGON and SYSVOL shares'.
- Remediation script action/value: New-ItemProperty ... -Name '\\*\NETLOGON' -Value 'RequireMutualAuthentication=1, RequireIntegrity=1, RequirePrivacy=1' ...
- v5.0.0 benchmark required value: Enabled, with "Require Mutual Authentication" and "Require Integrity" set for all NETLOGON and SYSVOL shares — HKLM\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths:\\*\NETLOGON REG_SZ
- Change detected: NO_CHANGE
- Details: Remediation sets hardened UNC paths; compliant.

### Check 26203
- Remediation title: Disable IPv6 (Ensure TCPIP6 Parameter 'DisabledComponents' is set to '0xff (255)').
- Remediation script action/value: New-ItemProperty ... -Name 'DisabledComponents' -Value 255 ...
- v5.0.0 benchmark required value: Disable IPv6 — HKLM\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters:DisabledComponents REG_DWORD = 255
- Change detected: NO_CHANGE
- Details: Remediation sets DisabledComponents=255; compliant.

### Check 26204
- Remediation title: Ensure 'Configuration of wireless settings using Windows Connect Now' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableRegistrars' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars:EnableRegistrars REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets EnableRegistrars=0; compliant.

### Check 26205
- Remediation title: Ensure 'Prohibit access of the Windows Connect Now wizards' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableWcnUi' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\WCN\UI:DisableWcnUi REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets DisableWcnUi=1; compliant.

### Check 26206
- Remediation title: Ensure 'Minimize the number of simultaneous connections to the Internet or a Windows Domain' is set to 'Enabled: 3 = Prevent Wi-Fi when on Ethernet'.
- Remediation script action/value: New-ItemProperty ... -Name 'fMinimizeConnections' -Value 3 ...
- v5.0.0 benchmark required value: Enabled: 3 = Prevent Wi-Fi when on Ethernet — HKLM\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy:fMinimizeConnections REG_DWORD = 3
- Change detected: NO_CHANGE
- Details: Remediation sets fMinimizeConnections=3; compliant.

### Check 26207
- Remediation title: Ensure 'Prohibit connection to non-domain networks when connected to domain authenticated network' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'fBlockNonDomain' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy:fBlockNonDomain REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets fBlockNonDomain=1; compliant.

### Check 26208
- Remediation title: Ensure 'Allow Windows to automatically connect to suggested open hotspots, to networks shared by contacts, and to hotspots offering paid services' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AutoConnectAllowedOEM' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config:AutoConnectAllowedOEM REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets AutoConnectAllowedOEM=0; compliant.

### Check 26209
- Remediation title: Ensure 'Allow Print Spooler to accept client connections' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'RegisterSpoolerRemoteRpcEndPoint' -Value 2 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers:RegisterSpoolerRemoteRpcEndPoint REG_DWORD = 2
- Change detected: NO_CHANGE
- Details: Remediation sets RegisterSpoolerRemoteRpcEndPoint=2; compliant.

### Check 26210
- Remediation title: Ensure 'Configure Redirection Guard' is set to 'Enabled: Redirection Guard Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'RedirectionguardPolicy' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: Redirection Guard Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers:RedirectionguardPolicy REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets RedirectionguardPolicy=1; compliant.

### Check 26211
- Remediation title: Ensure 'Configure RPC connection settings: Protocol to use for outgoing RPC connections' is set to 'Enabled: RPC over TCP'.
- Remediation script action/value: New-ItemProperty ... -Name 'RpcUseNamedPipeProtocol' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: RPC over TCP — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers\RPC:RpcUseNamedPipeProtocol REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets RpcUseNamedPipeProtocol=0; compliant.

### Check 26212
- Remediation title: Ensure 'Configure RPC connection settings: Use authentication for outgoing RPC connections' is set to 'Enabled: Default'.
- Remediation script action/value: New-ItemProperty ... -Name 'RpcAuthentication' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: Default — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers\RPC:RpcAuthentication REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets RpcAuthentication=0; compliant.

### Check 26213
- Remediation title: Ensure 'Configure RPC listener settings: Protocols to allow for incoming RPC connections' is set to 'Enabled: RPC over TCP'.
- Remediation script action/value: New-ItemProperty ... -Name 'RpcProtocols' -Value 5 ...
- v5.0.0 benchmark required value: Enabled: RPC over TCP — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers\RPC:RpcProtocols REG_DWORD = 5
- Change detected: NO_CHANGE
- Details: Remediation sets RpcProtocols=5; compliant.

### Check 26214
- Remediation title: Ensure 'Configure RPC listener settings: Authentication protocol to use for incoming RPC connections:' is set to 'Enabled: Negotiate' or higher.
- Remediation script action/value: New-ItemProperty ... -Name 'ForceKerberosForRpc' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: Negotiate or higher — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers\RPC:ForceKerberosForRpc REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets ForceKerberosForRpc=0; compliant.

### Check 26215
- Remediation title: Ensure 'Configure RPC over TCP port' is set to 'Enabled: 0'.
- Remediation script action/value: New-ItemProperty ... -Name 'RpcTcpPort' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: 0 — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers\RPC:RpcTcpPort REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets RpcTcpPort=0; compliant.

### Check 26216
- Remediation title: Ensure 'Limits print driver installation to Administrators' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'RestrictDriverInstallationToAdministrators' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint:RestrictDriverInstallationToAdministrators REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets RestrictDriverInstallationToAdministrators=1; compliant.

### Check 26217
- Remediation title: Ensure 'Manage processing of Queue-specific files' is set to 'Enabled: Limit Queue-specific files to Color profiles'.
- Remediation script action/value: New-ItemProperty ... -Name 'CopyFilesPolicy' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: Limit Queue-specific files to Color profiles — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers:CopyFilesPolicy REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets CopyFilesPolicy=1; compliant.

### Check 26218
- Remediation title: Ensure 'Point and Print Restrictions: When installing drivers for a new connection' is set to 'Enabled: Show warning and elevation prompt'.
- Remediation script action/value: New-ItemProperty ... -Name 'NoWarningNoElevationOnInstall' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: Show warning and elevation prompt — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint:NoWarningNoElevationOnInstall REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets NoWarningNoElevationOnInstall=0; compliant.

### Check 26219
- Remediation title: Ensure 'Point and Print Restrictions: When updating drivers for an existing connection' is set to 'Enabled: Show warning and elevation prompt'.
- Remediation script action/value: New-ItemProperty ... -Name 'UpdatePromptSettings' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: Show warning and elevation prompt — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint:UpdatePromptSettings REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets UpdatePromptSettings=0; compliant.

### Check 26220
- Remediation title: Ensure 'Turn off notifications network usage' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'NoCloudApplicationNotification' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications:NoCloudApplicationNotification REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets NoCloudApplicationNotification=1; compliant.

### Check 26221
- Remediation title: Ensure 'Remove Personalized Website Recommendations from the Recommended section in the Start Menu' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'HideRecommendedPersonalizedSites' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer:HideRecommendedPersonalizedSites REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets HideRecommendedPersonalizedSites=1; compliant.

### Check 26222
- Remediation title: Ensure 'Include command line in process creation events' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'ProcessCreationIncludeCmdLine_Enabled' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit:ProcessCreationIncludeCmdLine_Enabled REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets ProcessCreationIncludeCmdLine_Enabled=1; compliant.

### Check 26223
- Remediation title: Ensure 'Encryption Oracle Remediation' is set to 'Enabled: Force Updated Clients'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowEncryptionOracle' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: Force Updated Clients — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\CredSSP\Parameters:AllowEncryptionOracle REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets AllowEncryptionOracle=0; compliant.

### Check 26224
- Remediation title: Ensure 'Remote host allows delegation of non-exportable credentials' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowProtectedCreds' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation:AllowProtectedCreds REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets AllowProtectedCreds=1; compliant.

### Check 26225
- Remediation title: Ensure 'Turn On Virtualization Based Security' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableVirtualizationBasedSecurity' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard:EnableVirtualizationBasedSecurity REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets EnableVirtualizationBasedSecurity=1; compliant.

## Checks 26226–26270 (this batch)

### Check 26226
- Remediation title: Ensure 'Turn On Virtualization Based Security: Select Platform Security Level' is set to 'Secure Boot' or higher.
- Remediation script action/value: New-ItemProperty ... -Name 'RequirePlatformSecurityFeatures' -Value 3 ...
- v5.0.0 benchmark required value: Secure Boot or higher — HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard:RequirePlatformSecurityFeatures REG_DWORD = 3
- Change detected: NO_CHANGE
- Details: Remediation sets RequirePlatformSecurityFeatures=3; compliant.

### Check 26227
- Remediation title: Ensure 'Turn On Virtualization Based Security: Virtualization Based Protection of Code Integrity' is set to 'Enabled with UEFI lock'.
- Remediation script action/value: New-ItemProperty ... -Name 'HypervisorEnforcedCodeIntegrity' -Value 1 ...
- v5.0.0 benchmark required value: Enabled with UEFI lock — HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard:HypervisorEnforcedCodeIntegrity REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets HypervisorEnforcedCodeIntegrity=1; compliant.

### Check 26228
- Remediation title: Ensure 'Turn On Virtualization Based Security: Require UEFI Memory Attributes Table' is set to 'True (checked)'.
- Remediation script action/value: New-ItemProperty ... -Name 'HVCIMATRequired' -Value 1 ...
- v5.0.0 benchmark required value: True (checked) — HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard:HVCIMATRequired REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets HVCIMATRequired=1; compliant.

### Check 26229
- Remediation title: Ensure 'Turn On Virtualization Based Security: Credential Guard Configuration' is set to 'Enabled with UEFI lock'.
- Remediation script action/value: New-ItemProperty ... -Name 'LsaCfgFlags' -Value 1 ...
- v5.0.0 benchmark required value: Enabled with UEFI lock — HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard:LsaCfgFlags REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets LsaCfgFlags=1; compliant.

### Check 26230
- Remediation title: Ensure 'Turn On Virtualization Based Security: Kernel-mode Hardware-enforced Stack Protection' is set to 'Enabled: Enabled in enforcement mode'.
- Remediation script action/value: New-ItemProperty ... -Name 'ConfigureKernelShadowStacksLaunch' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: Enabled in enforcement mode — HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard:ConfigureKernelShadowStacksLaunch REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets ConfigureKernelShadowStacksLaunch=1; compliant.

### Check 26231
- Remediation title: Ensure 'Prevent installation of devices that match any of these device IDs' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DenyDeviceIDs' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall:Restrictions:DenyDeviceIDs REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets DenyDeviceIDs=1; compliant.

### Check 26232
- Remediation title: Ensure 'Prevent installation of devices that match any of these device IDs: Prevent installation of devices that match any of these device IDs' is set to 'PCI\CC_0C0A'.
- Remediation script action/value: New-ItemProperty ... -Name 'DenyDeviceIDs' -Value 'PCI\CC_0C0A' ...
- v5.0.0 benchmark required value: PCI\CC_0C0A — HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall:Restrictions:DenyDeviceIDs REG_SZ = PCI\CC_0C0A
- Change detected: NO_CHANGE
- Details: Remediation sets DenyDeviceIDs='PCI\CC_0C0A'; compliant.

### Check 26233
- Remediation title: Ensure 'Prevent installation of devices that match any of these device IDs: Also apply to matching devices that are already installed.' is set to 'True'.
- Remediation script action/value: New-ItemProperty ... -Name 'DenyDeviceIDsRetroactive' -Value 1 ...
- v5.0.0 benchmark required value: True — HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall:Restrictions:DenyDeviceIDsRetroactive REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets DenyDeviceIDsRetroactive=1; compliant.

### Check 26234
- Remediation title: Ensure 'Prevent installation of devices using drivers that match these device setup classes' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DenyDeviceClasses' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall:Restrictions:DenyDeviceClasses REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets DenyDeviceClasses=1; compliant.

### Check 26235
- Remediation title: Ensure 'Prevent installation of devices using drivers that match these device setup classes: Prevent installation of devices using drivers for these device setup' is set to 'IEEE 1394 device setup classes'.
- Remediation script action/value: New-ItemProperty ... -Name 'DenyDeviceClasses' -Value 1 ...
- v5.0.0 benchmark required value: IEEE 1394 device setup classes — HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall:Restrictions:DenyDeviceClasses REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets DenyDeviceClasses=1; compliant.

### Check 26236
- Remediation title: Ensure 'Prevent installation of devices using drivers that match these device setup classes: Also apply to matching devices that are already installed.' is set to 'True'.
- Remediation script action/value: New-ItemProperty ... -Name 'DenyDeviceClassesRetroactive' -Value 1 ...
- v5.0.0 benchmark required value: True — HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall:Restrictions:DenyDeviceClassesRetroactive REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets DenyDeviceClassesRetroactive=1; compliant.

### Check 26237
- Remediation title: Ensure 'Prevent device metadata retrieval from the Internet' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'PreventDeviceMetadataFromNetwork' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceMetadata:PreventDeviceMetadataFromNetwork REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets PreventDeviceMetadataFromNetwork=1; compliant.

### Check 26238
- Remediation title: Ensure 'Boot-Start Driver Initialization Policy' is set to 'Enabled: Good, unknown and bad but critical'.
- Remediation script action/value: New-ItemProperty ... -Name 'DriverLoadPolicy' -Value 3 ...
- v5.0.0 benchmark required value: Enabled: Good, unknown and bad but critical — HKLM\SYSTEM\CurrentControlSet\Policies\EarlyLaunch:DriverLoadPolicy REG_DWORD = 3
- Change detected: NO_CHANGE
- Details: Remediation sets DriverLoadPolicy=3; compliant.

### Check 26239
- Remediation title: Ensure 'Configure registry policy processing: Do not apply during periodic background processing' is set to 'Enabled: FALSE'.
- Remediation script action/value: New-ItemProperty ... -Name 'NoBackgroundPolicy' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: FALSE — HKLM\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}:NoBackgroundPolicy REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets NoBackgroundPolicy=0; compliant.

### Check 26240
- Remediation title: Ensure 'Configure registry policy processing: Process even if the Group Policy objects have not changed' is set to 'Enabled: TRUE'.
- Remediation script action/value: New-ItemProperty ... -Name 'NoGPOListChanges' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: TRUE — HKLM\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}:NoGPOListChanges REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets NoGPOListChanges=0; compliant.

### Check 26241
- Remediation title: Ensure 'Configure security policy processing: Do not apply during periodic background processing' is set to 'Enabled: FALSE'.
- Remediation script action/value: New-ItemProperty ... -Name 'NoBackgroundPolicy' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: FALSE — HKLM\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{827D319E-6EAC-11D2-A4EA-00C04F79F83A}:NoBackgroundPolicy REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets NoBackgroundPolicy=0; compliant.

### Check 26242
- Remediation title: Ensure 'Configure security policy processing: Process even if the Group Policy objects have not changed' is set to 'Enabled: TRUE'.
- Remediation script action/value: New-ItemProperty ... -Name 'NoGPOListChanges' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: TRUE — HKLM\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{827D319E-6EAC-11D2-A4EA-00C04F79F83A}:NoGPOListChanges REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets NoGPOListChanges=0; compliant.

### Check 26243
- Remediation title: Ensure 'Continue experiences on this device' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableCdp' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\System:EnableCdp REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets EnableCdp=0; compliant.

### Check 26244
- Remediation title: Ensure 'Turn off background refresh of Group Policy' is set to 'Disabled'.
- Remediation script action/value: Remove-ItemProperty ... -Name 'DisableBkGndGroupPolicy' ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System:DisableBkGndGroupPolicy REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation removes DisableBkGndGroupPolicy; compliant.

### Check 26245
- Remediation title: Ensure 'Turn off access to the Store' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'NoUseStoreOpenWith' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer:NoUseStoreOpenWith REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets NoUseStoreOpenWith=1; compliant.

### Check 26246
- Remediation title: Ensure 'Turn off downloading of print drivers over HTTP' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableWebPnPDownload' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers:DisableWebPnPDownload REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets DisableWebPnPDownload=1; compliant.

### Check 26247
- Remediation title: Ensure 'Turn off handwriting personalization data sharing' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'PreventHandwritingDataSharing' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC:PreventHandwritingDataSharing REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets PreventHandwritingDataSharing=1; compliant.

### Check 26248
- Remediation title: Ensure 'Turn off handwriting recognition error reporting' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'PreventHandwritingErrorReports' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports:PreventHandwritingErrorReports REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets PreventHandwritingErrorReports=1; compliant.

### Check 26249
- Remediation title: Ensure 'Turn off Internet Connection Wizard if URL connection is referring to Microsoft.com' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'ExitOnMSICW' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Internet Connection Wizard:ExitOnMSICW REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets ExitOnMSICW=1; compliant.

### Check 26250
- Remediation title: Ensure 'Turn off Internet download for Web publishing and online ordering wizards' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'NoWebServices' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer:NoWebServices REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets NoWebServices=1; compliant.

### Check 26251
- Remediation title: Ensure 'Turn off printing over HTTP' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableHTTPPrinting' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers:DisableHTTPPrinting REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets DisableHTTPPrinting=1; compliant.

### Check 26252
- Remediation title: Ensure 'Turn off Registration if URL connection is referring to Microsoft.com' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'NoRegistration' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Registration Wizard Control:NoRegistration REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets NoRegistration=1; compliant.

### Check 26253
- Remediation title: Ensure 'Turn off Search Companion content file updates' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableContentFileUpdates' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\SearchCompanion:DisableContentFileUpdates REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets DisableContentFileUpdates=1; compliant.

### Check 26254
- Remediation title: Ensure 'Turn off the "Order Prints" picture task' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'NoOnlinePrintsWizard' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer:NoOnlinePrintsWizard REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets NoOnlinePrintsWizard=1; compliant.

### Check 26255
- Remediation title: Ensure 'Turn off the "Publish to Web" task for files and folders' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'NoPublishingWizard' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer:NoPublishingWizard REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets NoPublishingWizard=1; compliant.

### Check 26256
- Remediation title: Ensure 'Turn off the Windows Messenger Customer Experience Improvement Program' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'CEIP' -Value 2 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Messenger\Client:CEIP REG_DWORD = 2
- Change detected: NO_CHANGE
- Details: Remediation sets CEIP=2; compliant.

### Check 26257
- Remediation title: Ensure 'Turn off Windows Customer Experience Improvement Program' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'CEIPEnable' -Value 0 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows:CEIPEnable REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets CEIPEnable=0; compliant.

### Check 26258
- Remediation title: Ensure 'Turn off Windows Error Reporting' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'Disabled' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting:Disabled REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets Disabled=1; compliant.

### Check 26259
- Remediation title: Ensure 'Support device authentication using certificate' is set to 'Enabled: Automatic'.
- Remediation script action/value: New-ItemProperty ... -Name 'DevicePKInitBehavior' -Value 0 ...; New-ItemProperty ... -Name 'DevicePKInitEnabled' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: Automatic — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\kerberos\parameters:DevicePKInitEnabled REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets DevicePKInitEnabled=1; compliant.

### Check 26260
- Remediation title: Ensure 'Enumeration policy for external devices incompatible with Kernel DMA Protection' is set to 'Enabled: Block All'.
- Remediation script action/value: New-ItemProperty ... -Name 'DeviceEnumerationPolicy' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: Block All — HKLM\SOFTWARE\Policies\Microsoft\Windows\Kernel DMA Protection:DeviceEnumerationPolicy REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets DeviceEnumerationPolicy=0; compliant.

### Check 26261
- Remediation title: Ensure 'Configure password backup directory' is set to 'Enabled: Active Directory' or 'Enabled: Azure Active Directory'.
- Remediation script action/value: New-ItemProperty ... -Name 'BackupDirectory' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: Active Directory or Enabled: Azure Active Directory — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS:BackupDirectory REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets BackupDirectory=1; compliant.

### Check 26262
- Remediation title: Ensure 'Do not allow password expiration time longer than required by policy' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'PwdExpirationProtectionEnabled' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS:PwdExpirationProtectionEnabled REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets PwdExpirationProtectionEnabled=1; compliant.

### Check 26263
- Remediation title: Ensure 'Enable password encryption' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'ADPasswordEncryptionEnabled' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS:ADPasswordEncryptionEnabled REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets ADPasswordEncryptionEnabled=1; compliant.

### Check 26264
- Remediation title: Ensure 'Password Settings: Password Complexity' is set to 'Enabled: Large letters + small letters + numbers + special characters'.
- Remediation script action/value: New-ItemProperty ... -Name 'PasswordComplexity' -Value 4 ...
- v5.0.0 benchmark required value: Enabled: Large letters + small letters + numbers + special characters — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS:PasswordComplexity REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets PasswordComplexity=4; compliant.

### Check 26265
- Remediation title: Ensure 'Password Settings: Password Length' is set to 'Enabled: 15 or more'.
- Remediation script action/value: New-ItemProperty ... -Name 'PasswordLength' -Value 15 ...
- v5.0.0 benchmark required value: Enabled: 15 or more — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS:PasswordLength REG_DWORD = 15
- Change detected: NO_CHANGE
- Details: Remediation sets PasswordLength=15; compliant.

### Check 26266
- Remediation title: Ensure 'Password Settings: Password Age (Days)' is set to 'Enabled: 30 or fewer'.
- Remediation script action/value: New-ItemProperty ... -Name 'PasswordAgeDays' -Value 30 ...
- v5.0.0 benchmark required value: Enabled: 30 or fewer — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS:PasswordAgeDays REG_DWORD = 30
- Change detected: NO_CHANGE
- Details: Remediation sets PasswordAgeDays=30; compliant.

### Check 26267
- Remediation title: Ensure 'Post-authentication actions: Grace period (hours)' is set to 'Enabled: 8 or fewer hours, but not 0'.
- Remediation script action/value: New-ItemProperty ... -Name 'PostAuthenticationResetDelay' -Value 8 ...
- v5.0.0 benchmark required value: Enabled: 8 or fewer hours, but not 0 — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS:PostAuthenticationResetDelay REG_DWORD = 8
- Change detected: NO_CHANGE
- Details: Remediation sets PostAuthenticationResetDelay=8; compliant.

### Check 26268
- Remediation title: Ensure 'Post-authentication actions: Actions' is set to 'Enabled: Reset the password and logoff the managed account' or higher.
- Remediation script action/value: New-ItemProperty ... -Name 'PostAuthenticationActions' -Value 3 ...
- v5.0.0 benchmark required value: Enabled: Reset the password and logoff the managed account or higher — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS:PostAuthenticationActions REG_DWORD = 3
- Change detected: NO_CHANGE
- Details: Remediation sets PostAuthenticationActions=3; compliant.

### Check 26269
- Remediation title: Ensure 'Allow Custom SSPs and APs to be loaded into LSASS' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowCustomSSPsAPs' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\System:AllowCustomSSPsAPs REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets AllowCustomSSPsAPs=0; compliant.

### Check 26270
- Remediation title: Ensure 'Configures LSASS to run as a protected process' is set to 'Enabled: Enabled with UEFI Lock'.
- Remediation script action/value: New-ItemProperty ... -Name 'RunAsPPL' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: Enabled with UEFI Lock — HKLM\SYSTEM\CurrentControlSet\Control\Lsa:RunAsPPL REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets RunAsPPL=1; compliant.

## Checks 26271–26300 (this batch)

### Check 26271
- Remediation title: Ensure 'Disallow copying of user input methods to the system account for sign-in' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'BlockUserInputMethodsForSignIn' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Control Panel\International:BlockUserInputMethodsForSignIn REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets BlockUserInputMethodsForSignIn=1; compliant.

### Check 26272
- Remediation title: Ensure 'Block user from showing account details on sign-in' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'BlockUserFromShowingAccountDetailsOnSignin' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\System:BlockUserFromShowingAccountDetailsOnSignin REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets BlockUserFromShowingAccountDetailsOnSignin=1; compliant.

### Check 26273
- Remediation title: Ensure 'Do not display network selection UI' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DontDisplayNetworkSelectionUI' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\System:DontDisplayNetworkSelectionUI REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets DontDisplayNetworkSelectionUI=1; compliant.

### Check 26274
- Remediation title: Ensure 'Do not enumerate connected users on domain-joined computers' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DontEnumerateConnectedUsers' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\System:DontEnumerateConnectedUsers REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets DontEnumerateConnectedUsers=1; compliant.

### Check 26275
- Remediation title: Ensure 'Enumerate local users on domain-joined computers' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnumerateLocalUsers' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\System:EnumerateLocalUsers REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets EnumerateLocalUsers=0; compliant.

### Check 26276
- Remediation title: Ensure 'Turn off app notifications on the lock screen' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableLockScreenAppNotifications' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\System:DisableLockScreenAppNotifications REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets DisableLockScreenAppNotifications=1; compliant.

### Check 26277
- Remediation title: Ensure 'Turn off picture password sign-in' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'BlockDomainPicturePassword' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\System:BlockDomainPicturePassword REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets BlockDomainPicturePassword=1; compliant.

### Check 26278
- Remediation title: Ensure 'Turn on convenience PIN sign-in' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowDomainPINLogon' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\System:AllowDomainPINLogon REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets AllowDomainPINLogon=0; compliant.

### Check 26279
- Remediation title: Ensure 'Allow Clipboard synchronization across devices' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowCrossDeviceClipboard' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\System:AllowCrossDeviceClipboard REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets AllowCrossDeviceClipboard=0; compliant.

### Check 26280
- Remediation title: Ensure 'Allow upload of User Activities' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'UploadUserActivities' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\System:UploadUserActivities REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets UploadUserActivities=0; compliant.

### Check 26281
- Remediation title: Ensure 'Allow network connectivity during connected-standby (on battery)' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DCSettingIndex' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9:DCSettingIndex REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets DCSettingIndex=0; compliant.

### Check 26282
- Remediation title: Ensure 'Allow network connectivity during connected-standby (plugged in)' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'ACSettingIndex' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9:ACSettingIndex REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets ACSettingIndex=0; compliant.

### Check 26283
- Remediation title: Ensure 'Allow standby states (S1-S3) when sleeping (on battery)' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DCSettingIndex' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab:DCSettingIndex REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets DCSettingIndex=0; compliant.

### Check 26284
- Remediation title: Ensure 'Allow standby states (S1-S3) when sleeping (plugged in)' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'ACSettingIndex' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab:ACSettingIndex REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets ACSettingIndex=0; compliant.

### Check 26285
- Remediation title: Ensure 'Require a password when a computer wakes (on battery)' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DCSettingIndex' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51:DCSettingIndex REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets DCSettingIndex=1; compliant.

### Check 26286
- Remediation title: Ensure 'Require a password when a computer wakes (plugged in)' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'ACSettingIndex' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51:ACSettingIndex REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets ACSettingIndex=1; compliant.

### Check 26287
- Remediation title: Ensure 'Configure Offer Remote Assistance' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'fAllowUnsolicited' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services:fAllowUnsolicited REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets fAllowUnsolicited=0; compliant.

### Check 26288
- Remediation title: Ensure 'Configure Solicited Remote Assistance' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'fAllowToGetHelp' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services:fAllowToGetHelp REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets fAllowToGetHelp=0; compliant.

### Check 26289
- Remediation title: Ensure 'Enable RPC Endpoint Mapper Client Authentication' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableAuthEpResolution' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Rpc:EnableAuthEpResolution REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets EnableAuthEpResolution=1; compliant.

### Check 26290
- Remediation title: Ensure 'Restrict Unauthenticated RPC clients' is set to 'Enabled: Authenticated'.
- Remediation script action/value: New-ItemProperty ... -Name 'RestrictRemoteClients' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: Authenticated — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Rpc:RestrictRemoteClients REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets RestrictRemoteClients=1; compliant.

### Check 26291
- Remediation title: Ensure 'Microsoft Support Diagnostic Tool: Turn on MSDT interactive communication with support provider' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableQueryRemoteServer' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy:DisableQueryRemoteServer REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets DisableQueryRemoteServer=0; compliant.

### Check 26292
- Remediation title: Ensure 'Enable/Disable PerfTrack' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'ScenarioExecutionEnabled' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}:ScenarioExecutionEnabled REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets ScenarioExecutionEnabled=0; compliant.

### Check 26293
- Remediation title: Ensure 'Turn off the advertising ID' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisabledByGroupPolicy' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo:DisabledByGroupPolicy REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets DisabledByGroupPolicy=1; compliant.

### Check 26294
- Remediation title: Ensure 'Enable Windows NTP Client' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'Enabled' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\W32Time\TimeProviders\NtpClient:Enabled REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets Enabled=1; compliant.

### Check 26295
- Remediation title: Ensure 'Enable Windows NTP Server' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'Enabled' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\W32Time\TimeProviders\NtpServer:Enabled REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets Enabled=0; compliant.

### Check 26296
- Remediation title: Ensure 'Allow a Windows app to share application data between users' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowSharedLocalAppData' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\AppModel\StateManager:AllowSharedLocalAppData REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets AllowSharedLocalAppData=0; compliant.

### Check 26297
- Remediation title: Ensure 'Prevent non-admin users from installing packaged Windows apps' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'BlockNonAdminUserInstall' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Appx:BlockNonAdminUserInstall REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets BlockNonAdminUserInstall=1; compliant.

### Check 26298
- Remediation title: Ensure 'Let Windows apps activate with voice while the system is locked' is set to 'Enabled: Force Deny'.
- Remediation script action/value: New-ItemProperty ... -Name 'LetAppsActivateWithVoiceAboveLock' -Value 2 ...
- v5.0.0 benchmark required value: Enabled: Force Deny — HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy:LetAppsActivateWithVoiceAboveLock REG_DWORD = 2
- Change detected: NO_CHANGE
- Details: Remediation sets LetAppsActivateWithVoiceAboveLock=2; compliant.

### Check 26299
- Remediation title: Ensure 'Allow Microsoft accounts to be optional' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'MSAOptional' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System:MSAOptional REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets MSAOptional=1; compliant.

### Check 26300
- Remediation title: Ensure 'Block launching Universal Windows apps with Windows Runtime API access from hosted content.' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'BlockHostedAppAccessWinRT' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System:BlockHostedAppAccessWinRT REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets BlockHostedAppAccessWinRT=1; compliant.

## Checks 26301–26350 (this batch)

### Check 26301
- Remediation title: Ensure 'Disallow Autoplay for non-volume devices' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'NoAutoplayfornonVolume' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer:NoAutoplayfornonVolume REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `NoAutoplayfornonVolume=1`; v5.0.0 requires Enabled; compliant.

### Check 26302
- Remediation title: Ensure 'Set the default behavior for AutoRun' is set to 'Enabled: Do not execute any autorun commands'.
- Remediation script action/value: New-ItemProperty ... -Name 'NoAutorun' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: Do not execute any autorun commands — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer:NoAutorun REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `NoAutorun=1`; compliant.

### Check 26303
- Remediation title: Ensure 'Turn off Autoplay' is set to 'Enabled: All drives'.
- Remediation script action/value: New-ItemProperty ... -Name 'NoDriveTypeAutoRun' -Value 255 ...
- v5.0.0 benchmark required value: Enabled: All drives — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer:NoDriveTypeAutoRun REG_DWORD = 255
- Change detected: NO_CHANGE
- Details: Remediation sets `NoDriveTypeAutoRun=255`; compliant.

### Check 26304
- Remediation title: Ensure 'Configure enhanced anti-spoofing' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnhancedAntiSpoofing' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Biometrics\FacialFeatures:EnhancedAntiSpoofing REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `EnhancedAntiSpoofing=1`; compliant.

### Check 26305
- Remediation title: Ensure 'Allow access to BitLocker-protected fixed data drives from earlier versions of Windows' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'FDVRecovery' -Value 1 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\FVE:FDVDiscoveryVolumeType REG_SZ = <none> (blank)
- Change detected: VALUE_CHANGED
- Details: Remediation sets `FDVRecovery=1`; v5.0.0 requires Disabled via the FDVDiscoveryVolumeType registry value set to <none>; remediation change required.

### Check 26306
- Remediation title: Ensure 'Choose how BitLocker-protected fixed drives can be recovered' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'FDVRecovery' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\FVE:FDVRecovery REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `FDVRecovery=1`; compliant.

### Check 26307
- Remediation title: Ensure 'Choose how BitLocker-protected fixed drives can be recovered: Allow data recovery agent' is set to 'Enabled: True'.
- Remediation script action/value: New-ItemProperty ... -Name 'FDVManageDRA' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: True — HKLM\SOFTWARE\Policies\Microsoft\FVE:FDVManageDRA REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `FDVManageDRA=1`; compliant.

### Check 26308
- Remediation title: Ensure 'Choose how BitLocker-protected fixed drives can be recovered: Recovery Password' is set to 'Enabled: Allow 48-digit recovery password' or higher.
- Remediation script action/value: New-ItemProperty ... -Name 'FDVRecoveryPassword' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: Allow 48-digit recovery password or higher — HKLM\SOFTWARE\Policies\Microsoft\FVE:FDVRecoveryPassword REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `FDVRecoveryPassword=1`; compliant.

### Check 26309
- Remediation title: Ensure 'Choose how BitLocker-protected fixed drives can be recovered: Recovery Key' is set to 'Enabled: Allow 256-bit recovery key' or higher.
- Remediation script action/value: New-ItemProperty ... -Name 'FDVRecoveryKey' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: Allow 256-bit recovery key or higher — HKLM\SOFTWARE\Policies\Microsoft\FVE:FDVRecoveryKey REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `FDVRecoveryKey=1`; compliant.

### Check 26310
- Remediation title: Ensure 'Choose how BitLocker-protected fixed drives can be recovered: Omit recovery options from the BitLocker setup wizard' is set to 'Enabled: True'.
- Remediation script action/value: New-ItemProperty ... -Name 'FDVHideRecoveryPage' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: True — HKLM\SOFTWARE\Policies\Microsoft\FVE:FDVHideRecoveryPage REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `FDVHideRecoveryPage=1`; compliant.

### Check 26311
- Remediation title: Ensure 'Choose how BitLocker-protected fixed drives can be recovered: Save BitLocker recovery information to AD DS for fixed data drives' is set to 'Enabled: False'.
- Remediation script action/value: New-ItemProperty ... -Name 'FDVActiveDirectoryBackup' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: False — HKLM\SOFTWARE\Policies\Microsoft\FVE:FDVActiveDirectoryBackup REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `FDVActiveDirectoryBackup=1`; compliant.

### Check 26312
- Remediation title: Ensure 'Choose how BitLocker-protected fixed drives can be recovered: Configure storage of BitLocker recovery information to AD DS' is set to 'Enabled: Backup recovery passwords and key packages'.
- Remediation script action/value: New-ItemProperty ... -Name 'FDVActiveDirectoryInfoToStore' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: Backup recovery passwords and key packages — HKLM\SOFTWARE\Policies\Microsoft\FVE:FDVActiveDirectoryInfoToStore REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `FDVActiveDirectoryInfoToStore=1`; compliant.

### Check 26313
- Remediation title: Ensure 'Choose how BitLocker-protected fixed drives can be recovered: Do not enable BitLocker until recovery information is stored to AD DS for fixed data drives' is set to 'Enabled: False'.
- Remediation script action/value: New-ItemProperty ... -Name 'FDVRequireActiveDirectoryBackup' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: False — HKLM\SOFTWARE\Policies\Microsoft\FVE:FDVRequireActiveDirectoryBackup REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `FDVRequireActiveDirectoryBackup=0`; compliant.

### Check 26314
- Remediation title: Ensure 'Configure use of hardware-based encryption for fixed data drives' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'FDVHardwareEncryption' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\FVE:FDVHardwareEncryption REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `FDVHardwareEncryption=0`; compliant.

### Check 26315
- Remediation title: Ensure 'Configure use of passwords for fixed data drives' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'FDVPassphrase' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\FVE:FDVPassphrase REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `FDVPassphrase=0`; compliant.

### Check 26316
- Remediation title: Ensure 'Configure use of smart cards on fixed data drives' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'FDVAllowUserCert' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\FVE:FDVAllowUserCert REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `FDVAllowUserCert=1`; compliant.

### Check 26317
- Remediation title: Ensure 'Configure use of smart cards on fixed data drives: Require use of smart cards on fixed data drives' is set to 'Enabled: True'.
- Remediation script action/value: New-ItemProperty ... -Name 'FDVEnforceUserCert' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: True — HKLM\SOFTWARE\Policies\Microsoft\FVE:FDVEnforceUserCert REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `FDVEnforceUserCert=1`; compliant.

### Check 26318
- Remediation title: Ensure 'Allow enhanced PINs for startup' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'UseEnhancedPin' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\FVE:UseEnhancedPin REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `UseEnhancedPin=1`; compliant.

### Check 26319
- Remediation title: Ensure 'Allow Secure Boot for integrity validation' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'OSAllowSecureBootForIntegrity' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\FVE:OSAllowSecureBootForIntegrity REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `OSAllowSecureBootForIntegrity=1`; compliant.

### Check 26320
- Remediation title: Ensure 'Choose how BitLocker-protected operating system drives can be recovered' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'OSRecovery' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\FVE:OSRecovery REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `OSRecovery=1`; compliant.

### Check 26321
- Remediation title: Ensure 'Choose how BitLocker-protected operating system drives can be recovered: Allow data recovery agent' is set to 'Enabled: False'.
- Remediation script action/value: New-ItemProperty ... -Name 'OSManageDRA' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: False — HKLM\SOFTWARE\Policies\Microsoft\FVE:OSManageDRA REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `OSManageDRA=1`; compliant.

### Check 26322
- Remediation title: Ensure 'Choose how BitLocker-protected operating system drives can be recovered: Recovery Password' is set to 'Enabled: Require 48-digit recovery password'.
- Remediation script action/value: New-ItemProperty ... -Name 'OSRecoveryPassword' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: Require 48-digit recovery password — HKLM\SOFTWARE\Policies\Microsoft\FVE:OSRecoveryPassword REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `OSRecoveryPassword=1`; compliant.

### Check 26323
- Remediation title: Ensure 'Choose how BitLocker-protected operating system drives can be recovered: Recovery Key' is set to 'Enabled: Do not allow 256-bit recovery key'.
- Remediation script action/value: New-ItemProperty ... -Name 'OSRecoveryKey' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: Do not allow 256-bit recovery key — HKLM\SOFTWARE\Policies\Microsoft\FVE:OSRecoveryKey REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `OSRecoveryKey=0`; compliant.

### Check 26324
- Remediation title: Ensure 'Choose how BitLocker-protected operating system drives can be recovered: Omit recovery options from the BitLocker setup wizard' is set to 'Enabled: True'.
- Remediation script action/value: New-ItemProperty ... -Name 'OSHideRecoveryPage' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: True — HKLM\SOFTWARE\Policies\Microsoft\FVE:OSHideRecoveryPage REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `OSHideRecoveryPage=1`; compliant.

### Check 26325
- Remediation title: Ensure 'Choose how BitLocker-protected operating system drives can be recovered: Allow data recovery agent' is set to 'Enabled: False'.
- Remediation script action/value: New-ItemProperty ... -Name 'OSActiveDirectoryBackup' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: True — HKLM\SOFTWARE\Policies\Microsoft\FVE:OSActiveDirectoryBackup REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `OSActiveDirectoryBackup=1`; compliant.

### Check 26326
- Remediation title: Ensure 'Choose how BitLocker-protected operating system drives can be recovered: Configure storage of BitLocker recovery information to AD DS:' is set to 'Enabled: Store recovery passwords and key packages'.
- Remediation script action/value: New-ItemProperty ... -Name 'OSActiveDirectoryInfoToStore' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: Store recovery passwords and key packages — HKLM\SOFTWARE\Policies\Microsoft\FVE:OSActiveDirectoryInfoToStore REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `OSActiveDirectoryInfoToStore=1`; compliant.

### Check 26327
- Remediation title: Ensure 'Choose how BitLocker-protected operating system drives can be recovered: Do not enable BitLocker until recovery information is stored to AD DS for operating system drives' is set to 'Enabled: True'.
- Remediation script action/value: New-ItemProperty ... -Name 'OSRequireActiveDirectoryBackup' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: True — HKLM\SOFTWARE\Policies\Microsoft\FVE:OSRequireActiveDirectoryBackup REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `OSRequireActiveDirectoryBackup=1`; compliant.

### Check 26328
- Remediation title: Ensure 'Configure use of hardware-based encryption for operating system drives' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'OSHardwareEncryption' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\FVE:OSHardwareEncryption REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `OSHardwareEncryption=0`; compliant.

### Check 26329
- Remediation title: Ensure 'Configure use of passwords for operating system drives' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'OSPassphrase' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\FVE:OSPassphrase REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `OSPassphrase=0`; compliant.

### Check 26330
- Remediation title: Ensure 'Require additional authentication at startup' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'UseAdvancedStartup' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\FVE:UseAdvancedStartup REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `UseAdvancedStartup=1`; compliant.

### Check 26331
- Remediation title: Ensure 'Require additional authentication at startup: Allow BitLocker without a compatible TPM' is set to 'Enabled: False'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableBDEWithNoTPM' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: False — HKLM\SOFTWARE\Policies\Microsoft\FVE:EnableBDEWithNoTPM REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `EnableBDEWithNoTPM=0`; compliant.

### Check 26332
- Remediation title: Ensure 'Require additional authentication at startup: Configure TPM startup:' is set to 'Enabled: Do not allow TPM'.
- Remediation script action/value: New-ItemProperty ... -Name 'UseTPM' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: Do not allow TPM — HKLM\SOFTWARE\Policies\Microsoft\FVE:UseTPM REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `UseTPM=0`; compliant.

### Check 26333
- Remediation title: Ensure 'Require additional authentication at startup: Configure TPM startup PIN:' is set to 'Enabled: Require startup PIN with TPM'.
- Remediation script action/value: New-ItemProperty ... -Name 'UseTPMPIN' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: Require startup PIN with TPM — HKLM\SOFTWARE\Policies\Microsoft\FVE:UseTPMPIN REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `UseTPMPIN=1`; compliant.

### Check 26334
- Remediation title: Ensure 'Require additional authentication at startup: Configure TPM startup key:' is set to 'Enabled: Do not allow startup key with TPM'.
- Remediation script action/value: New-ItemProperty ... -Name 'UseTPMKey' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: Do not allow startup key with TPM — HKLM\SOFTWARE\Policies\Microsoft\FVE:UseTPMKey REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `UseTPMKey=0`; compliant.

### Check 26335
- Remediation title: Ensure 'Require additional authentication at startup: Configure TPM startup key and PIN:' is set to 'Enabled: Do not allow startup key and PIN with TPM'.
- Remediation script action/value: New-ItemProperty ... -Name 'UseTPMKeyPIN' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: Do not allow startup key and PIN with TPM — HKLM\SOFTWARE\Policies\Microsoft\FVE:UseTPMKeyPIN REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `UseTPMKeyPIN=0`; compliant.

### Check 26336
- Remediation title: Ensure 'Allow access to BitLocker-protected removable data drives from earlier versions of Windows' is set to 'Disabled'.
- Remediation script action/value: Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name RDVDiscoveryVolumeType -Value "<none>"
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\FVE:RDVDiscoveryVolumeType REG_SZ = <none> (blank)
- Change detected: NO_CHANGE
- Details: Remediation sets `RDVDiscoveryVolumeType=<none>`; compliant.

### Check 26337
- Remediation title: Ensure 'Choose how BitLocker-protected removable drives can be recovered' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'RDVRecovery' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\FVE:RDVRecovery REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `RDVRecovery=1`; compliant.

### Check 26338
- Remediation title: Ensure 'Choose how BitLocker-protected removable drives can be recovered: Allow data recovery agent' is set to 'Enabled: True'.
- Remediation script action/value: New-ItemProperty ... -Name 'RDVManageDRA' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: True — HKLM\SOFTWARE\Policies\Microsoft\FVE:RDVManageDRA REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `RDVManageDRA=1`; compliant.

### Check 26339
- Remediation title: Ensure 'Choose how BitLocker-protected removable drives can be recovered: Recovery Password' is set to 'Enabled: Do not allow 48-digit recovery password'.
- Remediation script action/value: New-ItemProperty ... -Name 'RDVRecoveryPassword' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: Do not allow 48-digit recovery password — HKLM\SOFTWARE\Policies\Microsoft\FVE:RDVRecoveryPassword REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `RDVRecoveryPassword=0`; compliant.

### Check 26340
- Remediation title: Ensure 'Choose how BitLocker-protected removable drives can be recovered: Recovery Key' is set to 'Enabled: Do not allow 256-bit recovery key'.
- Remediation script action/value: New-ItemProperty ... -Name 'RDVRecoveryKey' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: Do not allow 256-bit recovery key — HKLM\SOFTWARE\Policies\Microsoft\FVE:RDVRecoveryKey REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `RDVRecoveryKey=0`; compliant.

### Check 26341
- Remediation title: Ensure 'Choose how BitLocker-protected removable drives can be recovered: Omit recovery options from the BitLocker setup wizard' is set to 'Enabled: True'.
- Remediation script action/value: New-ItemProperty ... -Name 'RDVHideRecoveryPage' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: True — HKLM\SOFTWARE\Policies\Microsoft\FVE:RDVHideRecoveryPage REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `RDVHideRecoveryPage=1`; compliant.

### Check 26342
- Remediation title: Ensure 'Choose how BitLocker-protected removable drives can be recovered: Save BitLocker recovery information to AD DS for removable data drives' is set to 'Enabled: False'.
- Remediation script action/value: New-ItemProperty ... -Name 'RDVActiveDirectoryBackup' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: False — HKLM\SOFTWARE\Policies\Microsoft\FVE:RDVActiveDirectoryBackup REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `RDVActiveDirectoryBackup=0`; compliant.

### Check 26343
- Remediation title: Ensure 'Choose how BitLocker-protected removable drives can be recovered: Configure storage of BitLocker recovery information to AD DS:' is set to 'Enabled: Backup recovery passwords and key packages'.
- Remediation script action/value: New-ItemProperty ... -Name 'RDVActiveDirectoryInfoToStore' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: Backup recovery passwords and key packages — HKLM\SOFTWARE\Policies\Microsoft\FVE:RDVActiveDirectoryInfoToStore REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `RDVActiveDirectoryInfoToStore=1`; compliant.

### Check 26344
- Remediation title: Ensure 'Choose how BitLocker-protected removable drives can be recovered: Do not enable BitLocker until recovery information is stored to AD DS for removable data drives' is set to 'Enabled: False'.
- Remediation script action/value: New-ItemProperty ... -Name 'RDVRequireActiveDirectoryBackup' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: False — HKLM\SOFTWARE\Policies\Microsoft\FVE:RDVRequireActiveDirectoryBackup REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `RDVRequireActiveDirectoryBackup=0`; compliant.

### Check 26345
- Remediation title: Ensure 'Configure use of hardware-based encryption for removable data drives' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'RDVHardwareEncryption' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\FVE:RDVHardwareEncryption REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `RDVHardwareEncryption=0`; compliant.

### Check 26346
- Remediation title: Ensure 'Configure use of passwords for removable data drives' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'RDVPassphrase' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\FVE:RDVPassphrase REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `RDVPassphrase=0`; compliant.

### Check 26347
- Remediation title: Ensure 'Configure use of smart cards on removable data drives' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'RDVAllowUserCert' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\FVE:RDVAllowUserCert REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `RDVAllowUserCert=1`; compliant.

### Check 26348
- Remediation title: Ensure 'Configure use of smart cards on removable data drives: Require use of smart cards on removable data drives' is set to 'Enabled: True'.
- Remediation script action/value: New-ItemProperty ... -Name 'RDVEnforceUserCert' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: True — HKLM\SOFTWARE\Policies\Microsoft\FVE:RDVEnforceUserCert REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `RDVEnforceUserCert=1`; compliant.

### Check 26349
- Remediation title: Ensure 'Deny write access to removable drives not protected by BitLocker' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'RDVDenyWriteAccess' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\FVE:RDVDenyWriteAccess REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `RDVDenyWriteAccess=1`; compliant.

### Check 26350
- Remediation title: Ensure 'Deny write access to removable drives not protected by BitLocker: Do not allow write access to devices configured in another organization' is set to 'Enabled: False'.
- Remediation script action/value: New-ItemProperty ... -Name 'RDVDenyCrossOrg' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: False — HKLM\SOFTWARE\Policies\Microsoft\FVE:RDVDenyCrossOrg REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `RDVDenyCrossOrg=0`; compliant.

## Checks 26351–26370 (this batch)

### Check 26351
- Remediation title: Ensure 'Disable new DMA devices when this computer is locked' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableExternalDMAUnderLock' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\FVE:DisableExternalDMAUnderLock REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableExternalDMAUnderLock=1`; compliant.

### Check 26352
- Remediation title: Ensure 'Allow Use of Camera' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowCamera' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Camera:AllowCamera REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowCamera=0`; compliant.

### Check 26353
- Remediation title: Ensure 'Turn off cloud consumer account state content' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableConsumerAccountStateContent' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent:DisableConsumerAccountStateContent REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableConsumerAccountStateContent=1`; compliant.

### Check 26354
- Remediation title: Ensure 'Turn off cloud optimized content' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableCloudOptimizedContent' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent:DisableCloudOptimizedContent REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableCloudOptimizedContent=1`; compliant.

### Check 26355
- Remediation title: Ensure 'Turn off Microsoft consumer experiences' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableWindowsConsumerFeatures' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent:DisableWindowsConsumerFeatures REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableWindowsConsumerFeatures=1`; compliant.

### Check 26356
- Remediation title: Ensure 'Require pin for pairing' is set to 'Enabled: First Time' OR 'Enabled: Always'.
- Remediation script action/value: New-ItemProperty ... -Name 'RequirePinForPairing' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: First Time OR Enabled: Always — HKLM\SOFTWARE\Policies\Microsoft\Windows\Connect:RequirePinForPairing REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `RequirePinForPairing=1`; compliant.

### Check 26357
- Remediation title: Ensure 'Do not display the password reveal button' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisablePasswordReveal' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\CredUI:DisablePasswordReveal REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `DisablePasswordReveal=1`; compliant.

### Check 26358
- Remediation title: Ensure 'Enumerate administrator accounts on elevation' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnumerateAdministrators' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI:EnumerateAdministrators REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `EnumerateAdministrators=0`; compliant.

### Check 26359
- Remediation title: Ensure 'Prevent the use of security questions for local accounts' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'NoLocalPasswordResetQuestions' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\System:NoLocalPasswordResetQuestions REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `NoLocalPasswordResetQuestions=1`; compliant.

### Check 26360
- Remediation title: Ensure 'Allow Diagnostic Data' is set to 'Enabled: Diagnostic data off (not recommended)' or 'Enabled: Send required diagnostic data'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowTelemetry' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: Diagnostic data off (not recommended) or Enabled: Send required diagnostic data — HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection:AllowTelemetry REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowTelemetry=0`; compliant.

### Check 26361
- Remediation title: Ensure 'Configure Authenticated Proxy usage for the Connected User Experience and Telemetry service' is set to 'Enabled: Disable Authenticated Proxy usage'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableEnterpriseAuthProxy' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: Disable Authenticated Proxy usage — HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection:DisableEnterpriseAuthProxy REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableEnterpriseAuthProxy=1`; compliant.

### Check 26362
- Remediation title: Ensure 'Disable OneSettings Downloads' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableOneSettingsDownloads' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection:DisableOneSettingsDownloads REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableOneSettingsDownloads=1`; compliant.

### Check 26363
- Remediation title: Ensure 'Do not show feedback notifications' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DoNotShowFeedbackNotifications' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection:DoNotShowFeedbackNotifications REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `DoNotShowFeedbackNotifications=1`; compliant.

### Check 26364
- Remediation title: Ensure 'Enable OneSettings Auditing' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableOneSettingsAuditing' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection:EnableOneSettingsAuditing REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `EnableOneSettingsAuditing=1`; compliant.

### Check 26365
- Remediation title: Ensure 'Limit Diagnostic Log Collection' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'LimitDiagnosticLogCollection' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection:LimitDiagnosticLogCollection REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `LimitDiagnosticLogCollection=1`; compliant.

### Check 26366
- Remediation title: Ensure 'Limit Dump Collection' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'LimitDumpCollection' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection:LimitDumpCollection REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `LimitDumpCollection=1`; compliant.

### Check 26367
- Remediation title: Ensure 'Toggle user control over Insider builds' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowBuildPreview' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows:PreviewBuilds:AllowBuildPreview REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowBuildPreview=0`; compliant.

### Check 26368
- Remediation title: Ensure 'Download Mode' is NOT set to 'Enabled: Internet'.
- Remediation script action/value: New-ItemProperty ... -Name 'DODownloadMode' -Value 0 ...
- v5.0.0 benchmark required value: NOT set to Enabled: Internet — HKLM\SOFTWARE\Policies\Microsoft\Windows:DeliveryOptimization:DODownloadMode REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `DODownloadMode=0`; compliant.

### Check 26369
- Remediation title: Ensure 'Enable App Installer' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableAppInstaller' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\AppInstaller:EnableAppInstaller REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `EnableAppInstaller=0`; compliant.

### Check 26370
- Remediation title: Ensure 'Enable App Installer Experimental Features' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableExperimentalFeatures' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\AppInstaller:EnableExperimentalFeatures REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `EnableExperimentalFeatures=0`; compliant.

## Checks 26371–26400 (this batch)

### Check 26371
- Remediation title: Ensure 'Enable App Installer Hash Override' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableHashOverride' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\AppInstaller:EnableHashOverride REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `EnableHashOverride=0`; compliant.

### Check 26372
- Remediation title: Ensure 'Enable App Installer ms-appinstaller protocol' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableMSAppInstallerProtocol' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\AppInstaller:EnableMSAppInstallerProtocol REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `EnableMSAppInstallerProtocol=0`; compliant.

### Check 26373
- Remediation title: Ensure 'Application: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'Retention' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application:Retention REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `Retention=0`; compliant.

### Check 26374
- Remediation title: Ensure 'Application: Specify the maximum log file size (KB)' is set to 'Enabled: 32,768 or greater'.
- Remediation script action/value: New-ItemProperty ... -Name 'MaxSize' -Value 32768 ...
- v5.0.0 benchmark required value: Enabled: 32,768 or greater — HKLM\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application:MaxSize REG_DWORD = 32768
- Change detected: NO_CHANGE
- Details: Remediation sets `MaxSize=32768`; compliant.

### Check 26375
- Remediation title: Ensure 'Security: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'Retention' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security:Retention REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `Retention=0`; compliant.

### Check 26376
- Remediation title: Ensure 'Security: Specify the maximum log file size (KB)' is set to 'Enabled: 196,608 or greater'.
- Remediation script action/value: New-ItemProperty ... -Name 'MaxSize' -Value 196608 ...
- v5.0.0 benchmark required value: Enabled: 196,608 or greater — HKLM\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security:MaxSize REG_DWORD = 196608
- Change detected: NO_CHANGE
- Details: Remediation sets `MaxSize=196608`; compliant.

### Check 26377
- Remediation title: Ensure 'Setup: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'Retention' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\EventLog\Setup:Retention REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `Retention=0`; compliant.

### Check 26378
- Remediation title: Ensure 'Setup: Specify the maximum log file size (KB)' is set to 'Enabled: 32,768 or greater'.
- Remediation script action/value: New-ItemProperty ... -Name 'MaxSize' -Value 32768 ...
- v5.0.0 benchmark required value: Enabled: 32,768 or greater — HKLM\SOFTWARE\Policies\Microsoft\Windows\EventLog\Setup:MaxSize REG_DWORD = 32768
- Change detected: NO_CHANGE
- Details: Remediation sets `MaxSize=32768`; compliant.

### Check 26379
- Remediation title: Ensure 'System: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'Retention' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\EventLog\System:Retention REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `Retention=0`; compliant.

### Check 26380
- Remediation title: Ensure 'System: Specify the maximum log file size (KB)' is set to 'Enabled: 32,768 or greater'.
- Remediation script action/value: New-ItemProperty ... -Name 'MaxSize' -Value 32768 ...
- v5.0.0 benchmark required value: Enabled: 32,768 or greater — HKLM\SOFTWARE\Policies\Microsoft\Windows\EventLog\System:MaxSize REG_DWORD = 32768
- Change detected: NO_CHANGE
- Details: Remediation sets `MaxSize=32768`; compliant.

### Check 26381
- Remediation title: Ensure 'Turn off account-based insights, recent, favorite, and recommended files in File Explorer' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableGraphRecentItems' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer:DisableGraphRecentItems REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableGraphRecentItems=1`; compliant.

### Check 26382
- Remediation title: Ensure 'Turn off Data Execution Prevention for Explorer' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'NoDataExecutionPrevention' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer:NoDataExecutionPrevention REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `NoDataExecutionPrevention=0`; compliant.

### Check 26383
- Remediation title: Ensure 'Turn off heap termination on corruption' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'NoHeapTerminationOnCorruption' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer:NoHeapTerminationOnCorruption REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `NoHeapTerminationOnCorruption=0`; compliant.

### Check 26384
- Remediation title: Ensure 'Turn off shell protocol protected mode' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'PreXPSP2ShellProtocolBehavior' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer:PreXPSP2ShellProtocolBehavior REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `PreXPSP2ShellProtocolBehavior=0`; compliant.

### Check 26385
- Remediation title: Ensure 'Turn off location' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableLocation' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors:DisableLocation REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableLocation=1`; compliant.

### Check 26386
- Remediation title: Ensure 'Allow Message Service Cloud Sync' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowMessageSync' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Messaging:AllowMessageSync REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowMessageSync=0`; compliant.

### Check 26387
- Remediation title: Ensure 'Block all consumer Microsoft account user authentication' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableUserAuth' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\MicrosoftAccount:DisableUserAuth REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableUserAuth=1`; compliant.

### Check 26388
- Remediation title: Ensure 'Configure local setting override for reporting to Microsoft MAPS' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'LocalSettingOverrideSpynetReporting' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet:LocalSettingOverrideSpynetReporting REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `LocalSettingOverrideSpynetReporting=0`; compliant.

### Check 26389
- Remediation title: Ensure 'Join Microsoft MAPS' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'SpynetReporting' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet:SpynetReporting REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `SpynetReporting=0`; compliant.

### Check 26390
- Remediation title: Ensure 'Configure Attack Surface Reduction rules' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'ExploitGuard_ASR_Rules' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR:ExploitGuard_ASR_Rules REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `ExploitGuard_ASR_Rules=1`; compliant.

### Check 26391
- Remediation title: Ensure 'Configure Attack Surface Reduction rules: Set the state for each ASR rule' is configured.
- Remediation script action/value: New-ItemProperty ... -Name '26190899-1602-49E8-8B27-eB1D0A1CE869' -Value 1 ...
- v5.0.0 benchmark required value: Configured — HKLM\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR:ExploitGuard_ASR_Rules REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets ASR rules to Enabled (1); compliant.

### Check 26392
- Remediation title: Ensure 'Prevent users and apps from accessing dangerous websites' is set to 'Enabled: Block'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableNetworkProtection' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: Block — HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection:EnableNetworkProtection REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `EnableNetworkProtection=1`; compliant.

### Check 26393
- Remediation title: Ensure 'Enable file hash computation feature' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableFileHashComputation' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine:EnableFileHashComputation REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `EnableFileHashComputation=1`; compliant.

### Check 26394
- Remediation title: Ensure 'Scan all downloaded files and attachments' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableIOAVProtection' -Value 0 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-TimeProtection:DisableIOAVProtection REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableIOAVProtection=0`; compliant.

### Check 26395
- Remediation title: Ensure 'Turn off real-time protection' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableRealtimeMonitoring' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-TimeProtection:DisableRealtimeMonitoring REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableRealtimeMonitoring=0`; compliant.

### Check 26396
- Remediation title: Ensure 'Turn on behavior monitoring' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableBehaviorMonitoring' -Value 0 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-TimeProtection:DisableBehaviorMonitoring REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableBehaviorMonitoring=0`; compliant.

### Check 26397
- Remediation title: Ensure 'Turn on script scanning' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableScriptScanning' -Value 0 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-TimeProtection:DisableScriptScanning REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableScriptScanning=0`; compliant.

### Check 26398
- Remediation title: Ensure 'Configure Watson events' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableGenericReReports' -Value 1 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting:DisableGenericReReports REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableGenericReReports=1`; compliant.

### Check 26399
- Remediation title: Ensure 'Scan packed executables' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisablePackedExeScanning' -Value 0 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Scan:DisablePackedExeScanning REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `DisablePackedExeScanning=0`; compliant.

### Check 26400
- Remediation title: Ensure 'Scan removable drives' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableRemovableDriveScanning' -Value 0 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Scan:DisableRemovableDriveScanning REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableRemovableDriveScanning=0`; compliant.

## Checks 26401–26481 (this batch)

### Check 26401
- Remediation title: Ensure 'Turn on e-mail scanning' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableEmailScanning' -Value 0 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Scan:DisableEmailScanning REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableEmailScanning=0`; compliant.

### Check 26402
- Remediation title: Ensure 'Configure detection for potentially unwanted applications' is set to 'Enabled: Block'.
- Remediation script action/value: New-ItemProperty ... -Name 'PUAProtection' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: Block — HKLM\SOFTWARE\Policies\Microsoft\Windows Defender:PUAProtection REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `PUAProtection=1`; compliant.

### Check 26403
- Remediation title: Ensure 'Turn off Microsoft Defender AntiVirus' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableAntiSpyware' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows Defender:DisableAntiSpyware REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableAntiSpyware=0`; compliant.

### Check 26404
- Remediation title: Ensure 'Allow auditing events in Microsoft Defender Application Guard' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AuditApplicationGuard' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\AppHVSI:AuditApplicationGuard REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `AuditApplicationGuard=1`; compliant.

### Check 26405
- Remediation title: Ensure 'Allow camera and microphone access in Microsoft Defender Application Guard' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowCameraMicrophoneRedirection' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\AppHVSI:AllowCameraMicrophoneRedirection REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowCameraMicrophoneRedirection=0`; compliant.

### Check 26406
- Remediation title: Ensure 'Allow data persistence for Microsoft Defender Application Guard' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowPersistence' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\AppHVSI:AllowPersistence REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowPersistence=0`; compliant.

### Check 26407
- Remediation title: Ensure 'Allow files to download and save to the host operating system from Microsoft Defender Application Guard' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'SaveFilesToHost' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\AppHVSI:SaveFilesToHost REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `SaveFilesToHost=0`; compliant.

### Check 26408
- Remediation title: Ensure 'Configure Microsoft Defender Application Guard clipboard settings: Clipboard behavior setting' is set to 'Enabled: Enable clipboard operation from an isolated session to the host'.
- Remediation script action/value: New-ItemProperty ... -Name 'AppHVSIClipboardSettings' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: Enable clipboard operation from an isolated session to the host — HKLM\SOFTWARE\Policies\Microsoft\AppHVSI:AppHVSIClipboardSettings REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `AppHVSIClipboardSettings=1`; compliant.

### Check 26409
- Remediation title: Ensure 'Turn on Microsoft Defender Application Guard in Managed Mode' is set to 'Enabled: 1'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowAppHVSI_ProviderSet' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: 1 — HKLM\SOFTWARE\Policies\Microsoft\AppHVSI:AllowAppHVSI_ProviderSet REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowAppHVSI_ProviderSet=1`; compliant.

### Check 26410
- Remediation title: Ensure 'Enable news and interests on the taskbar' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableFeeds' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds:EnableFeeds REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `EnableFeeds=0`; compliant.

### Check 26411
- Remediation title: Ensure 'Prevent the usage of OneDrive for file storage' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableFileSyncNGSC' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive:DisableFileSyncNGSC REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableFileSyncNGSC=1`; compliant.

### Check 26412
- Remediation title: Ensure 'Turn off Push To Install service' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisablePushToInstall' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\PushToInstall:DisablePushToInstall REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `DisablePushToInstall=1`; compliant.

### Check 26413
- Remediation title: Ensure 'Disable Cloud Clipboard integration for server-to-client data transfer' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableCloudClipboardIntegration' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\Client:DisableCloudClipboardIntegration REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableCloudClipboardIntegration=1`; compliant.

### Check 26414
- Remediation title: Ensure 'Do not allow passwords to be saved' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisablePasswordSaving' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services:DisablePasswordSaving REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `DisablePasswordSaving=1`; compliant.

### Check 26415
- Remediation title: Ensure 'Allow users to connect remotely by using Remote Desktop Services' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'fDenyTSConnections' -Value 1 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services:fDenyTSConnections REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `fDenyTSConnections=1`; compliant.

### Check 26416
- Remediation title: Ensure 'Allow UI Automation redirection' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableUiaRedirection' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\erminal Services:EnableUiaRedirection REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `EnableUiaRedirection=0`; compliant.

### Check 26417
- Remediation title: Ensure 'Do not allow COM port redirection' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'fDisableCcm' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services:fDisableCcm REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `fDisableCcm=1`; compliant.

### Check 26418
- Remediation title: Ensure 'Do not allow drive redirection' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'fDisableCdm' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services:fDisableCdm REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `fDisableCdm=1`; compliant.

### Check 26419
- Remediation title: Ensure 'Do not allow location redirection' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'fDisableLocationRedir' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services:fDisableLocationRedir REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `fDisableLocationRedir=1`; compliant.

### Check 26420
- Remediation title: Ensure 'Do not allow LPT port redirection' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'fDisableLPT' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services:fDisableLPT REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `fDisableLPT=1`; compliant.

### Check 26421
- Remediation title: Ensure 'Do not allow supported Plug and Play device redirection' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'fDisablePNPRedir' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services:fDisablePNPRedir REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `fDisablePNPRedir=1`; compliant.

### Check 26422
- Remediation title: Ensure 'Do not allow WebAuthn redirection' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'fDisableWebAuthn' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services:fDisableWebAuthn REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `fDisableWebAuthn=1`; compliant.

### Check 26423
- Remediation title: Ensure 'Always prompt for password upon connection' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'fPromptForPassword' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services:fPromptForPassword REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `fPromptForPassword=1`; compliant.

### Check 26424
- Remediation title: Ensure 'Require secure RPC communication' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'fEncryptRPCTraffic' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services:fEncryptRPCTraffic REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `fEncryptRPCTraffic=1`; compliant.

### Check 26425
- Remediation title: Ensure 'Require use of specific security layer for remote (RDP) connections' is set to 'Enabled: SSL'.
- Remediation script action/value: New-ItemProperty ... -Name 'SecurityLayer' -Value 2 ...
- v5.0.0 benchmark required value: Enabled: SSL — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services:SecurityLayer REG_DWORD = 2
- Change detected: NO_CHANGE
- Details: Remediation sets `SecurityLayer=2`; compliant.

### Check 26426
- Remediation title: Ensure 'Require user authentication for remote connections by using Network Level Authentication' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'UserAuthentication' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services:UserAuthentication REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `UserAuthentication=1`; compliant.

### Check 26427
- Remediation title: Ensure 'Set client connection encryption level' is set to 'Enabled: High Level'.
- Remediation script action/value: New-ItemProperty ... -Name 'MinEncryptionLevel' -Value 3 ...
- v5.0.0 benchmark required value: Enabled: High Level — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services:MinEncryptionLevel REG_DWORD = 3
- Change detected: NO_CHANGE
- Details: Remediation sets `MinEncryptionLevel=3`; compliant.

### Check 26428
- Remediation title: Ensure 'Set time limit for active but idle Remote Desktop Services sessions' is set to 'Enabled: 15 minutes or less, but not Never (0)'.
- Remediation script action/value: New-ItemProperty ... -Name 'MaxIdleTime' -Value 900 ...
- v5.0.0 benchmark required value: Enabled: 15 minutes or less, but not Never (0) — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services:MaxIdleTime REG_DWORD = 900
- Change detected: NO_CHANGE
- Details: Remediation sets `MaxIdleTime=900`; compliant.

### Check 26429
- Remediation title: Ensure 'Set time limit for disconnected sessions' is set to 'Enabled: 1 minute'.
- Remediation script action/value: New-ItemProperty ... -Name 'MaxDisconnectionTime' -Value 60000 ...
- v5.0.0 benchmark required value: Enabled: 1 minute — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services:MaxDisconnectionTime REG_DWORD = 60000
- Change detected: NO_CHANGE
- Details: Remediation sets `MaxDisconnectionTime=60000`; compliant.

### Check 26430
- Remediation title: Ensure 'Do not delete temp folders upon exit' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DeleteTempDirsOnExit' -Value 1 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services:DeleteTempDirsOnExit REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `DeleteTempDirsOnExit=1`; compliant.

### Check 26431
- Remediation title: Ensure 'Prevent downloading of enclosures' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableEnclosureDownload' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds:DisableEnclosureDownload REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableEnclosureDownload=1`; compliant.

### Check 26432
- Remediation title: Ensure 'Allow Cloud Search' is set to 'Enabled: Disable Cloud Search'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowCloudSearch' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: Disable Cloud Search — HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search:AllowCloudSearch REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowCloudSearch=0`; compliant.

### Check 26433
- Remediation title: Ensure 'Allow Cortana' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowCortana' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search:AllowCortana REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowCortana=0`; compliant.

### Check 26434
- Remediation title: Ensure 'Allow Cortana above lock screen' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowCortanaAboveLock' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search:AllowCortanaAboveLock REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowCortanaAboveLock=0`; compliant.

### Check 26435
- Remediation title: Ensure 'Allow indexing of encrypted files' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowIndexingEncryptedStoresOrItems' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search:AllowIndexingEncryptedStoresOrItems REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowIndexingEncryptedStoresOrItems=0`; compliant.

### Check 26436
- Remediation title: Ensure 'Allow search and Cortana to use location' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowSearchToUseLocation' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search:AllowSearchToUseLocation REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowSearchToUseLocation=0`; compliant.

### Check 26437
- Remediation title: Ensure 'Allow search highlights' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableDynamicContentInWSB' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search:EnableDynamicContentInWSB REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `EnableDynamicContentInWSB=0`; compliant.

### Check 26438
- Remediation title: Ensure 'Turn off KMS Client Online AVS Validation' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'NoGenTicket' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform:NoGenTicket REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `NoGenTicket=1`; compliant.

### Check 26439
- Remediation title: Ensure 'Disable all apps from Microsoft Store' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableStoreApps' -Value 1 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\WindowsStore:DisableStoreApps REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableStoreApps=1`; compliant.

### Check 26440
- Remediation title: Ensure 'Only display the private store within the Microsoft Store' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'RequirePrivateStoreOnly' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\WindowsStore:RequirePrivateStoreOnly REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `RequirePrivateStoreOnly=1`; compliant.

### Check 26441
- Remediation title: Ensure 'Turn off Automatic Download and Install of updates' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AutoDownload' -Value 4 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\WindowsStore:AutoDownload REG_DWORD = 4
- Change detected: NO_CHANGE
- Details: Remediation sets `AutoDownload=4`; compliant.

### Check 26442
- Remediation title: Ensure 'Turn off the offer to update to the latest version of Windows' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableOSUpgrade' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\WindowsStore:DisableOSUpgrade REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableOSUpgrade=1`; compliant.

### Check 26443
- Remediation title: Ensure 'Turn off the Store application' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'RemoveWindowsStore' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\WindowsStore:RemoveWindowsStore REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `RemoveWindowsStore=1`; compliant.

### Check 26444
- Remediation title: Ensure 'Allow widgets' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowNewsAndInterests' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Dsh:AllowNewsAndInterests REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowNewsAndInterests=0`; compliant.

### Check 26445
- Remediation title: Ensure 'Automatic Data Collection' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'CaptureThreatWindow' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components:CaptureThreatWindow REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `CaptureThreatWindow=1`; compliant.

### Check 26446
- Remediation title: Ensure 'Notify Malicious' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'NotifyMalicious' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components:NotifyMalicious REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `NotifyMalicious=1`; compliant.

### Check 26447
- Remediation title: Ensure 'Notify Password Reuse' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'NotifyPasswordReuse' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components:NotifyPasswordReuse REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `NotifyPasswordReuse=1`; compliant.

### Check 26448
- Remediation title: Ensure 'Notify Unsafe App' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'NotifyUnsafeApp' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components:NotifyUnsafeApp REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `NotifyUnsafeApp=1`; compliant.

### Check 26449
- Remediation title: Ensure 'Service Enabled' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'ServiceEnabled' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components:ServiceEnabled REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `ServiceEnabled=1`; compliant.

### Check 26450
- Remediation title: Ensure 'Configure Windows Defender SmartScreen' is set to 'Enabled: Warn and prevent bypass'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableSmartScreen' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: Warn and prevent bypass — HKLM\SOFTWARE\Policies\Microsoft\Windows\System:EnableSmartScreen REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `EnableSmartScreen=1`; compliant.

### Check 26451
- Remediation title: Ensure 'Enables or disables Windows Game Recording and Broadcasting' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowGameDVR' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR:AllowGameDVR REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowGameDVR=0`; compliant.

### Check 26452
- Remediation title: Ensure 'Enable ESS with Supported Peripherals' is set to 'Enabled: 1'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableESSwithSupportedPeripherals' -Value 1 ...
- v5.0.0 benchmark required value: Enabled: 1 — HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR:EnableESSwithSupportedPeripherals REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `EnableESSwithSupportedPeripherals=1`; compliant.

### Check 26453
- Remediation title: Ensure 'Allow suggested apps in Windows Ink Workspace' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowSuggestedAppsInWindowsInkWorkspace' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace:AllowSuggestedAppsInWindowsInkWorkspace REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowSuggestedAppsInWindowsInkWorkspace=0`; compliant.

### Check 26454
- Remediation title: Ensure 'Allow Windows Ink Workspace' is set to 'Enabled: On, but disallow access above lock' OR 'Enabled: Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowWindowsInkWorkspace' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: On, but disallow access above lock OR Enabled: Disabled — HKLM\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace:AllowWindowsInkWorkspace REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowWindowsInkWorkspace=0`; compliant.

### Check 26455
- Remediation title: Ensure 'Allow user control over installs' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableUserControl' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer:EnableUserControl REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `EnableUserControl=0`; compliant.

### Check 26456
- Remediation title: Ensure 'Always install with elevated privileges' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AlwaysInstallElevated' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer:AlwaysInstallElevated REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AlwaysInstallElevated=0`; compliant.

### Check 26457
- Remediation title: Ensure 'Prevent Internet Explorer security prompt for Windows Installer scripts' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'SafeForScripting' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer:SafeForScripting REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `SafeForScripting=0`; compliant.

### Check 26458
- Remediation title: Ensure 'Enable MPR notifications for the system' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableMPR' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System:EnableMPR REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `EnableMPR=0`; compliant.

### Check 26459
- Remediation title: Ensure 'Sign-in and lock last interactive user automatically after a restart' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableAutomaticRestartSignOn' -Value 1 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System:DisableAutomaticRestartSignOn REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableAutomaticRestartSignOn=1`; compliant.

### Check 26460
- Remediation title: Ensure 'Turn on PowerShell Script Block Logging' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableScriptBlockLogging' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging:EnableScriptBlockLogging REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `EnableScriptBlockLogging=1`; compliant.

### Check 26461
- Remediation title: Ensure 'Turn on PowerShell Transcription' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'EnableTranscripting' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription:EnableTranscripting REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `EnableTranscripting=1`; compliant.

### Check 26462
- Remediation title: Ensure 'Allow Basic authentication' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowBasic' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client:AllowBasic REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowBasic=0`; compliant.

### Check 26463
- Remediation title: Ensure 'Allow unencrypted traffic' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowUnencryptedTraffic' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client:AllowUnencryptedTraffic REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowUnencryptedTraffic=0`; compliant.

### Check 26464
- Remediation title: Ensure 'Disallow Digest authentication' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowDigest' -Value 0 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client:AllowDigest REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowDigest=0`; compliant.

### Check 26465
- Remediation title: Ensure 'Allow Basic authentication' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowBasic' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service:AllowBasic REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowBasic=0`; compliant.

### Check 26466
- Remediation title: Ensure 'Allow remote server management through WinRM' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowAutoConfig' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service:AllowAutoConfig REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowAutoConfig=0`; compliant.

### Check 26467
- Remediation title: Ensure 'Allow unencrypted traffic' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowUnencryptedTraffic' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service:AllowUnencryptedTraffic REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowUnencryptedTraffic=0`; compliant.

### Check 26468
- Remediation title: Ensure 'Disallow WinRM from storing RunAs credentials' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisableRunAs' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service:DisableRunAs REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `DisableRunAs=1`; compliant.

### Check 26469
- Remediation title: Ensure 'Allow Remote Shell Access' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowRemoteShellAccess' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service\WinRS:AllowRemoteShellAccess REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowRemoteShellAccess=0`; compliant.

### Check 26470
- Remediation title: Ensure 'Allow clipboard sharing with Windows Sandbox' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowClipboardRedirection' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Sandbox:AllowClipboardRedirection REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowClipboardRedirection=0`; compliant.

### Check 26471
- Remediation title: Ensure 'Allow networking in Windows Sandbox' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowNetworking' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\Sandbox:AllowNetworking REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowNetworking=0`; compliant.

### Check 26472
- Remediation title: Ensure 'Prevent users from modifying settings' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'DisallowExploitProtectionOverride' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\App and Browser protection:DisallowExploitProtectionOverride REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `DisallowExploitProtectionOverride=1`; compliant.

### Check 26473
- Remediation title: Ensure 'No auto-restart with logged on users for scheduled automatic updates installations' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'NoAutoRebootWithLoggedOnUsers' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU:NoAutoRebootWithLoggedOnUsers REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `NoAutoRebootWithLoggedOnUsers=0`; compliant.

### Check 26474
- Remediation title: Ensure 'Configure Automatic Updates' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'NoAutoUpdate' -Value 0 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU:NoAutoUpdate REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `NoAutoUpdate=0`; compliant.

### Check 26475
- Remediation title: Ensure 'Configure Automatic Updates: Scheduled install day' is set to '0 - Every day'.
- Remediation script action/value: New-ItemProperty ... -Name 'ScheduledInstallDay' -Value 0 ...
- v5.0.0 benchmark required value: 0 - Every day — HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU:ScheduledInstallDay REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `ScheduledInstallDay=0`; compliant.

### Check 26476
- Remediation title: Ensure 'Enable features introduced via servicing that are off by default' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowTemporaryEnterpriseFeatureControl' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate:AllowTemporaryEnterpriseFeatureControl REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowTemporaryEnterpriseFeatureControl=0`; compliant.

### Check 26477
- Remediation title: Ensure 'Remove access to "Pause updates" feature' is set to 'Enabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'SetDisablePauseUXAccess' -Value 1 ...
- v5.0.0 benchmark required value: Enabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate:SetDisablePauseUXAccess REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `SetDisablePauseUXAccess=1`; compliant.

### Check 26478
- Remediation title: Ensure 'Manage preview builds' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'ManagePreviewBuildsPolicyValue' -Value 1 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate:ManagePreviewBuildsPolicyValue REG_DWORD = 1
- Change detected: NO_CHANGE
- Details: Remediation sets `ManagePreviewBuildsPolicyValue=1`; compliant.

### Check 26479
- Remediation title: Ensure 'Select when Preview Builds and Feature Updates are received' is set to 'Enabled: 180 or more days'.
- Remediation script action/value: New-ItemProperty ... -Name 'DeferFeatureUpdatesPeriodInDays' -Value 180 ...
- v5.0.0 benchmark required value: Enabled: 180 or more days — HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate:DeferFeatureUpdatesPeriodInDays REG_DWORD = 180
- Change detected: NO_CHANGE
- Details: Remediation sets `DeferFeatureUpdatesPeriodInDays=180`; compliant.

### Check 26480
- Remediation title: Ensure 'Select when Quality Updates are received' is set to 'Enabled: 0 days'.
- Remediation script action/value: New-ItemProperty ... -Name 'DeferQualityUpdatesPeriodInDays' -Value 0 ...
- v5.0.0 benchmark required value: Enabled: 0 days — HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate:DeferQualityUpdatesPeriodInDays REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `DeferQualityUpdatesPeriodInDays=0`; compliant.

### Check 26481
- Remediation title: Ensure 'Enable optional updates' is set to 'Disabled'.
- Remediation script action/value: New-ItemProperty ... -Name 'AllowOptionalContent' -Value 0 ...
- v5.0.0 benchmark required value: Disabled — HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate:AllowOptionalContent REG_DWORD = 0
- Change detected: NO_CHANGE
- Details: Remediation sets `AllowOptionalContent=0`; compliant.

## Next steps

- Cross-reference complete — all Checks 26000–26481 documented.
- Review the `MISSING` and `VALUE_CHANGED` findings for remediation script updates.

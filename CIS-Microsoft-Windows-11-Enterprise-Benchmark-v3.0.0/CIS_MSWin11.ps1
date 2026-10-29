#CIS Microsoft Windows 11 Enterprise Benchmark v3.0.0
#Author: MrDabrudda
#20OCT2025
#Policy description: This document provides prescriptive guidance for establishing a secure configuration posture for Microsoft Windows 11.

#set-executionpolicy bypass
& { Set-ExecutionPolicy Bypass -Scope Process }

#CIS26000
net accounts /uniquepw:24

#CIS26001
net accounts /maxpwage:42

#CIS26002
net accounts /minpwage:1

#CIS26003
net accounts /minpwlen:14

#CIS26004
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SAM -Name RelaxMinimumPasswordLengthLimits -Value 1

#CIS26005
net.exe accounts /lockoutduration:15

#CIS26006
net accounts /lockoutthreshold:5

#CIS26007
net accounts /lockoutwindow:15

#CIS26008
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name NoConnectedUser -Value 3

#CIS26009
Disable-LocalUser -Name "guest"
Disable-LocalUser -Name "xguest"

#CIS26010
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa -Name LimitBlankPasswordUse -Value 1

#CIS26011
Rename-LocalUser -Name "Administrator" -NewName "xAdministrator"

#CIS26012
Rename-LocalUser -Name "Guest" -NewName "xGuest"

#CIS26013
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa -Name SCENoApplyLegacyAuditPolicy -Value 1

#CIS26014
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa -Name  CrashOnAuditFail -Value 0

#CIS26015
Set-ItemProperty -Path Registry::'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers' -Name AddPrinterDrivers -Value 1

#CIS26016
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters -Name RequireSignOrSeal -Value 1

#CIS26017
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters -Name SealSecureChannel -Value 1

#CIS26018
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters -Name SignSecureChannel -Value 1

#CIS26019
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters -Name DisablePasswordChange -Value 0

#CIS26020
net.exe accounts /minpwage:7
net.exe accounts /maxpwage:30

#CIS26021
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters -Name RequireStrongKey -Value 1

#CIS26022
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name DisableCAD -Value 0

#CIS26023
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name DontDisplayLastUserName -Value 1

#CIS26024
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name MaxDevicePasswordFailedAttempts -Value 29

#CIS26025
#Set Desktop timeout until lock screen engaged
#Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name InactivityTimeoutSecs -Value 900

#CIS26026
Set-ItemProperty -Path Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system -Name legalnoticetext -Value "" -Type String

#CIS26027
Set-ItemProperty -Path Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system -Name legalnoticecaption -Value "" -Type String

#CIS26028
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name CachedLogonsCount -Value 4

#CIS26029
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name PasswordExpiryWarning -Value 10

#CIS26030
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name ScRemoveOption -Value 1

#CIS26031
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters -Name RequireSecuritySignature -Value 1

#CIS26032
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters -Name EnableSecuritySignature -Value 1

#CIS26033
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters -Name EnablePlainTextPassword -Value 0

#CIS26034
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters -Name AutoDisconnect -Value 5

#CIS26035
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters -Name RequireSecuritySignature -Value 1

#CIS26036
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters -Name EnableSecuritySignature -Value 1

#CIS26037
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters -Name EnableForcedLogOff -Value 1

#CIS26038
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters -Name SMBServerNameHardeningLevel -Value 1

#CIS26039
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa -Name RestrictAnonymousSAM -Value 1

#CIS26040
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa -Name RestrictAnonymous -Value 1

#CIS26041
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa -Name DisableDomainCreds -Value 1

#CIS26042
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa -Name EveryoneIncludesAnonymous -Value 0

#CIS26043
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters -Name NullSessionPipes -Value ""

#CIS26044
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths -Name Machine -Value 'System\CurrentControlSet\Control\ProductOptions', 'System\CurrentControlSet\Control\Server Applications', 'Software\Microsoft\Windows NT\CurrentVersion' -Type MultiString

#CIS26045
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths -Name Machine -Value 'System\CurrentControlSet\Control\Print\Printers', 'System\CurrentControlSet\Services\Eventlog', 'Software\Microsoft\OLAP Server', 'Software\Microsoft\Windows NT\CurrentVersion\Print', 'Software\Microsoft\Windows NT\CurrentVersion\Windows', 'System\CurrentControlSet\Control\ContentIndex', 'System\CurrentControlSet\Control\Terminal Server', 'System\CurrentControlSet\Control\Terminal Server\UserConfig', 'System\CurrentControlSet\Control\Terminal Server\DefaultUserConfiguration', 'Software\Microsoft\Windows NT\CurrentVersion\Perflib', 'System\CurrentControlSet\Services\SysmonLog' -Type MultiString

#CIS26046
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters -Name RestrictNullSessAccess -Value 1

#CIS26047
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa -Name RestrictRemoteSam -Value 'O:BAG:BAD:(A;;RC;;;BA)' -Type String

#CIS26048
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters  -Name NullSessionShares -Value "" -Type MultiString

#CIS26049
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa -Name ForceGuest -Value 0

#CIS26050
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa -Name UseMachineId -Value 1

#CIS26051
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0 -Name allownullsessionfallback -Value 0

#CIS26052
New-Item -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\pku2u
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\pku2u -Name AllowOnlineID -Value 0

#CIS26053
New-Item -Path Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos
New-Item -Path Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters -Name SupportedEncryptionTypes -Value 2147483640

#CIS26054
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa -Name NoLMHash -Value 1

#CIS26055
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters -Name EnableForcedLogOff -Value 1

#CIS26056
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa -Name LmCompatibilityLevel -Value 5

#CIS26057
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LDAP -Name LDAPClientIntegrity -Value 1

#CIS26058
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0 -Name NTLMMinClientSec -Value 537395200

#CIS26059
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0 -Name NTLMMinServerSec -Value 537395200

#CIS26060
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0 -Name AuditReceivingNTLMTraffic -Value 2

#CIS26061
#Breaks NTLMv2 Login to remote file shares
#Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0 -Name RestrictSendingNTLMTraffic -Value 2
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0 -Name RestrictSendingNTLMTraffic -Value 0

#CIS26062
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Kernel" -Name ObCaseInsensitive -Value 1

#CIS26063
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager" -Name ProtectionMode -Value 1

#CIS26064
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name FilterAdministratorToken -Value 1

#CIS26065
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 2

#CIS26066
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorUser -Value 0

#CIS26067
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableInstallerDetection -Value 1

#CIS26068
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableSecureUIAPaths -Value 1

#CIS26069
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLUA -Value 1

#CIS26070
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name PromptOnSecureDesktop -Value 1

#CIS26071
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableVirtualization -Value 1

#CIS26072
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTAGService -Name Start -Value 4

#CIS26073
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\bthserv -Name Start -Value 4

#CIS26074
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Browser
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Browser -Name Start -Value 4

#CIS26075
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MapsBroker -Name Start -Value 4

#CIS26076
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lfsvc -Name Start -Value 4

#CIS26077
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\IISADMIN
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\IISADMIN -Name Start -Value 4

#CIS26078
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\irmon
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\irmon -Name Start -Value 4

#CIS26079
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lltdsvc -Name Start -Value 4

#CIS26080
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LxssManager
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LxssManager -Name Start -Value 4

#CIS26081
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FTPSVC
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FTPSVC -Name Start -Value 4

#CIS26082
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MSiSCSI -Name Start -Value 4

#CIS26083
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\sshd
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\sshd -Name Start -Value 4

#CIS26084
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PNRPsvc
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PNRPsvc -Name Start -Value 4

#CIS26085
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\p2psvc
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\p2psvc -Name Start -Value 4

#CIS26086
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\p2pimsvc
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\p2pimsvc -Name Start -Value 4

#CIS26087
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PNRPAutoReg
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PNRPAutoReg -Name Start -Value 4

#CIS26088
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Spooler -Name Start -Value 4

#CIS26089
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wercplsupport -Name Start -Value 4

#CIS26090
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RasAuto -Name Start -Value 4

#CIS26091
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SessionEnv -Name Start -Value 4

#CIS26092
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TermService -Name Start -Value 4

#CIS26093
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UmRdpService -Name Start -Value 4

#CIS26094
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RpcLocator -Name Start -Value 4

#CIS26095
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RemoteRegistry -Name Start -Value 4

#CIS26096
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RemoteAccess -Name Start -Value 4

#CIS26097
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer -Name Start -Value 4

#CIS26098
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\simptcp
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\simptcp -Name Start -Value 4
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName SimpleTCP

#CIS26099
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP -Name Start -Value 4
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMPTrap -Name Start -Value 4
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName SNMP
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName SNMPTrap

#CIS26100
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\sacsvr
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\sacsvr -Name Start -Value 4

#CIS26101
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SSDPSRV -Name Start -Value 4

#CIS26102
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\upnphost -Name Start -Value 4

#CIS26103
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WMSvc
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WMSvc -Name Start -Value 4

#CIS26104
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WerSvc -Name Start -Value 4

#CIS26105
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Wecsvc -Name Start -Value 4

#CIS26106
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WMPNetworkSvc
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WMPNetworkSvc -Name Start -Value 4

#CIS26107
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\icssvc -Name Start -Value 4

#CIS26108
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WpnService -Name Start -Value 4

#CIS26109
#Enable Application Installations from Microsoft Store
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PushToInstall -Name Start -Value 2
#Disable Application Installations from Microsoft Store
##Breaks Microsoft Store from installing/updating apps
#Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PushToInstall -Name Start -Value 4

#CIS26110
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinRM -Name Start -Value 4

#CUS26111
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W3SVC
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W3SVC -Name Start -Value 4

#CIS26112
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\XboxGipSvc -Name Start -Value 4

#CIS26113
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\XblAuthManager -Name Start -Value 4

#CIS26114
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\XblGameSave -Name Start -Value 4

#CIS26115
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\XboxNetApiSvc -Name Start -Value 4

#CIS26116
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile -Name EnableFirewall -Value 1

#CIS26117
#Disable Inbound Domain Firewall
#Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile -Name DefaultInboundAction -Value 0
#Enable Inbound Domain Firewall
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile -Name DefaultInboundAction -Value 1

#CIS26118
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile -Name DisableNotifications -Value 1

#CIS26119
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging  -Name LogFilePath -Value 'System32\logfiles\firewall\domainfw.log' -Type String

#CIS26120
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging -Name LogFileSize -Value 16384

#CIS26121
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging -Name LogDroppedPackets -Value 1

#CIS26122
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging -Name LogSuccessfulConnections -Value 1

#CIS26123
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile -Name EnableFirewall -Value 1

#CIS26124
#Disable Inbound Private Firewall
#Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile -Name DefaultInboundAction -Value 0
#Enable Inbound Private Firewall
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile -Name DefaultInboundAction -Value 1

#CIS26125
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile -Name DisableNotifications -Value 1

#CIS26126
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging -Name LogFilePath -Value 'System32\logfiles\firewall\privatefw.log' -Type String

#CIS26127
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging -Name LogFileSize -Value 16384

#CIS26128
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging -Name LogDroppedPackets -Value 1

#CIS26129
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging -Name LogSuccessfulConnections -Value 1

#CIS26130
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile -Name EnableFirewall -Value 1

#CIS26131
#Enable changes to Inbound Public Firewall
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile -Name DefaultInboundAction -Value 0
#Disable changes to Inbound Public Firewall
#Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile -Name DefaultInboundAction -Value 1

#CIS26132
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile -Name DisableNotifications -Value 1

#CIS26133
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile -Name AllowLocalPolicyMerge -Value 0

#CIS26134
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile -Name AllowLocalIPsecPolicyMerge -Value 0

#CIS26135
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging -Name LogFilePath -Value System32\logfiles\firewall\publicfw.log -Type String

#CIS26136
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging -Name LogFileSize -Value 16384

#CIS26137
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging -Name LogDroppedPackets -Value 1

#CIS26138
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging -Name LogSuccessfulConnections -Value 1

#CIS26139
#Disable Auditing
auditpol /set /subcategory:"Credential Validation" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"Credential Validation" /success:enable /failure:enable

#CIS26140
#Disable Auditing
auditpol /set /subcategory:"Application Group Management" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"Application Group Management" /success:enable /failure:enable

#CIS26141
#Disable Auditing
auditpol /set /subcategory:"Security Group Management" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"Security Group Management" /success:enable /failure:disable

#CIS26142
#Disable Auditing
auditpol /set /subcategory:"User Account Management" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"User Account Management" /success:enable /failure:enable

#CIS26143
#Disable Auditing
auditpol /set /subcategory:"Plug and Play Events" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"Plug and Play Events" /success:enable /failure:disable

#CIS26144
#Disable Auditing
auditpol /set /subcategory:"Process Creation" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"Process Creation" /success:enable /failure:disable

#CIS26145
#Disable Auditing
auditpol /set /subcategory:"Account Lockout" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"Account Lockout" /success:disable /failure:enable

#CIS26146
#Disable Auditing
auditpol /set /subcategory:"Group Membership" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"Group Membership" /success:enable /failure:disable

#CIS26147
#Disable Auditing
auditpol /set /subcategory:"Logoff" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"Logoff" /success:enable /failure:disable

#CIS26148
#Disable Auditing
auditpol /set /subcategory:"Logon" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"Logon" /success:enable /failure:enable

#CIS26149
#Disable Auditing
auditpol /set /subcategory:"Other Logon/Logoff Events" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"Other Logon/Logoff Events" /success:enable /failure:enable

#CIS26150
#Disable Auditing
auditpol /set /subcategory:"Special Logon" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"Special Logon" /success:enable /failure:disable

#CIS26151
#Disable Auditing
auditpol /set /subcategory:"Detailed File Share" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"Detailed File Share" /success:disable /failure:enable

#CIS26152
#Disable Auditing
auditpol /set /subcategory:"File Share" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"File Share" /success:enable /failure:enable

#CIS26153
#Disable Auditing
auditpol /set /subcategory:"Other Object Access Events" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"Other Object Access Events" /success:enable /failure:enable

#CIS26154
#Disable Auditing
auditpol /set /subcategory:"Removable Storage" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"Removable Storage" /success:enable /failure:enable

#CIS26155
#Disable Auditing
auditpol /set /subcategory:"Audit Policy Change" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"Audit Policy Change" /success:enable /failure:disable

#CIS26156
#Disable Auditing
auditpol /set /subcategory:"Authentication Policy Change"  /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"Authentication Policy Change"  /success:enable /failure:disable

#CIS26157
#Disable Auditing
auditpol /set /subcategory:"Authorization Policy Change" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"Authorization Policy Change" /success:enable /failure:disable

#CIS26158
#Disable Auditing
auditpol /set /subcategory:"MPSSVC Rule-Level Policy Change" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"MPSSVC Rule-Level Policy Change" /success:enable /failure:enable

#CIS26159
#Disable Auditing
auditpol /set /subcategory:"Other Policy Change Events"  /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"Other Policy Change Events"  /success:disable /failure:enable

#CIS26160
#Disable Auditing
auditpol /set /subcategory:"Sensitive Privilege Use" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"Sensitive Privilege Use" /success:enable /failure:enable

#CIS26161
#Disable Auditing
auditpol /set /subcategory:"IPsec Driver" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"IPsec Driver" /success:enable /failure:enable

#CIS26162
#Disable Auditing
auditpol /set /subcategory:"Other System Events" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"Other System Events" /success:enable /failure:enable

#CIS26163
#Disable Auditing
auditpol /set /subcategory:"Security State Change" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"Security State Change" /success:enable /failure:disable

#CIS26164
#Disable Auditing
auditpol /set /subcategory:"Security System Extension" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"Security System Extension" /success:enable /failure:disable

#CIS26165
#Disable Auditing
auditpol /set /subcategory:"System Integrity" /success:disable /failure:disable
#Enable Auditing
#auditpol /set /subcategory:"System Integrity" /success:enable /failure:enable

#CIS26166
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization -Name NoLockScreenCamera -Value 1

#CIS26167
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization -Name NoLockScreenSlideshow -Value 1

#CIS26168
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization -Name AllowInputPersonalization -Value 0

#CIS26169
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer -Name AllowOnlineTips -Value 0

#CIS26170
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name LocalAccountTokenFilterPolicy -Value 0

#CIS26171
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print -Name RpcAuthnLevelPrivacyEnabled -Value 1

#CIS26172
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mrxsmb10
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mrxsmb10 -Name Start -Value 4

#CIS26173
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters -Name SMB1 -Value 0

#CIS26174
New-Item -Path Registry::HKLM\SOFTWARE\Microsoft\Cryptography\Wintrust
New-Item -Path Registry::HKLM\SOFTWARE\Microsoft\Cryptography\Wintrust\Config
Set-ItemProperty -Path Registry::HKLM\SOFTWARE\Microsoft\Cryptography\Wintrust\Config -Name EnableCertPaddingCheck -Value 1

#CIS26175
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" -Name DisableExceptionChainValidation -Value 0

#CIS26176
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters -Name NodeType -Value 2

#CIS26177
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest -Name UseLogonCredential -Value 0

#CIS26178
#Enable Auto Login
#Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name AutoAdminLogon -Value 1
#Disable Auto Login
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name AutoAdminLogon -Value 0

#CIS26179
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters -Name DisableIPSourceRouting -Value 2

#CIS26180
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters -Name DisableIPSourceRouting -Value 2

#CIS26181
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RasMan\Parameters -Name DisableSavePassword -Value 1

#CIS26182
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters -Name EnableICMPRedirect -Value 0

#CIS26183
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters -Name KeepAliveTime -Value 300000

#CIS26184
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters -Name NoNameReleaseOnDemand -Value 1

#CIS26185
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters -Name PerformRouterDiscovery -Value 0

#CIS26186
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager" -Name SafeDllSearchMode -Value 1

#CIS26187
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name ScreenSaverGracePeriod -Value 5

#CIS26188
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters -Name TcpMaxDataRetransmissions -Value 3

#CIS26189
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters -Name TcpMaxDataRetransmissions -Value 3

#CIS26190
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Eventlog\Security -Name WarningLevel -Value 89

#CIS26191
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" -Name DoHPolicy -Value 2

#CIS26192
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" -Name EnableNetbios -Value 0

#CIS26193
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" -Name EnableMulticast -Value 0

#CIS26194
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System -Name EnableFontProviders -Value 0

#CIS26195
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation -Name AllowInsecureGuestAuth -Value 0

#CIS26196
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LLTD
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LLTD -Name EnableLLTDIO -Value 0

#CIS26197
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LLTD -Name EnableRspndr -Value 0

#CIS26198
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Peernet
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Peernet -Name Disabled -Value 1

#CIS26199
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Network Connections" -Name NC_AllowNetBridge_NLA -Value 0

#CIS26200
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Network Connections" -Name NC_ShowSharedAccessUI -Value 0

#CIS26201
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Network Connections" -Name NC_StdDomainUserSetLocation -Value 1

#CIS26202
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths -Name "\\*\NETLOGON" -Value "RequireMutualAuthentication=1, RequireIntegrity=1, RequirePrivacy=1"
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths -Name "\\*\SYSVOL" -Value "RequireMutualAuthentication=1, RequireIntegrity=1, RequirePrivacy=1"

#CIS26203
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters -Name DisabledComponents -Value 255

#CIS26204
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WCN\
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars -Name DisableFlashConfigRegistrar -Value 0
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars -Name DisableInBand802DOT11Registrar -Value 0
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars -Name DisableUPnPRegistrar -Value 0
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars -Name DisableWPDRegistrar -Value 0
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars -Name EnableRegistrars -Value 0

#CIS26205
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WCN\UI
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WCN\UI -Name DisableWcnUi -Value 1

#CIS26206
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy -Name fMinimizeConnections -Value 3

#CIS26207
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy -Name fBlockNonDomain -Value 1

#CIS26208
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config -Name AutoConnectAllowedOEM -Value 0

#CIS26209
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers" -Name RegisterSpoolerRemoteRpcEndPoint -Value 2

#CIS26210
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers" -Name RedirectionguardPolicy -Value 1

#CIS26211
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers" -Name RpcUseNamedPipeProtocol -Value 1

#CIS26212
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers" -Name RpcAuthentication -Value 0

#CIS26213
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers" -Name RpcProtocols -Value 7

#CIS26214
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers" -Name ForceKerberosForRpc -Value 1

#CIS26215
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers" -Name RpcTcpPort -Value 0

#CIS26216
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers"
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint" -Name RestrictDriverInstallationToAdministrators -Value 0

#CIS26217
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers" -Name CopyFilesPolicy -Value 1

#CIS26218
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint" -Name NoWarningNoElevationOnInstall -Value 0

#CIS26219
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint" -Name UpdatePromptSettings -Value 0

#CIS26220
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications -Name NoCloudApplicationNotification -Value 1

#CIS26221
New-Item -Path Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer
Set-ItemProperty -Path Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name HideRecommendedPersonalizedSites -Value 1

#CIS26222
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit -Name ProcessCreationIncludeCmdLine_Enabled -Value 1

#CIS26223
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\CredSSP
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\CredSSP\Parameters
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\CredSSP\Parameters -Name AllowEncryptionOracle -Value 0

#CIS26224
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation -Name AllowProtectedCreds -Value 1

#CIS26225
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard -Name EnableVirtualizationBasedSecurity -Value 1

#CIS26226
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard -Name RequirePlatformSecurityFeatures -Value 3

#CIS26227
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard -Name HypervisorEnforcedCodeIntegrity -Value 1

#CIS26228
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard -Name HVCIMATRequired -Value 1

#CIS26229
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard -Name LsaCfgFlags -Value 1

#CIS26230
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard -Name ConfigureKernelShadowStacksLaunch -Value 1

#CIS26231
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceIDs
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceIDs -Name 1 -Value ""

#CIS26232
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceIDs -Name 1 -Value "PCI\CC_0C0A"

#CIS26233
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceIDsRetroactive -Name 1 -Value ""

#CIS26234
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceClasses

#CIS26235
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions\DenyDeviceClasses

#CIS26236
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions -Name DenyDeviceClassesRetroactive

#CIS26237
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Device Metadata"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" -Name PreventDeviceMetadataFromNetwork -Value 1

#CIS26238
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies\EarlyLaunch
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies\EarlyLaunch -Name DriverLoadPolicy -Value 3

#CIS26239
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Group Policy"
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}" -Name NoBackgroundPolicy -Value 0

#CIS26240
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}" -Name NoGPOListChanges -Value 0

#CIS26241
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{827D319E-6EAC-11D2-A4EA-00C04F79F83A}"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{827D319E-6EAC-11D2-A4EA-00C04F79F83A}" -Name NoBackgroundPolicy -Value 0

#CIS26242
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{827D319E-6EAC-11D2-A4EA-00C04F79F83A}" -Name NoGPOListChanges -Value 0

#CIS26243
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System -Name EnableCdp -Value 0

#CIS26244
Remove-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name DisableBkGndGroupPolicy

#CIS26245
#Enable Microsoft Store
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name NoUseStoreOpenWith -Value 0
#Disable Microsoft Store
#Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name NoUseStoreOpenWith -Value 1

#CIS26246
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers" -Name DisableWebPnPDownload -Value 1

#CIS26247
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\TabletPC
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\TabletPC -Name PreventHandwritingDataSharing -Value 1

#CIS26248
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports -Name PreventHandwritingErrorReports -Value 1

#CIS26249
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Internet Connection Wizard"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Internet Connection Wizard" -Name ExitOnMSICW -Value 1

#CIS26250
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer -Name NoWebServices -Value 1

#CIS26251
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers" -Name DisableHTTPPrinting -Value 1

#CIS26252
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Registration Wizard Control"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Registration Wizard Control" -Name NoRegistration -Value 1

#CIS26253
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SearchCompanion
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SearchCompanion -Name DisableContentFileUpdates -Value 1

#CIS26254
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer -Name NoOnlinePrintsWizard -Value 1

#CIS26255
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer -Name NoPublishingWizard -Value 1

#CIS26256
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Messenger
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Messenger\Client
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Messenger\Client -Name CEIP -Value 2

#CIS26257
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows -Name CEIPEnable -Value 0

#CIS26258
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" -Name Disabled -Value 1

#CIS26259
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\kerberos
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\kerberos\parameters
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\kerberos\parameters -Name DevicePKInitBehavior -Value 0
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\kerberos\parameters -Name DevicePKInitEnabled -Value 1

#CIS26260
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Kernel DMA Protection"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Kernel DMA Protection" -Name DeviceEnumerationPolicy -Value 0

#CIS26261
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS -Name BackupDirectory -Value 2

#CIS26262
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS -Name PwdExpirationProtectionEnabled -Value 1

#CIS26263
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS -Name ADPasswordEncryptionEnabled -Value 1

#CIS26264
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS -Name PasswordComplexity -Value 4

#CIS26265
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS -Name PasswordLength -Value 15

#CIS26266
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS -Name PasswordAgeDays -Value 30

#CIS26267
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS -Name PostAuthenticationResetDelay -Value 8

#CIS26268
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\LAPS -Name PostAuthenticationActions -Value 3

#CIS26269
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System -Name AllowCustomSSPsAPs -Value 0

#CIS26270
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa -Name RunAsPPL -Value 1

#CIS26271
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Control Panel"
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Control Panel\International"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Control Panel\International" -Name BlockUserInputMethodsForSignIn -Value 1

#CIS26272
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System -Name BlockUserFromShowingAccountDetailsOnSignin -Value 1

#CIS26273
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System -Name DontDisplayNetworkSelectionUI -Value 1

#CIS26274
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System -Name DontEnumerateConnectedUsers -Value 1

#CIS26275
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System -Name EnumerateLocalUsers -Value 0

#CIS26276
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System -Name DisableLockScreenAppNotifications -Value 1

#CIS26277
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System -Name BlockDomainPicturePassword -Value 1

#CIS26278
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System -Name AllowDomainPINLogon -Value 0

#CIS26279
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System -Name AllowCrossDeviceClipboard -Value 0

#CIS26280
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System -Name UploadUserActivities -Value 0

#CIS26281
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9 -Name DCSettingIndex -Value 0

#CIS26282
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9 -Name ACSettingIndex -Value 0

#CIS26283
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab -Name DCSettingIndex -Value 0

#CIS26284
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab -Name ACSettingIndex -Value 0

#CIS26285
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51 -Name DCSettingIndex -Value 1

#CIS26286
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51 -Name ACSettingIndex -Value 1

#CIS26287
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name fAllowUnsolicited -Value 0

#CIS26288
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name fAllowToGetHelp -Value 0

#CIS26289
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Rpc"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Rpc" -Name EnableAuthEpResolution -Value 1

#CIS26290
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Rpc" -Name RestrictRemoteClients -Value 1

#CIS26291
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy -Name DisableQueryRemoteServer -Value 0

#CIS26292
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WDI
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" -Name ScenarioExecutionEnabled -Value 0

#CIS26293
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo -Name DisabledByGroupPolicy -Value 1

#CIS26294
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\W32Time
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\W32Time\TimeProviders
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\W32Time\TimeProviders\NtpClient
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\W32Time\TimeProviders\NtpClient -Name Enabled -Value 1

#CIS26295
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\W32Time\TimeProviders\NtpServer
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\W32Time\TimeProviders\NtpServer -Name Enabled -Value 0

#CIS26296
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\AppModel
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\AppModel\StateManager
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\AppModel\StateManager -Name AllowSharedLocalAppData -Value 0

#CIS26297
#Enable users to install apps from Microsoft Store
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Appx -Name BlockNonAdminUserInstall -Value 0
#Disable users to install apps from Microsoft Store
#Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Appx -Name BlockNonAdminUserInstall -Value 1

#CIS26298
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy -Name LetAppsActivateWithVoiceAboveLock -Value 2

#CIS26299
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name MSAOptional -Value 1

#CIS26300
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name BlockHostedAppAccessWinRT -Value 1

#CIS26301
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name NoAutoplayfornonVolume -Value 1

#CIS26302
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer -Name NoAutorun -Value 1

#CIS26303
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer -Name NoDriveTypeAutoRun -Value 255

#CIS26304
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Biometrics
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Biometrics\FacialFeatures
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Biometrics\FacialFeatures -Name EnhancedAntiSpoofing -Value 1

#CIS26305
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name FDVDiscoveryVolumeType -Value "<none>"

#CIS26306
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name FDVRecovery -Value 1

#CIS26307
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name FDVManageDRA -Value 1

#CIS26308
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name FDVRecoveryPassword -Value 1

#CIS26309
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name FDVRecoveryKey -Value 1

#CIS26310
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name FDVHideRecoveryPage -Value 1

#CIS26311
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name FDVActiveDirectoryBackup -Value 1

#CIS26312
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name FDVActiveDirectoryInfoToStore -Value 1

#CIS26313
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name FDVRequireActiveDirectoryBackup -Value 0

#CIS26314
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name FDVHardwareEncryption -Value 0

#CIS26315
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name FDVPassphrase -Value 0

#CIS26316
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name FDVAllowUserCert -Value 1

#CIS26317
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name FDVEnforceUserCert -Value 1

#CIS26318
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name UseEnhancedPin -Value 1

#CIS26319
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name OSAllowSecureBootForIntegrity -Value 1

#CIS26320
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name OSRecovery -Value 1

#CIS26321
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name OSManageDRA -Value 1

#CIS26322
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name OSRecoveryPassword -Value 1

#CIS26323
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name OSRecoveryKey -Value 0

#CIS26324
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name OSHideRecoveryPage -Value 1

#CIS26325
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name OSActiveDirectoryBackup -Value 1

#CIS26326
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name OSActiveDirectoryInfoToStore -Value 1

#CIS26327
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name OSRequireActiveDirectoryBackup -Value 1

#CIS26328
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name OSHardwareEncryption -Value 0

#CIS26329
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name OSPassphrase -Value 0

#CIS26330
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name UseAdvancedStartup -Value 1

#CIS26331
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name EnableBDEWithNoTPM -Value 0

#CIS26332
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name UseTPM -Value 0

#CIS26333
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name UseTPMPIN -Value 1

#CIS26334
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name UseTPMKey -Value 0

#CIS26335
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name UseTPMKeyPIN -Value 0

#CIS26336
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name RDVDiscoveryVolumeType -Value "<none>"

#CIS26337
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name RDVRecovery -Value 1

#CIS26338
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name RDVManageDRA -Value 1

#CIS26339
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name RDVRecoveryPassword -Value 0

#CIS26340
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name RDVRecoveryKey -Value 0

#CIS26341
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name RDVHideRecoveryPage -Value 1

#CIS26342
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name RDVActiveDirectoryBackup -Value 0

#CIS26343
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name RDVActiveDirectoryInfoToStore -Value 1

#CIS26344
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name RDVRequireActiveDirectoryBackup -Value 0

#CIS26345
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name RDVHardwareEncryption -Value 0

#CIS26346
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name RDVPassphrase -Value 0

#CIS26347
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name RDVAllowUserCert -Value 1

#CIS26348
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name RDVEnforceUserCert -Value 1

#CIS26349
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name RDVDenyWriteAccess -Value 1

#CIS26350
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name RDVDenyCrossOrg -Value 0

#CIS26351
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE -Name DisableExternalDMAUnderLock -Value 1

#CIS26352
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Camera
#Disable Access to Camera
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Camera -Name AllowCamera -Value 0
#Enable Access to Camera
#Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Camera -Name AllowCamera -Value 1

#CIS26353
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent -Name DisableConsumerAccountStateContent -Value 1

#CIS26354
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent -Name DisableCloudOptimizedContent -Value 1

#CIS26355
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent -Name DisableWindowsConsumerFeatures -Value 1

#CIS26356
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Connect
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Connect -Name RequirePinForPairing -Value 1

#CIS26357
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CredUI
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CredUI -Name DisablePasswordReveal -Value 1

#CIS26358
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI -Name EnumerateAdministrators -Value 0

#CIS26359
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System -Name NoLocalPasswordResetQuestions -Value 1

#CIS26360
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name AllowTelemetry -Value 0

#CIS26361
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name DisableEnterpriseAuthProxy -Value 1

#CIS26362
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name DisableOneSettingsDownloads -Value 1

#CIS26363
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name DoNotShowFeedbackNotifications -Value 1

#CIS26364
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name EnableOneSettingsAuditing -Value 1

#CIS26365
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name LimitDiagnosticLogCollection -Value 1

#CIS26366
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name LimitDumpCollection -Value 1

#CIS26367
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds -Name AllowBuildPreview -Value 0

#CIS26368
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization -Name DODownloadMode -Value 100

#CIS26369
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppInstaller
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppInstaller -Name EnableAppInstaller -Value 0

#CIS26370
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppInstaller -Name EnableExperimentalFeatures -Value 0

#CIS26371
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppInstaller -Name EnableHashOverride -Value 0

#CIS26372
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppInstaller -Name EnableMSAppInstallerProtocol -Value 0

#CIS26373
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application -Name Retention -Value 0

#CIS26374
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application -Name MaxSize -Value 32768

#CIS26375
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security -Name Retention -Value 0

#CIS26376
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security -Name MaxSize -Value 196608

#CIS26377
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Setup
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Setup -Name Retention -Value 0

#CIS26378
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Setup -Name MaxSize -Value 32768

#CIS26379
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\System
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\System -Name Retention -Value 0

#CIS26380
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\System -Name MaxSize -Value 32768

#CIS26381
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name DisableGraphRecentItems -Value 1

#CIS26382
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name NoDataExecutionPrevention -Value 0

#CIS26383
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name NoHeapTerminationOnCorruption -Value 0

#CIS26384
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer -Name PreXPSP2ShellProtocolBehavior -Value 0

#CIS26385
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors -Name DisableLocation -Value 1

#CIS26386
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Messaging
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Messaging -Name AllowMessageSync -Value 0

#CIS26387
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftAccount
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftAccount -Name DisableUserAuth -Value 1

#CIS26388
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Name LocalSettingOverrideSpynetReporting -Value 0

#CIS26389
Remove-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Name SpynetReporting

#CIS26390
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard"
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR" -Name ExploitGuard_ASR_Rules -Value 1

#CIS26391
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules" -Name 26190899-1602-49E8-8B27-eB1D0A1CE869 -Value 1
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules" -Name 3B576869-A4EC-4529-8536-B80A7769E899 -Value 1
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules" -Name 5BEB7EFE-FD9A-4556-801D-275E5FFC04CC -Value 1
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules" -Name 75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84 -Value 1
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules" -Name 7674BA52-37EB-4A4F-A9A1-F0F9A1619A2C -Value 1
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules" -Name 92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B -Value 1
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules" -Name 9E6C4E1F-7D60-472F-bA1A-A39EF669E4B2 -Value 1
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules" -Name B2B3F03D-6A65-4F7B-A9C7-1C7EF74A9BA4 -Value 1
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules" -Name BE9BA2D9-53EA-4CDC-84E5-9B1EEEE46550 -Value 1
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules" -Name D3E037E1-3EB8-44C8-A917-57927947596D -Value 1
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR\Rules" -Name D4F940AB-401B-4EFC-AADC-AD5F3C50688A -Value 1

#CIS26392
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection" -Name EnableNetworkProtection -Value 1

#CIS26393
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine" -Name EnableFileHashComputation -Value 1

#CIS26394
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name DisableIOAVProtection -Value 0

#CIS26395
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name DisableRealtimeMonitoring -Value 0

#CIS26396
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name DisableBehaviorMonitoring -Value 0

#CIS26397
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name DisableScriptScanning -Value 0

#CIS26398
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting" -Name DisableGenericRePorts -Value 1

#CIS26399
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Scan"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" -Name DisablePackedExeScanning -Value 0

#CIS26400
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" -Name DisableRemovableDriveScanning -Value 0

#CIS26401
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" -Name DisableEmailScanning -Value 0

#CIS26402
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" -Name PUAProtection -Value 1

#CIS26403
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" -Name DisableAntiSpyware -Value 0

#CIS26404
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\AppHVSI
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\AppHVSI -Name AuditApplicationGuard -Value 1

#CIS26405
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\AppHVSI -Name AllowCameraMicrophoneRedirection -Value 0

#CIS26406
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\AppHVSI -Name AllowPersistence -Value 0

#CIS26407
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\AppHVSI -Name SaveFilesToHost -Value 0

#CIS26408
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\AppHVSI -Name AppHVSIClipboardSettings -Value 1

#CIS26409
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\AppHVSI -Name AllowAppHVSI_ProviderSet -Value 1

#CIS26410
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" -Name EnableFeeds -Value 0

#CIS26411
#Disable MS One Drive File Sync
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive -Name DisableFileSyncNGSC -Value 1

#CIS26412
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PushToInstall
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PushToInstall -Name DisablePushToInstall -Value 1

#CIS26413
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\Client" -Name DisableCloudClipboardIntegration -Value 1

#CIS26414
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name DisablePasswordSaving -Value 1

#CIS26415
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name fDenyTSConnections -Value 1

#CIS26416
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name EnableUiaRedirection -Value 0

#CIS26417
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name fDisableCcm -Value 1

#CIS26418
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name fDisableCdm -Value 1

#CIS26419
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name fDisableLocationRedir -Value 1

#CIS26420
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name fDisableLPT -Value 1

#CIS26421
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name fDisablePNPRedir -Value 1

#CIS26422
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name fDisableWebAuthn -Value 1

#CIS26423
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name fPromptForPassword -Value 1

#CIS26424
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name fEncryptRPCTraffic -Value 1

#CIS26425
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name SecurityLayer -Value 2

#CIS26426
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name UserAuthentication -Value 1

#CIS26427
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name MinEncryptionLevel -Value 3

#CIS26428
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name MaxIdleTime -Value 900000

#CIS26429
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name MaxDisconnectionTime -Value 60000

#CIS26430
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name DeleteTempDirsOnExit -Value 1

#CIS26431
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer"
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds" -Name DisableEnclosureDownload -Value 1

#CIS26432
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name AllowCloudSearch -Value 0

#CIS26433
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name AllowCortana -Value 0

#CIS26434
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name AllowCortanaAboveLock -Value 0

#CIS26435
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name AllowIndexingEncryptedStoresOrItems -Value 0

#CIS26436
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name AllowSearchToUseLocation -Value 0

#CIS26437
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name EnableDynamicContentInWSB -Value 0

#CIS26438
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion"
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform"
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" -Name NoGenTicket -Value 1

#CIS26439
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore
#Enable Microsoft Store Apps
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore -Name DisableStoreApps -Value 0
#Disable Microsoft Store Apps
#Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore -Name DisableStoreApps -Value 1

#CIS26440
#Enable Microsoft Retail Store
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore" -Name RequirePrivateStoreOnly -Value 0
#Enable Microsoft Retail Store
#Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore" -Name RequirePrivateStoreOnly -Value 1

#CIS26441
#Enable automatic Microsoft Store app updates
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore -Name AutoDownload -Value 2
#Disable automatic Microsoft Store app updates
#Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore -Name AutoDownload -Value 4

#CIS26442
#Enable Microsoft Store OS upgrade prompts
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore -Name DisableOSUpgrade -Value 0
#Disable Microsoft Store OS upgrade prompts
#Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore -Name DisableOSUpgrade -Value 1

#CIS26443
#Enable Microsoft Store app
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore -Name RemoveWindowsStore -Value 0
#Disable Microsoft Store app
#Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore -Name RemoveWindowsStore -Value 1

#CIS26444
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Dsh
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Dsh -Name AllowNewsAndInterests -Value 0

#CIS26445
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WTDS
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components -Name CaptureThreatWindow -Value 1

#CIS26446
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components -Name NotifyMalicious -Value 1

#CIS26447
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components -Name NotifyPasswordReuse -Value 1

#CIS26448
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components -Name NotifyUnsafeApp -Value 1

#CIS26449
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WTDS\Components -Name ServiceEnabled -Value 1

#CIS26450
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System -Name EnableSmartScreen -Value 1
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System -Name ShellSmartScreenLevel -Value "Block"

#CIS26451
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR -Name AllowGameDVR -Value 0

#CIS26452
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR -Name EnableESSwithSupportedPeripherals -Value 1

#CIS26453
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace -Name AllowSuggestedAppsInWindowsInkWorkspace -Value 0

#CIS26454
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace -Name AllowWindowsInkWorkspace -Value 0

#CIS26455
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer -Name EnableUserControl -Value 0

Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer -Name EnableUserControl -Value 0

#CIS26456
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer -Name AlwaysInstallElevated -Value 0

#CIS26457
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer -Name SafeForScripting -Value 0

#CIS26458
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableMPR -Value 0

#CIS26459
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name DisableAutomaticRestartSignOn -Value 1

#CIS26460
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging -Name EnableScriptBlockLogging -Value 1

#CIS26461
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription -Name EnableTranscripting -Value 1

#CIS26462
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client -Name AllowBasic -Value 0

#CIS26463
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client -Name AllowUnencryptedTraffic -Value 0

#CIS26464
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client -Name AllowDigest -Value 0

#CIS26465
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service -Name AllowBasic -Value 0

#CIS26466
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service -Name AllowAutoConfig -Value 0

#CIS26467
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service -Name AllowUnencryptedTraffic -Value 0

#CIS26468
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service -Name DisableRunAs -Value 1

#CIS26469
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service\WinRS
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service\WinRS -Name AllowRemoteShellAccess -Value 0

#CIS26470
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Sandbox
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Sandbox -Name AllowClipboardRedirection -Value 0

#CIS26471
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Sandbox -Name AllowNetworking -Value 0

#CIS26472
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center"
New-Item -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\App and Browser protection"
#Prevent Users Changing Defender Browser settings
Set-ItemProperty -Path Registry::"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\App and Browser protection" -Name DisallowExploitProtectionOverride -Value 1

#CIS26473
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate
New-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU -Name NoAutoRebootWithLoggedOnUsers -Value 0

#CIS26474
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU -Name NoAutoUpdate -Value 0

#CIS26475
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU -Name ScheduledInstallDay -Value 0

#CIS26476
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate -Name AllowTemporaryEnterpriseFeatureControl -Value 0

#CIS26477
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate -Name SetDisablePauseUXAccess -Value 1

#CIS26478
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate -Name ManagePreviewBuildsPolicyValue -Value 1

#CIS26479
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate -Name DeferFeatureUpdates -Value 1
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate -Name DeferFeatureUpdatesPeriodInDays -Value 180

#CIS26480
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate -Name DeferQualityUpdates -Value 1
Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate -Name DeferQualityUpdatesPeriodInDays -Value 0

#CIS26481

Set-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate -Name AllowOptionalContent -Value 0


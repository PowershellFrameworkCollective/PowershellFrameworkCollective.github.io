---
title: configuration: Persistence: Location
---
# Persistence: Location
## Synopsis

The comprehensive lists of from where PSFramework looks for settings to import.

## Description

The PSFramework handles path management when loading and persistign configuration values.
Thanks to that, in most situations you do not need to explicitly pick one for yourself.

There are basically two elements of the configuration system that use managed paths:

 - [Automatic Import](basics.html)
 - [Module Cache](scenario-cache.html)

## Automatic Import
### Registry: Per User, default

The "per user, default" location is the default location on Windows for `Register-PSFConfig`.

| Path | HKCU:\SOFTWARE\Microsoft\WindowsPowerShell\PSFramework\Config\Default |
| Priority | 4 |

> Note: Registry locations are only available on Windows Computers.

### Registry: Per User, enforced

The "per user, enforced" location is similar to the "per user, default" location, except that after enforcing a setting, further attempts to change it will be ignored.
This allows a user to resist undesired configuration changes brought upon by other code and offers a way for administrators to enforce settings.

| Path | HKCU:\SOFTWARE\Microsoft\WindowsPowerShell\PSFramework\Config\Enforced |
| Priority | 2 |

> Note: Registry locations are only available on Windows Computers.

### Registry: Local Computer, default

The "local computer, default" location is the ideal location to apply sane default values by group policy.
It is superseeded by most other locations and does not enforce settings in any way.

| Path | HKLM:\SOFTWARE\Microsoft\WindowsPowerShell\PSFramework\Config\Default |
| Priority | 6 |

> Note: Registry locations are only available on Windows Computers.

### Registry: Local Computer, enforced

The "local computer, enforced" location is the big hammer in an admin's arsenal.
Using this location - which takes precedence over all other locations - it becomes possible to enforce settings for all users on a machine.
Later attempts to change a setting thus enforced will fail.

| Path | HKLM:\SOFTWARE\Microsoft\WindowsPowerShell\PSFramework\Config\Enforced |
| Priority | 1 |

> Note: Registry locations are only available on Windows Computers.

### File: Per User, local computer

The "File: per user, local computer" location is specific to the user and specific to the local computer.
As such, it should not be replicated to other machines.

| Path (Windows; PS Desktop) | $Env:LocalAppData\WindowsPowerShell\PSFramework\Config |
| Path (Windows; PS Core) | $Env:LocalAppData\PowerShell\PSFramework\Config |
| Path (non-Windows; Default) | $Env:XDG_CONFIG_HOME/PowerShell/PSFramework/ |
| Path (non-Windows; Alternative) | $HOME/.config/PowerShell/PSFramework/ |
| Priority | 3 |

### File: Per User, shared

The "File: per user, shared" location is specific to the user and should be shared among roamed profiles.
Using this is a good way in windows to have different settings between PS Core and PS Desktop.

| Path (Windows; PS Desktop) | $Env:AppData\WindowsPowerShell\PSFramework\Config |
| Path (Windows; PS Core) | $Env:AppData\PowerShell\PSFramework\Config |
| Path (non-Windows; Default) | $($Env:XDG_CONFIG_DIRS.Split("/")[0])/PowerShell/PSFramework/ |
| Path (non-Windows; Alternative) | $HOME/.local/share/PowerShell/PSFramework/ |
| Priority | 5 |

### File: Local Computer

The file-based local computer location is the lowest priority location among all locations.
Use this for simple default settings on a machine, especially on non-windows machines.

| Path (Windows; PS Desktop) | $Env:ProgramData\WindowsPowerShell\PSFramework\Config |
| Path (Windows; PS Core) | $Env:ProgramData\PowerShell\PSFramework\Config |
| Path (non-Windows; Default) | $($Env:XDG_CONFIG_DIRS.Split("/")[1])/PowerShell/PSFramework/ |
| Path (non-Windows; Alternative) | /etc/xdg/PowerShell/PSFramework/ |
| Priority | 7 |

## Module Cache

The [Module Cache feature](scenario-cache.html) uses the same file-based - but only the file-based - locations as the automatically imported configuration is.
The main difference is in the file name:
```
<modulename>.<version>.json
```
It respects the same priority as the automatically imported configuration settings.
Both name and version are provided by the module when calling `Import-PSFConfig` and `Export-PSFConfig` (Version defaults to 1).

## Notes
[Back to Configuration](https://psframework.org/documentation/documents/psframework/configuration.html)

| Version | 1.0 |
| Written on: | 2018-05-23 |
| Updated on: | 2018-06-02 |
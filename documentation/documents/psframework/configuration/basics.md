---
title: configuration: Basics
---
# Configuration Basics
## Synopsis

Elementary guide to configuration in PSFramework

## Description
### Configuration in action

To witness the effects of configuration, simply run the following command:
```powershell
Get-PSFConfig
```
As can be seen, the PSFramework already ships with quite a few settings.
There are many settings to discover - in fact, the ability to _do_ discover settings and options this way is one of the core benefits of this component.

To experience the effect, let's just observe what changing one of these settings can do.
First, run this command:
```powershell
Write-PSFMessage -Level Host -Message "Example message"
```
This should write a message similar to this:
```
[20:10:03][<ScriptBlock>] Example message
```
The way messages are being displayed is driven by configuration.
For example, the timestamp can be controlled by the following setting:
```
Get-PSFConfig -FullName psframework.message.style.timestamp
```
So let's disable it by updating the display style:
```powershell
Set-PSFConfig -FullName psframework.message.style.timestamp -Value $false
```
Now again, write a message:
```powershell
Write-PSFMessage -Level Host -Message "Example message"
```
And it will no longer display the timestamp:
```
[<ScriptBlock>] Example message
```
These settings are stored in the current process - start a new console, and it will again have the default value.

### Persistent settings

If you want to have it rememer a setting, there are multiple ways to go about it.
The way best known to an administrator would be to place a `Set-PSFConfig` call in the PowerShell profile.
This would in fact work ... but require you to import the `PSFramework` module each time the console runs, which may not be convenient.

There are a few places you can store configuration settings that will be automatically imported on module import, but not require you to import the module everty time you use PowerShell.

Specifically, there are registry settings - per user and per machine - that can be used to persist settings.
There also are paths from which it will automatically import configuration files.

Fortunately, you do not need to remember [where those are stored](persistence-location.html), as there is a command to register a setting:
```powershell
Register-PSFConfig
```
Without specifying the scope, it will write the setting to your current user default settings in registry node.
Let's try it in action:
```powershell
Set-PSFConfig -FullName psframework.message.style.timestamp -Value $false -PassThru | Register-PSFConfig
```
This is all it takes to make it remember.
If you now start a new PowerShell console and run `Write-PSFMessage` again, it will not display the timestamp in that process either.

If at a later time you reconsider and would like to again see the timestamp displayed, you can either:

 - Change the setting and register it again
 - Remove the setting from where it was persisted

There is a command to unregister settings from your system:
```powershell
Unregister-PSFConfig -FullName psframework.message.style.timestamp
```
After running this, new consoles will again use the default value, as the persisted value has been removed.

> Note: It will not change the current setting, you will need to manually change the setting in the current process.

The ability to import settings from registry makes it possible to deploy them via group policy or SCCM or similar mechanisms.

### A few more things to be aware of

 - Configuration is not scope or runspace aware. Settings are always the same, no matter in what scope from what runspace accessed. As such, they are not designed as variable replacement.
 - You can define your own [settings for your own module](scenario-module.html)
 - It is possible to [validate new values on settings](validation.html)
 - It is possible to [subscribe a scriptblock event to setting changes](handler.html)

## Notes
[Back to Configuration](https://psframework.org/documentation/documents/psframework/configuration.html)

| Version | 1.0 |
| Written on: | 2018-05-23 |
| Updated on: | 2018-05-29 |

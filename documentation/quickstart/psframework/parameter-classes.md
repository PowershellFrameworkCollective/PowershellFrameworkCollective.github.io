# Getting started with Parameter Classes

Parameter Classes enable developers to be more permissive in what input they accept and does all the input interpretation for the developer.

# Implementing configuration

In order to set configuration up, you need to _declare_ the configuration setting in a script that is run during import (in case of module) or at the top of the scriptfile (in case of a script).

```powershell
Set-PSFConfig -FullName "MyModule.Mail.Server" -Value "mail.mydomain.com" -Validation string -Initialize -Description "Mail server used by the module to send alerts."
```

 - `FullName` contains the module-qualified name of the setting. Each name must be unique.
 - `Value` is the initial value of the setting.
 - `Validation` is the test input is run through before accepting a setting change. It supports the common value types by default (e.g. string, bool, integer)
 - `Initialize` always use this when declaring a setting.
 - `Description` allows you to describe whsat the setting does. This makes it easier to remember what it does and helps the user understand settings.

Later in the script / module we will want to use this setting. In the specific example, when sending an email obviously:

```powershell
Send-MailMessage -SmtpServer (Get-PSFConfigValue -FullName 'MyModule.Mail.Server' -Fallback 'mail.mydomain.com') # ...
```

# Additional Information

 - All settings can be set by registry, both as default or mandatory per user or per machine.
 - Settings can be persisted by using the function `Register-PSFConfig`, allowing a user to flexibly customize and keep settings.
 - You can add a scriptblock that is executed when the setting is changed (That ScriptBlock is being ignored when using `-Initialize`)
 - You can add your own custom validation rules

# Further reading

```
Content pending
```
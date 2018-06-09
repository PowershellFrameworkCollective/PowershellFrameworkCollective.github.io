---
title: configuration: Scenario: Module
---
# Scenario: Module
## Synopsis

A strategic guide to implementing configuration in a module.

## Description

Modules can use configuration to reduce the load off parameterization.
To deploy default values.
To avoid hard-coding information into the source code.
And to offer users a powershell equivalent of an application's options menu.

This is where the `PSFramework` Configuration System comes in.

### Key Benefits

 - Change static configuration by group policy, rather than needing to update the codebase everywhere.
 - Offer user-friendly options, similar to an application's options menu.
 - Reduce need for parameters handling edge-cases, reducing command complexity.
 - Seamlessly integrate with configuration options in [CI/CD scenarios](scenario-ci-cd.html)

## Implementation
### Roadmap

The implementation consists of a few steps:

 - Define / [initialize](initialize.html) the configuration settings
 - Use the settings within the code
 - Have users interact with them

### Defining the configuration settings

As part of the import sequence of your module, you would somewhere place the configuration definition.
In case you need [custom validation rules](validation.html), be sure to define them before the import sequence hits the settings using them.

```powershell
Set-PSFConfig -Module MyModule -Name Foo.Bar -Value 42 -Initialize -Validation integer -Description "Setting that does a few things"
Set-PSFConfig -Module MyModule -Name Foo.Foo -Value 23 -Initialize -Validation integer -Description "Setting that does a few other things"
Set-PSFConfig -Module MyModule -Name Foo.Timeout -Value (New-TimeSpan -Minutes 15) -Initialize -Validation timespan -Description "Setting that contains a timespan. Used to determine the timeout of foo."
Set-PSFConfig -Module MyModule -Name Foo.ExportPath -Value "$($env:APPDATA)\MyModule\Export" -Initialize -Validation string -Description "The path where foo gets exported to."
Set-PSFConfig -Module MyModule -Name Bar.Enabled -Value $true -Initialize -Validation bool -Description "Whether bar is enabled. Bar is used to override foo."
```

### Use the settings within the code

With the settings defined, we can easily access their values within the code by running `Get-PSFConfigValue`.
It also supports a default value (in case of empty values) or offers to throw an exception if no value is returned (by default, it will silently return nothing in this case).

```powershell
# Just get the value
Get-PSFConfigValue -FullName MyModule.Foo.Bar

# If you want a just-in-case local fallback value
Get-PSFConfigValue -FullName MyModule.Foo.Foo -Fallback 22

# When an empty value is worth throwing an exception
```

### Have users interact with the settings

With the preceding two steps, the module is ready as far as configuration is concerned.
Users can now interact with it, change settings as prefered.

```powershell
# List settings
Get-PSFConfig -Module MyModule

# Change settings
Set-PSFConfig -Module MyModule -Name Foo.Foo -Value 21

# Try changing settings to an illegal value and fail
Set-PSFConfig -Module MyModule -Name Foo.Foo -Value foo

# Persist setting so it will maintain its value on later powershell sessions
Set-PSFConfig -Module MyModule -Name Foo.ExportPath -Value C:\Export -PassThru | Register-PSFConfig
```

### Resources & Further reading

 - The [initialization](initialize.html) process is critically important to a module using configuration.
Just knowing to use `-Initialize` when defining a setting is enough to get by, the linked article explains the background.
 - The [basics](basics.html) and [persistence basics](persistence-basics.html) cover the user perspective in more detail.
 - The system can [execute events](handler.html) when settings are changed.
 - Details of [validation](validation.html) are covered by its dedicated page.
 - You can [hide settings](in-hidin.html) from the user if you really want to.
 - You can use the `-SimpleExport` switch when defining settings, if you don't really care about your object's data type.
This affects how settings are written to file, making them easier to read by eye.
Details are covered by the (somewhat technical) [serialization guide](persistence-serialization.html)

## Notes
[Back to Configuration](https://psframework.org/documentation/documents/psframework/configuration.html)

| Version | 1.0 |
| Written on: | 2018-05-23 |
| Updated on: | 2018-06-08 |
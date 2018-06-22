---
title: configuration: Persistence: Manual Export & Import
---
# Persistence: Manual Export & Import
## Synopsis

Describes how to handle importing and exporting to a specified path / weblink.

## Description

The functionality to export to an explicitly specified path and importing configuration from that path, a weblink or straight configuration json is designed for two scenarios:

 - [Continuous Integration / Continuous Deployment](scenario-ci-cd.html) situations, where configuration is part of your code and does not lend itself well to placement in automatic import locations
 - Transfering configuration settings to machines you cannot remote into.

## Exporting: Export-PSFConfig
### Selecting what to export

There are several ways to pick what to export:

 - By the full, module-qualified name
 - By seperate module and name filters
 - By providing the configuration objects to export

Examples:
```powershell
# Full Name filter
Export-PSFConfig -FullName MyModule.Path.* -OutPath C:\temp\demo.json

# Module and name filter
Export-PSFConfig -Module MyModule -Name Path.* -OutPath C:\temp\demo.json

# Configuration Objects
Get-PSFConfig -Module MyModule -Force | ? Hidden | Export-PSFConfig -OutPath C:\temp\demo.json
```

### Changed settings

When exporting configuration items, it might be convenient to avoid exporting settings that haven't been changed.
This can be done by adding the `-SkipUnchanged` switch:

```powershell
# Export all settings from module MyModule that were changed
Export-PSFConfig -Module MyModule -SkipUnchanged` -OutPath C:\temp\demo.json
```

> Unchanged configuration items
>
> The configuration system considers settings to be unchanged, if it wasn't changed after initializing a setting.
> Explicitly setting the same value as the default value still constitutes a change.
> Importing settings are also a change.
> Pre-Existing settings that were reapplied after initialization also are changes.
> Attempts to change a setting that fail either validation or handler do not constitute changes.

### Path to export to

The destination path is bound to the mandatory `-OutPath` parameter.
It needs to point to the full name of the destination file, the folder must exist, the file need not exist and will be overwritten if it does.
The extension chosen - if any - does not matter, the output data stored in it will be a json string.

## Importing: Import-PSFConfig
### Basic import

Importing a configuration item (from file, weblink or raw string) is uncomplicated, as all that is really needed is the parameter `-Path`.

 - In files, the extension matters not yet again, but the file must exist for obvious reasons.
 - A weblink needs to be reachable and provide valid UTF8 Json as sole content.
 - Raw json string can be piped to the command, but needs to be legal json as a single item, not a collection of strings.

```powershell
# Import from path
Import-PSFConfig -Path C:\temp\demo.json

# Import from site
Import-PSFConfig -Path "https://website.example/config/prod.json"

# Import raw data
$configJsonString | Import-PSFConfig
```

Imported settings still will be individually validated (if the setting updated contains a validation) and handler events will individually fire.
A failed validation or handler event however will not interrupt the import of other settings.

### Taking a peek

As it may be of interest in some cases to merely peek at the content of a file, rather than immediately applying settings, `Import-PSFConfig` provides an option to do so.
The `-Peek` parameter will process the configuration file as it normally would be, but rather than applying the changes will merely return the parsed settings.
This does not run validation or handler events however, so some settings may still fail in reality.

```powershell
Import-PSFConfig -Path C:\temp\demo.json -Peek
```

### Filtering

Settings to import can be filtered by their full name.
The `-IncludeFilter` and `-ExcludeFilter` parameters ensure that it is granularly possible to target the setting to import.
Both are wildcard parameters, that support multiple values to be specified:

 - If _any_ include filters are specified, only settings whose name is similar to at least _one_ filter will be imported.
 - If an exclude filter is specified, any setting with a name similar to one or more filter strings will be ignored.
This overrides include filters.

```powershell
Import-PSFConfig -Path C:\temp\demo.json -IncludeFilter MyModule.* -ExcludeFilter "*.Path.*", "*.Test.*"
<#
This will import all settings from demo.json, so long as their names ...
- start with "MyModule.*"
- Do not contain ".Path."
- Do not contain ".Test."
#>
```

## Notes
[Back to Configuration](https://psframework.org/documentation/documents/psframework/configuration.html)

| Version | 1.0 |
| Written on: | 2018-05-23 |
| Updated on: | 2018-06-05 |

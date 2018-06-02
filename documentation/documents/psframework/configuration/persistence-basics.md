---
title: configuration: Persistence: Basics
---
# Persistence: Basics
## Synopsis

Covers the basics of how configuration settings can be persisted.

## The Three Types Of Persistence

Settings can be stored in three kinds of locations:

 - Settings that will be automatically imported when loading the `PSFramework` module for the first time.
These can be stored in both registry or file, can be per user or computer-wide.
 - Settings that are explicitly read and written by a module, but stored in a specific path.
 - You can manually pick a location to export to/import from.

## Working with automatic import/export
### Simply remember a setting

As a user, you can persist any setting on the fly by using the `Register-PSFConfig` command:
```powershell
Set-PSFConfig psframework.message.style.breadcrumbs $true -PassThru | Register-PSFConfig
```
This will make the configuration system remember the setting by writing it to the default per-user location.
It will then be loaded automatically each time the PSFramework module is imported.

### Forgetting a setting

If you want to delete a persisted setting - so that it will revert to the default value - use the `Unregister-PSFConfig` command:
```powershell
Unregister-PSFConfig -FullName myscript.target
```
This will _not_ change the setting in the current session, but on new session, default values will again apply.
(You can of course follow this up by running `Set-PSFConfig` to explicitly apply the default value for the current session)

In order to forget all settings for a module - effectively returning it to factory default - run the command like this:
```powershell
Unregister-PSFConfig -Module MyModule
```

### The scopes

Automatic persistence can be applied in 7 different locations:
```
FileSystem, FileUserLocal, FileUserShared, SystemDefault, SystemMandatory, UserDefault, UserMandatory
´´´
Many configuration commands that deal with persistence have a `-Scope` parameter.
This parameter exists to target which of these locations to work with.
For full documentation on the paths used for this, see the [guide on persistence locations](persistence-location.html).

## Explicit module settings

Modules have the option to use a dedicated data store, by using the `Import-PSFConfig` and `Export-PSFConfig` commands like this:
```powershell
# Load from file for module 'MyModule'
Import-PSFConfig -ModuleName MyModule

# Write to file for module 'MyModule'
Export-PSFConfig -ModuleName MyModule
```
The path is automatically managed for the commands, based on modulename.
This is designed to allow modules to use this system for persistent caches.

For more information on this, see either the technical [guide to module cache](persistence-module-cache.html) or the [scenario tutorial on configuration as cache](scenario-cache.html).

## Writing to / Reading from file

Importing settings from file (or writing them to file) is reasonably simple using the same `Import-PSFConfig` and `Export-PSFConfig` commands.
```powershell
# Load from specified file
Import-PSFConfig -Path "C:\temp\example.json"

# Write to specified file
Get-PSFConfig -Module MyModule -Name "*Message*" | Export-PSFConfig -Path "C:\temp\example.json"
```
For more information on this, see either the technical [guide to manual export and import](persistence-manual-export-import.html) or the [scenario guide to CI/CD configuration](scenario-ci-cd.html).

## Notes
[Back to Configuration](https://psframework.org/documentation/documents/psframework/configuration.html)

| Version | 1.0 |
| Written on: | 2018-05-23 |
| Updated on: | 2018-06-02 |
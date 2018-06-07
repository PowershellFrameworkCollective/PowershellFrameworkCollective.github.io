---
title: configuration: Persistence: Module Cache
---
# Persistence: Module Cache
## Synopsis

Shows how to use the configuration system as cache.

## Description

The configuration system can also be used to implement a cache that persists across sessions.
For example, a module could use this to persist the list of servers connected to, in order to provide tab completion to the user in future sessions.

Since this mechanism doesn't respect user settings that were stored before the import - unless enforced by policy - these settings are _not_ designed for user interference in most instances.
Consider declaring the relevant configuration items as [hidden](in-hiding.html).

## Flagging for Module Import/Export

Configuration settings do not automatically fall under the auspices of this mechanism.
In order to register a setting for it, `Set-PSFConfig` must be called with the `-ModuleExport` switch set.

Example:
```powershell
Set-PSFConfig -Module MyModule -Name Servers -Value @() -Initialize -Hidden -ModuleExport -Description "Stores the list of servers connected to"
```

This allows both the cache functionality and regular configuration to coexist side-by-side.

## Persisting Cache

In order to persist the currently stored settings, simply use `Export-PSFConfig` with the `-ModuleName` parameter:

```powershell
Export-PSFConfig -ModuleName MyModule
```

### Unchanged Values

This will _not_ persist settings that have not been changed.
So if you don't change the default values, there will be no persistence for that setting.

Any effect that tries to apply a value without using the `-Initialize` parameter on `Set-PSFCOnfig` and does not fail [validation](validation.html) or [event handlers](handler.html) constitutes a change.

### Scope

By default, the settings will be persisted in the [File: Per User, shared](persistence-location.html) location.
Using the `-Scope` parameter you can pick the location to use.
Non-file locations will be ignored.

## Importing Cache

Importing the cache again is as simple as this:

```powershell
Import-PSFConfig -ModuleName MyModule
```

By default, it will look in all [file locations](persistence-location.html), however you can use the `-Scope` parameter to override this as desired.

## Other Details & Design considerations
### Version

Both import and export commands also include a `-ModuleVersion` parameter.
This is a numeric parameter and defaults to `1`.
Only exported cache settings of the specified version will be imported.
All exported settings will be written to a version-specific file.

This allows discarding / ignoring cache entries from older module version.
Use it if a breaking change would render the old cache invalid.

### Runspaces

The cache is - same as the rest of the configuration system - unaware of runspaces or scopes.
This gives parallelism a few headaches, since settings are not designed to be threadsafe (automatic value changes outside of [initialization](initialize.html) are not desired and [initialization](initialize.html) handles threadsafety).
All changes to a setting that is part of the cache should be _immediately_ followed up with an `Export-PSFConfig` call,
in order to minimize the risk of lost settings when in another runspace your module calls `Import-PSFConfig -ModuleName MyModule`

To further minimize the risk, only call `Import-PSFConfig` as part of your module's import sequence.

### The -ModuleName parameter

Inspecting the `Export-PSFConfig` command, you can see it has both `-Module` and `-ModuleName` parameters.
This has been source of some confusion and as developer I'd like to apologize for this.

The command and its features evolved over some not insignificant time, and support for this caching mechanism was added later.
At that point I needed a new parameter pointing at a module's name, but wouldn't tolerate a breaking change.

This lead to the current naming mess :(

## Notes
[Back to Configuration](https://psframework.org/documentation/documents/psframework/configuration.html)

| Version | 1.0 |
| Written on: | 2018-05-23 |
| Updated on: | 2018-06-06 |
---
title: configuration: Persistence: Purge
---
# Persistence: Purge
## Synopsis

Shows how to get rid of persisted settings.

## Description

Having settings that are automatically applied each time is all nice and dandy.
Until you want to get rid of them, that is.

Diggig through the registry and file system yourself isn't exactly convenient though.
Thus the command `Unregister-PSFConfig` was born:

```powershell
# Remove a single setting
Unregister-PSFConfig -FullName MyModule.Smtp.Server

# Clear all settings of the module
Unregister-PSFConfig -Module MyModule
```

> Note: This does not change settings in the current session. It merely prevents future sessions from receiving these sessions.

## Scope

By default, the user's registry node is targeted. Using the `-Scope` parameter, any (or all) other [locations](persistence-locations.html) can be targeted.

## Notes
[Back to Configuration](https://psframework.org/documentation/documents/psframework/configuration.html)

| Version | 1.0 |
| Written on: | 2018-05-23 |
| Updated on: | 2018-06-06 |
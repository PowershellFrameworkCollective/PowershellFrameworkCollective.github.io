---
title: configuration: Persistence: Serialization
---
# Persistence: Serialization
## Synopsis

Describes the serialization methods used by the configuration system.

## Description

The `PSFramework` supports a set of different serialization methods:

 - Predefined serialization paths (preimplemented, specific to a object type)
 - PowerShell Clixml Serialization
 - Json-based serialization

Each of these methods come with their advantages and disadvantages.
Predefined serialization paths are best from a performance and storage perspective, but hardcoding paths for each type is unsustainable.
PowerShell CLixml serialization can serialize anything, but even compressed will it take a lot of space and cannot be manually inspected and edited.
Json-based serialization is reasonably fast and the data is easy to read and edit in file.
On the other hand will it not maintain type fidelity.

## Switching modes

By default, all settings will either use predefined serialization (if available) or Clixml based serialization.
You can opt into Json based serialization when [initializing](initialize.html) the setting by using the `-SimpleExport` parameter on `Set-PSFConfig`:

```powershell
Set-PSFConfig -Module MyModule -Name Answer -Value 42 -Initialize -SimpleExport
```

> Keep in mind that you may lose some information and utility using Json.

> This only affects file-based exports. For compatibility reasons registry-based persistence will always use the default serialization.

## The Json rules

There are a few simple conditions to using Json for export/import:

 - Incorrect json will fail to import. Test your manual edits.
 - The structure of settings within the file are assumed to be as specified. Additional properties on objects are legal and will be ignored.
 - Any setting set to `-SimpleExport` will serialize its data to file as json, even if it was a simple type that could have used a predefined path.

## Clixml serialization and import sequence

When serializing an object it will literally use the default method powershell provides of doing so.
Same for deserialization.
This presented some issues when considering, that automatic configuration import happens as PSFramework is being imported, not the depending module.
A module might register custom serialization events for its types, which needsd to be done before the object is actually deserialized, in order for deserialization to return the true object.

To handle this, the PSFramework defers deserialization of values serialized using Clixml serialization until [initialized](initialize.html).
Instead the value will be stored in its serialized state.
This means that whatever resources the module offers to handle object serialization/deserialization needs to be present _before_ initializing the configuration!

## Notes
[Back to Configuration](https://psframework.org/documentation/documents/psframework/configuration.html)

| Version | 1.0 |
| Written on: | 2018-05-23 |
| Updated on: | 2018-06-07 |

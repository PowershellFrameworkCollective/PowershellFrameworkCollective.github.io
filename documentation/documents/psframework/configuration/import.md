---
title: configuration: Import
---
# Configuration Import
## Synopsis

Describes how configuration values are being imported.

## Description
### Automatic Import

When importing the `PSFramework` - not the configuration defining module - it will automatically import persisted configuration settings:
 
 - From the HKCU registry node
 - From the HKLM registry node
 - From AppData (as a Json file)
 - From LocalAppData (as a Json file)
 - From ProgramData (as a Json file)

The specific order of precedence in ascending order of precedence:

 1. Configuration File: ProgramData
 2. Registry: HKLM (Default Value)
 3. Configuration File: AppData
 4. Configuration File: LocalAppData
 5. Registry: HKCU (Default Value)
 6. Registry: HKCU (Enforced Value)
 7. Registry: HKLM (Enforced Value)

This means a setting defined in the configuration file in LocalAppData will take precedence over a setting
defined in the configuration file in AppData, but be superceded by a default value specified in HKCU.

For the specific locations used, refer to the [persistence location documentation](persistence-location.html).
Also note that on Linux and MacOS, all registry locations are unavailable, as these platforms do not support registry data.

### Other means to import configuration.

 - When using the configuration system as a cache, module specific settings can be imported from file at the time the module is imported.
This concept is more fully described in the ["Scenario: Cache"](scenario-cache.html) guide.
The full mechanic is descibed on the ["Persistence: Module Cache"](persistence-module-cache) page.
 - It is possible to manually export and import to file. This is covered by the [guide for manual export & import](persistence-manual-export-import).

## Notes
[Back to Configuration](https://psframework.org/documentation/documents/psframework/configuration.html)

| Version | 1.0 |
| Written on: | 2018-05-23 |
| Updated on: | 2018-05-31 |

---
title: configuration: Initialize
---
# Configuration Initialization
## Synopsis

Explains the process of configuration settings initialization / declaration.

## Description
### TL;WR

Initialization is what happens when you run `Set-PSFConfig` with the `-Initialize` parameter.

This is the basic declaration / definition of a configuration and should be always be done when declaring a setting within a module.

### Background

When designing a system that manages data outside of the runspace/scope system of PowerShell, a few issues would need handling:

 - Users might change settings before the module is loaded (especially by policy)
 - The module might be imported multiple times (in different runspaces or repeatedly in the same)
 - Removing a module will not remove the settings
 - Additional logic would need to execute correctly and consistently

Making sure this is all correctly handled is what the initialization process is all about.

### Once only

The initialization process happens once only for any given setting within a process.
If a `Set-PSFConfig` call with `-Initialize` set is executed, if the setting had already been intiialized, it will terminate without doing anything.

This is true across all runspaces of a process. Removing a module using `Remove-Module` does not affect initialization status of its settings.

### Default values and Validation / Handler

The configuration system supports [input validation](validation.html) to ensure specified values are legal for the setting.
It also supports triggering events when the value is set through [change handlers](handler.html).

Values specified in the same call as the `-Initialize` call are _not_ validated and no handler will be executed!

### Previous values

If the setting already exists before initialization is executed (for example when set by policy or persisted by the user), the following steps are executed:

 - The previous value is stored
 - A new setting is created and configured as defined by the `-Initialize`-qualified `Set-PSFConfig` call.
 - Another `Set-PSFConfig` call is executed with the previous value. This is subject to validation and handler events.

By using this mechanism, even if the setting already existed, handlers are properly executed and compliance is properly checked.

Any other previous settings - such as an already existing validation, handler or description value - are discarded, only the raw value will be persisted across initialization.

### Type Stuff: Value Deserialization

When persisting complex objects, they are not fully deserialized before they are intialized.
This is more fully described in the (very technical) [Guide to Serialization in the Configuration System](persistence-serialization.html).
All persisted values that were not fully deserialized will be deserialized on initialization.

The important piece to remember here is that you need to make sure all your module's type processing is done by the time you initialize the configuration.

## Notes
[Back to Configuration](https://psframework.org/documentation/documents/psframework/configuration.html)

| Version | 1.0 |
| Written on: | 2018-05-23 |
| Updated on: | 2018-05-31 |

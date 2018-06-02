---
title: configuration: Handler
---
# Using Handler Events
## Synopsis

The handler system allows reacting to changes in a setting.

## Description

Settings are meaningless without seeing them used.
Generally, this is done by simply reading the value using `Get-PSFConfigValue`.
However, sometimes it may be more valuable to be able to react to changed settings, for example by copying the new value to somewhere else, to kill old connections or establish new ones.

This is where the handler system comes in. It allows you to specify a scriptblock that gets executed after [validation](validation.html) succeeded.

Example implementation:
```powershell
Set-PSFConfig -Module MyModule -Name Test.Setting -Value "Foo" -Handler { Write-PSFMessage -Level Host -Message "Changed setting to $($args[0])" }
```
In this example, it will execute:
```
{ Write-PSFMessage -Level Host -Message "Changed setting to $($args[0])" }
```
When the setting is changed.
So, let's go and change the setting:
```powershell
Set-PSFConfig -Module MyModule -Name Test.Setting -Value "Bar"
```
And it should print something like this:
```
[08:07:50][<Unknown>] Changed setting to Bar
```
You can register any kind of complexity-laden scriptblocks instead.
Access the new value by accessing the `$args[0]` variable.

## Implementation Notes

### Order of execution

The actual setting is changed _after_ running the handler scriptblock, so you can use `Get-PSFConfigValue` to access the previous value.

An exception thrown during the handler event will _stop_ the command and prevent value changes.
Exceptions thrown will be logged to the logging system and can be retrieved using `Get-PSFMessage -Errors`.
Raw exceptions will be passed through (and can be handled using try/catch), by setting `-EnableException` on the `Set-PSFConfig` call.

### Event Scope

The handler event is run in the scope of the PSFramework, not the defining module.
Keep this in mind, as you will not have direct access to your module's variables or interna.
You _do_ have access to global variables though.

You can execute some of your code within the handler in your module by invoking a scriptblock in its scope.
This can done like this:
```powershell
$module = Get-Module mymodule
& $module {
    Invoke-InternalCommand
	# Code running in the scope of module mymodule
}
```
If you _do_ use this, keep in mind, that the module may not be available at all:

 - The user might have removed it using `Remove-Module` (configuration settings will not be removed when the module is)
 - The module might have been imported in a different runspace (configuration items are available - and the same - in _all_ runspaces).

### Runspaces & Handlers

Given the nature of the Event Scope, it is also clear that the code will execute in the runspace, in which `Set-PSFConfig` is executed.
If your module is imported in multiple runspaces, it will not execute the handler in other runspaces.

If the handler affects runspace local resources, this might leave different runspaces in an inconsistent state.

The `PSFramework` module also offers tools to synchronize data between runspaces, for example using the `Get-PSFDynamicContentObject` and `Set-PSFDynamicContentObject` commands.
 
## Notes
[Back to Configuration](https://psframework.org/documentation/documents/psframework/configuration.html)

| Version | 1.1 |
| Written on: | 2018-05-23 |
| Updated on: | 2018-06-01 |
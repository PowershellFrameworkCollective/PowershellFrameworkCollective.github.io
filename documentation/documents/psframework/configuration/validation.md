---
title: configuration: Validation
---
# Configuration Validation
## Synopsis

Input to configuration settings can be validated, in order to ensure, it's legit input.

## Introduction

In the PSFramework configuration system, you can use validation scriptblocks to validate input.

It has two core purposes:

 - Ensure the input is legit
 - Ensure the input is of the proper type/format

These scriptblocks are registered by name and are then assigned to a setting when it is being defined using `Set-PSFConfig`.

## Validation in action

Out of the box, validations for most common data types already exist. Example of assigning validation:
```powershell
$paramSetPSFConfig = @{
	Module	     = 'BeerFactory'
	Name		 = 'Fridge.Size'
	Value	     = 10
	Initialize   = $true
	Validation   = 'integer'
	Description  = "The maximum capacity of the fridge"
}

Set-PSFConfig @paramSetPSFConfig
```
In this example, the setting `BeerFactory.Fridge.Size` has had the validation set to `integer`, which makes sure any
value specified is a valid integer.

It can now be updated:
```powershell
Set-PSFConfig -FullName beerfactory.fridge.size -Value 12
```
This is also legal:
```powershell
Set-PSFConfig -FullName beerfactory.fridge.size -Value "13"
```
In which case it will now validate `"13"` as legal ... and store it as an integer, not a string!
This however will fail:
```powershell
Set-PSFConfig -FullName beerfactory.fridge.size -Value "foo"
```
as foo is not a legal integer.

## Available validations

Available validations can be listed through tab completion on `Set-PSFConfig`.
If those don't cover your needs, you can define your own validation scriptblocks (the details of how you will find below).

If you want to check out the details on the validation scriptblocks, there isn't really a PowerShell command to retrieve them.
During runtime there is really no need for that, so it wasn't provided.
You _can_ retrieve the hashtable containing the validations however by running this less-than-userfriendly line:
```powershell
# List all
[PSFramework.Configuration.ConfigurationHost]::Validation

# Get Details on integer:
[PSFramework.Configuration.ConfigurationHost]::Validation["integer"]
```
When assigning validation to a configuration setting, the validation scriptblock is being _copied_ to the setting.
Updating the validation will have no effect on the settings that have been defined earlier.
This has been done to avoid consequences on validation naming conflicts between modules.

## Defining Custom Validation

You can register a new configuration validation by using the following command:
```
Register-PSFConfigValidation -Name "MyModule.Name" -ScriptBlock $scriptBlock
```

### Naming

In order to avoid conflicts on validation naming, please prefix your validation name by either your full
module name - as shown in the example above - or by using the command prefix the module uses.

### The rules

When defining a validation scriptblock, there are only a few rules to consider:

 - The scriptblock _must not_ throw an exception, no matter what.
 - The scriptblock receives a single parameter (the value to validate)
 - The scriptblock must return an object - pscustomobject is fine - with three properties:
`Success`, `Value` and `Message`

### Reporting results

The return object needs to have the three listed properties: `Success`, `Value` and `Message`

 - *Success:* Boolean value, `$true` when validation succeeded, `$false` when it failed.
 - *Value:* The resulting object that should be stored.
It should be type-coerced as necessary.
For example, in an integer validation, an originally specified string `"12"` would become an integer `12`.
 - *Message:* The message property contains the error message that will be shown to the user on bad input.

### Example Scriptblock

Here as a full example the definition for how the integer validation is defined:

```powershell
Register-PSFConfigValidation -Name "integer" -ScriptBlock {
	Param (
		$Value
	)
	
	$Result = New-Object PSOBject -Property @{
		Success = $True
		Value = $null
		Message = ""
	}
	
	try { [int]$number = $Value }
	catch
	{
		$Result.Message = "Not an integer: $Value"
		$Result.Success = $False
		return $Result
	}
	
	$Result.Value = $number
	
	return $Result
}
```

### A note on import order

Just in case: Make sure the configuration validations are defined before using them in configuration setting.
Otherwise, it will fail with an exception.

This is easy to get wrong when automatically compiling a module into a single file.

## Notes
[Back to Configuration](https://psframework.org/documentation/documents/psframework/configuration.html)

| Version | 1.0 |
| Written on: | 2018-05-23 |
| Updated on: | 2018-05-31 |

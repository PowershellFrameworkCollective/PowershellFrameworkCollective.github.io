---
layout: post
title: PSUtil 1.1.1.9 released - Converting objects nice and easy
---

Today we released version 1.1.1.9 of the PSUtil module.

# Main Feature: Conversion

PSUtil already offered two ways to easily convert objects on the pipeline:

 - Expand-PSUObject (`exp`) allows you to 'convert' objects by expanding one of their properties. The custom expansion system would theoretically allow you to pre-register type-conversion by object type.
 - Set-PSUObjectType (`cast`) allows you to convert objects by using PowerShell type coercion. This is a powerful tool to easily fit an object to a different type on the pipeline.

Both tools however are limited in that they are type-bound. This left a big whole for to occasional need to provide for logical content conversion, which is where the latest addition to the PSUtil family comes in:

```powershell
Convert-PSUObject
```

### Alias: convert

It is a tool that allows you to add any kind of input and apply a predefined transformation to it, where you specify input type and output type not based on input object but based on parameters.

Example usage:

```powershell
90..92 | convert dec hex
```

this will convert the numbers 90 through 92 from decimal to hexadecimal, resulting in:

```
5a
5b
5c
```

## Available conversion

PSUtil ships by default with the following conversion paths:

### Numeral System conversions:

It can freely transform between any of the following numeral systems:

- Binary (bin)
- Octal (oct)
- Decimal (dec)
- Hexadecimal (hex)

### Encoded Command <--> ScriptBlock

It can convert scriptblocks* to encoded commands and vice versa.

---

> * It can actually convert between any string and base64 encoding, but is designed and named explicitly for scriptblocks.

## Custom conversion

Anybody is free to add additional conversion options to this command by providing additional conversion scriptblocks. This can be done using the command `Register-PSUObjectConversion`

Example in action:

```powershell
Register-PSUObjectConversion -From dec -To bin -ScriptBlock {
	Param (
		$InputObject
	)
	
	[System.Convert]::ToString($InputObject, 2)
}

Register-PSUObjectConversion -From bin -To dec -ScriptBlock {
	Param (
		$InputObject
	)
	
	[System.Convert]::ToInt32($InputObject, 2)
}
```

As shown here, you need to specify a name from the input format and a name for the output format. Both should be descriptive and short enough to be easy to type (though automatic tab completion will be provided anyway).

> It is not technically required to provide both conversion directions, though where possible it is recommended to do so.

The scriptblock will receive a single argument - the input object to convert and needs to emit the converted output.

# Other changes

## Update: Configurable Keybindings

The five keybindings that have been added to PSUtil before used to have fixed keybindings. With this update those bindings have been provided with configuration options that remap them:

```
psutil.keybinding.browsehistory
psutil.keybinding.copyall
psutil.keybinding.expandalias
psutil.keybinding.gethelp
psutil.keybinding.sendtohistory
```

Notes:

> In order to update the mapping, these settings must be applied _before_ importing PSUtil. This can be done by first running these settings or by registering them (using `Set-PSFConfig` to change the setting, then `Register-PSFConfig` to persist it).
> The input to these settings is not technically validated, but it must be legal chords in order for them to succeed.

## Bugfix: replace

The bug preventing selectively deleting content using `replace` has been fixed, allowing the use of empty strings with the `With` parameter.

## Tests & CI/CD integration

While not immediately a feature users directly interact with, the module has been provided with the default pack of tests and a CI/CD pipeline for the development process. This ensures a greater overall code quality and reduces the probability for future bugs.

Future releases shall include more and more extensive tests to ensure even greater quality and stability.
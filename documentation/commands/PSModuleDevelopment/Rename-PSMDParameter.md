---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Rename-PSMDParameter

## SYNOPSIS
Renames a parameter of a function.

## SYNTAX

```
Rename-PSMDParameter [-Path] <String> [-Command] <String[]> [-Name] <String> [-NewName] <String> [-NoAlias]
 [-WhatIf] [-EnableException] [-DisableCache] [<CommonParameters>]
```

## DESCRIPTION
This command is designed to rename the parameter of a function within an entire module.
By default it will add an alias for the previous command name.

In order for this to work you need to consider to have the command / module imported.
Hint: Import the psm1 file for best results.

It will then search all files in the specified path (hint: Specify module root for best results), and update all psm1/ps1 files.
At the same time it will force all commands to call the parameter by its new standard, even if they previously used an alias for the parameter.

While this command was designed to work with a module, it is not restricted to that:
You can load a standalone function and specify a path with loose script files for the same effect.

Note:
You can also use this to update your scripts, after a foreign module introduced a breaking change by renaming a parameter.
In this case, import the foreign module to see the function, but point it at the base path of your scripts to update.
The loaded function is only used for alias/parameter alias resolution

## EXAMPLES

### EXAMPLE 1
```
Rename-PSMDParameter -Path 'C:\Scripts\Modules\MyModule' -Command 'Get-Test' -Name 'Foo' -NewName 'Bar'
```

Renames the parameter 'Foo' of the command 'Get-Test' to 'Bar' for all scripts stored in 'C:\Scripts\Modules\MyModule'

## PARAMETERS

### -Path
The path to the root folder where all the files are stored.
It will search the folder recursively and ignore hidden files & folders.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Command
The name of the function, whose parameter should be changed.
Most be loaded into the current runtime.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The name of the parameter to change.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NewName
The new name for the parameter.
Do not specify "-" or the "$" symbol

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoAlias
Avoid creating an alias for the old parameter name.
This may cause a breaking change!

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Prevents the command from updating the files.
Instead it will return the strings of all its changes.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableException
Replaces user friendly yellow warnings with bloody red exceptions of doom!
Use this if you want the function to throw terminating errors you want to catch.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -DisableCache
By default, this command caches the results of its execution in the PSFramework result cache.
This information can then be retrieved for the last command to do so by running Get-PSFResultCache.
Setting this switch disables the caching of data in the cache.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

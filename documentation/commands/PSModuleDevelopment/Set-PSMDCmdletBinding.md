---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Set-PSMDCmdletBinding

## SYNOPSIS
Adds cmdletbinding attributes in bulk

## SYNTAX

```
Set-PSMDCmdletBinding [-FullName] <String[]> [-DisableCache] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Searches the specified file(s) for functions that ...
- Do not have a cmdlet binding attribute
- Do have a param block
and inserts a cmdletbinding attribute for them.

Will not change files where functions already have this attribute.
Will also update internal functions.

## EXAMPLES

### EXAMPLE 1
```
Get-ChildItem .\functions\*\*.ps1 | Set-PSMDCmdletBinding
```

Updates all commands in the module to have a cmdletbinding attribute.

## PARAMETERS

### -FullName
The file to process

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
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

### -WhatIf
If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

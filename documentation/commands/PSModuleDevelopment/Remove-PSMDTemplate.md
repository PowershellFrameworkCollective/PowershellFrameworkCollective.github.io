---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Remove-PSMDTemplate

## SYNOPSIS
Removes templates

## SYNTAX

### NameStore (Default)
```
Remove-PSMDTemplate [-TemplateName] <String> [-Store <String>] [-Deprecated] [-EnableException] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

### Template
```
Remove-PSMDTemplate -Template <TemplateInfo[]> [-EnableException] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### NamePath
```
Remove-PSMDTemplate [-TemplateName] <String> -Path <String> [-Deprecated] [-EnableException] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This function removes templates used in the PSModuleDevelopment templating system.

## EXAMPLES

### EXAMPLE 1
```
Remove-PSMDTemplate -TemplateName '*' -Deprecated
```

Remove all templates that have been superseded by a newer version.

### EXAMPLE 2
```
Get-PSMDTemplate -TemplateName 'module' -RequiredVersion '1.2.2.1' | Remove-PSMDTemplate
```

Removes all copies of the template 'module' with exactly the version '1.2.2.1'

## PARAMETERS

### -Template
A template object returned by Get-PSMDTemplate.
Will clear exactly the version specified, from exactly its location.

```yaml
Type: TemplateInfo[]
Parameter Sets: Template
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -TemplateName
The name of the template to remove.
Templates are filtered by this using wildcard comparison.

```yaml
Type: String
Parameter Sets: NameStore, NamePath
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Store
The template store to retrieve tempaltes from.
By default, all stores are queried.

```yaml
Type: String
Parameter Sets: NameStore
Aliases:

Required: False
Position: Named
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
Instead of a registered store, look in this path for templates.

```yaml
Type: String
Parameter Sets: NamePath
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Deprecated
Will delete all versions of matching templates except for the latest one.
Note:
If the same template is found in multiple stores, it will keep a single copy across all stores.
To process by store, be sure to specify the store parameter and loop over the stores desired.

```yaml
Type: SwitchParameter
Parameter Sets: NameStore, NamePath
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

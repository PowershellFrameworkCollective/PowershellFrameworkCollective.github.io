---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Get-PSMDTemplate

## SYNOPSIS
Search for templates to create from.

## SYNTAX

### Store (Default)
```
Get-PSMDTemplate [[-TemplateName] <String>] [-Store <String>] [-Tags <String[]>] [-Author <String>]
 [-MinimumVersion <Version>] [-RequiredVersion <Version>] [-All] [-EnableException] [<CommonParameters>]
```

### Path
```
Get-PSMDTemplate [[-TemplateName] <String>] -Path <String> [-Tags <String[]>] [-Author <String>]
 [-MinimumVersion <Version>] [-RequiredVersion <Version>] [-All] [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Search for templates to create from.

## EXAMPLES

### EXAMPLE 1
```
Get-PSMDTemplate
```

Returns all templates

### EXAMPLE 2
```
Get-PSMDTemplate -TemplateName module
```

Returns the latest version of the template named module.

## PARAMETERS

### -TemplateName
The name of the template to search for.
Templates are filtered by this using wildcard comparison.
Defaults to "*" (everything).

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Store
The template store to retrieve tempaltes from.
By default, all stores are queried.

```yaml
Type: String
Parameter Sets: Store
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
Parameter Sets: Path
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tags
Only return templates with the following tags.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Author
Only return templates by this author.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MinimumVersion
Only return templates with at least this version.

```yaml
Type: Version
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RequiredVersion
Only return templates with exactly this version.

```yaml
Type: Version
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -All
Return all versions found.
By default, only the latest matching version of a template will be returned.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# New-PSMDFormatTableDefinition

## SYNOPSIS
Generates a format XML for the input type.

## SYNTAX

```
New-PSMDFormatTableDefinition [-InputObject] <Object> [[-IncludeProperty] <String[]>]
 [[-ExcludeProperty] <String[]>] [-Fragment] [<CommonParameters>]
```

## DESCRIPTION
Generates a format XML for the input type.
Currently, only tables are supported.

Note:
Loading format files has a measureable impact on module import PER FILE.
For the sake of performance, you should only generate a single file for an entire module.

## EXAMPLES

### EXAMPLE 1
```
Get-ChildItem | New-PSMDFormatTableDefinition
```

Generates a format xml for the objects in the current path (files and folders in most cases)

### EXAMPLE 2
```
Get-ChildItem | New-PSMDFormatTableDefinition -IncludeProperty LastWriteTime, FullName
```

Creates a format xml that only includes the columns LastWriteTime, FullName

## PARAMETERS

### -InputObject
The object that will be used to generate the format XML for.
Will not duplicate its work if multiple object of the same type are passed.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -IncludeProperty
Only properties in this list will be included.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeProperty
Only properties not in this list will be included.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Fragment
The function will only return a partial Format-XML object.
This is useful when combining multiple objects into a single file:
Simply create a full format XML for the first type, then use fragments on the subsequent ones and paste them into the first one's structure.

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
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

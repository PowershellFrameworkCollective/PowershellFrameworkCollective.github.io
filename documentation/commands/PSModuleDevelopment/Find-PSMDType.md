---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Find-PSMDType

## SYNOPSIS
Searches assemblies for types.

## SYNTAX

```
Find-PSMDType [[-Name] <String>] [[-FullName] <String>] [[-Assembly] <Assembly[]>] [-Public] [-Enum] [-Static]
 [[-Implements] <String>] [[-InheritsFrom] <String>] [[-Attribute] <String>] [<CommonParameters>]
```

## DESCRIPTION
This function searches the currently imported assemblies for a specific type.
It is not inherently limited to public types however, and can search interna just as well.

Can be used to scan for dependencies, to figure out what libraries one needs for a given type and what dependencies exist.

## EXAMPLES

### EXAMPLE 1
```
Find-PSMDType -Name "*String*"
```

Finds all types whose name includes the word "String"
(This will be quite a few)

### EXAMPLE 2
```
Find-PSMDType -InheritsFrom System.Management.Automation.Runspaces.Runspace
```

Finds all types that inherit from the Runspace class

## PARAMETERS

### -Name
Default: "*"
The name of the type to search for.
Accepts wildcards.

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

### -FullName
Default: "*"
The FullName of the type to search for.
Accepts wildcards.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Assembly
Default: (Get-PSMDAssembly)
The assemblies to search.
By default, all loaded assemblies are searched.

```yaml
Type: Assembly[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: (Get-PSMDAssembly)
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Public
Whether the type to find must be public.

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

### -Enum
Whether the type to find must be an enumeration.

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

### -Static
Whether the type to find must be static.

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

### -Implements
Whether the type to find must implement this interface

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InheritsFrom
The type must directly inherit from this type.
Accepts wildcards.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Attribute
The type must have this attribute assigned.
Accepts wildcards.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
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

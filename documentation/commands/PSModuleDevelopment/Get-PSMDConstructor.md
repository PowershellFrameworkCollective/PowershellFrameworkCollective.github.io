---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Get-PSMDConstructor

## SYNOPSIS
Returns information on the available constructors of a type.

## SYNTAX

```
Get-PSMDConstructor [[-InputObject] <Object>] [-NonPublic] [<CommonParameters>]
```

## DESCRIPTION
Returns information on the available constructors of a type.
Accepts any object as pipeline input:
- if it's a type, it will retrieve its constructors.
- If it's not a type, it will retrieve the constructor from the type of object passed

Will not duplicate constructors if multiple objects of the same type are passed.
In order to retrieve the constructor of an array, wrap it into another array.

## EXAMPLES

### EXAMPLE 1
```
Get-ChildItem | Get-PSMDConstructor
```

Scans all objects in the given path, than tries to retrieve the constructor for each kind of object returned
(generally, this will return the constructors for file and folder objects)

### EXAMPLE 2
```
Get-PSMDConstructor $result
```

Returns the constructors of objects stored in $result

## PARAMETERS

### -InputObject
The object the constructor of which should be retrieved.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -NonPublic
Show non-public constructors instead.

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

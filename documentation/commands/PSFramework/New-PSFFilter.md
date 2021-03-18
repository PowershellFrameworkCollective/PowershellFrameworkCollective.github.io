---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# New-PSFFilter

## SYNOPSIS
Creates a new filter object.

## SYNTAX

### default (Default)
```
New-PSFFilter -Expression <String> [<CommonParameters>]
```

### Object
```
New-PSFFilter -Expression <String> -ConditionSet <ConditionSet> [<CommonParameters>]
```

### Name
```
New-PSFFilter -Expression <String> -SetModule <String> -SetName <String> [<CommonParameters>]
```

## DESCRIPTION
Creates a new filter object based off the specified expression.
Optionally, an associated condition set can be specified, either as object or by name and module.
Conditions Set contain the implementation of the condition logic, that will be used when evaluating the filter expression.

These filter objects can then be used to execute validation either statically or against input objects.
Combined with filter conditions and condition sets, filters allow defining a custom filter syntax that is easy to write humanly readable filter expressions for without exposing direct code execution.
This makes filter expressions suitable for data regions and makes conditions easily reusable.

## EXAMPLES

### EXAMPLE 1
```
New-PSFFilter -Expression 'OSWindows -or EnvAzurePipelines'
```

Creates a filter object around the "OSWindows -or EnvAzurePipelines" expression.

### EXAMPLE 2
```
New-PSFFilter -Expression 'OSWindows -or EnvAzurePipelines' -SetModule PSFramework -SetName Environment
```

Creates a filter object around the "OSWindows -or EnvAzurePipelines" expression.
It then attaches the latest version of the Environment ConditionSet from within the PSFramework module.

## PARAMETERS

### -Expression
The expression to build a filter object for.
Can only consist of:
- Names of conditions: Words (may contain letters, numbers and underscore, but no dash)
- Parenthesis
- Logical operators (-or, -and, -not, -xor)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ConditionSet
A condition set object to attach to the filter.

```yaml
Type: ConditionSet
Parameter Sets: Object
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SetModule
The name of the module from which to select the condition set to attach to the filter.

```yaml
Type: String
Parameter Sets: Name
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SetName
The name of the condition set to attach to the filter.

```yaml
Type: String
Parameter Sets: Name
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### PSFramework.Filter.Expression
## NOTES

## RELATED LINKS

---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Test-PSFFilter

## SYNOPSIS
Tests a filter expression on whether it is valid.

## SYNTAX

### default (Default)
```
Test-PSFFilter -Expression <String> [<CommonParameters>]
```

### Object
```
Test-PSFFilter -Expression <String> -ConditionSet <ConditionSet> [<CommonParameters>]
```

### Name
```
Test-PSFFilter -Expression <String> -SetModule <String> -SetName <String> [<CommonParameters>]
```

## DESCRIPTION
Tests a filter expression on whether it is valid.
Can also validate, that it will work with the specified condition set.

## EXAMPLES

### EXAMPLE 1
```
Test-PSFFilter -Expression 'OSWindows -or EnvAzurePipelines'
```

Validates the syntax of the "OSWindows -or EnvAzurePipelines" expression (which is correct).

### EXAMPLE 2
```
Test-PSFFilter -Expression 'OSWindows -or EnvAzurePipelines' -SetModule PSFramework -SetName Environment
```

Validates the syntax of the "OSWindows -or EnvAzurePipelines" expression (which is correct).
It then compares it to the latest version of the Environment ConditionSet from within the PSFramework and validates, that it contains the conditions used in the expression ("OSWindows" and "EnvAzurePipelines").

## PARAMETERS

### -Expression
The filter expression to validate.

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
The condition set object (as returned by Get-PSFFilterConditionSet) to validate against the expression.

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
The name of the module from which to pick up the condition set to validate against the expression.

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
The name of the condition set to validate against the expression.

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

### System.Boolean
## NOTES

## RELATED LINKS

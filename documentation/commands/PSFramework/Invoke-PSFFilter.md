---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Invoke-PSFFilter

## SYNOPSIS
Evaluate a filter.

## SYNTAX

### ExpressionName
```
Invoke-PSFFilter -Expression <String> [-ArgumentList <Object>] -SetModule <String> -SetName <String>
 [<CommonParameters>]
```

### ExpressionObject
```
Invoke-PSFFilter -Expression <String> [-ArgumentList <Object>] -ConditionSet <ConditionSet>
 [<CommonParameters>]
```

### Filter
```
Invoke-PSFFilter [-ArgumentList <Object>] -Filter <Expression> [-ConditionSet <ConditionSet>]
 [-SetModule <String>] [-SetName <String>] [<CommonParameters>]
```

## DESCRIPTION
Evaluate a filter.
Can either run all by itself - for example to evaluate the runtime environment - or be given an argument to evaluate it against the expression.

Use ...
- New-PSFFilter to customize a filter
- New-PSFFilterCondition to architect your own conditions for use in expressions.
- New-PSFFilterConditionSet to tie conditions together into a set
Each filter must have a condition set assigned to be able to run (as otherwise it will not know which conditions are available).

This function exists mostly for discoverability.
Filter objects returned by New-PSFFilter can be invoked directly using their .Evaluate() method, providing far greater performance at scale.

## EXAMPLES

### EXAMPLE 1
```
Invoke-PSFFilter -Expression 'OSWindows -or EnvAzurePipelines' -SetModule PSFramework -SetName Environment
```

Executes the specified filter expression using the Environment ConditionSet from the PSFramework module.
Will return true if executed either on Windows or from within Azure DevOps Pipelines

## PARAMETERS

### -Expression
The filter expression to execute.
Can only consist of:
- Names of conditions: Words (may contain letters, numbers and underscore, but no dash)
- Parenthesis
- Logical operators (-or, -and, -not, -xor)

```yaml
Type: String
Parameter Sets: ExpressionName, ExpressionObject
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ArgumentList
Any argument to specify as input to the filter expression.
All input is passed as one item, to evaluate against multiple items separately, loop the entire command.
Note: To avoid incurring the overhead for large datasets, filter objects returned by New-PSFFilter can be invoked directly using the .Evaluate() method which also accepts arguments.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filter
The filter object to invoke.
Objects of this type can be created by New-PSFFilter.

```yaml
Type: Expression
Parameter Sets: Filter
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ConditionSet
A full Condition Set object as returned by Get-PSFConditionSet.

```yaml
Type: ConditionSet
Parameter Sets: ExpressionObject
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: ConditionSet
Parameter Sets: Filter
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SetModule
Name of the module in which to search for a Condition Set.

```yaml
Type: String
Parameter Sets: ExpressionName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: Filter
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SetName
Name of the Condition Set to use.

```yaml
Type: String
Parameter Sets: ExpressionName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: Filter
Aliases:

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

### System.Boolean
## NOTES

## RELATED LINKS

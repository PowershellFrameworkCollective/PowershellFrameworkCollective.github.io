---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Test-PSFTaskEngineTask

## SYNOPSIS
Tests, whether the specified task has already been executed.

## SYNTAX

```
Test-PSFTaskEngineTask [-Name] <String> [<CommonParameters>]
```

## DESCRIPTION
Tests, whether the specified task has already been executed.
Returns false, if the task doesn't exist.

## EXAMPLES

### EXAMPLE 1
```
Test-PSFTaskEngineTask -Name 'mymodule.maintenance'
```

Returns, whether the task named 'mymodule.maintenance' has already been executed at least once.

## PARAMETERS

### -Name
Name of the task to test

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Boolean
## NOTES

## RELATED LINKS

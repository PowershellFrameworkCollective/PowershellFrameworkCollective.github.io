---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Test-PSFTaskEngineCache

## SYNOPSIS
Tests, whether the specified task engine cache-entry has been written.

## SYNTAX

```
Test-PSFTaskEngineCache [-Module] <String> [-Name] <String> [<CommonParameters>]
```

## DESCRIPTION
Tests, whether the specified task engine cache-entry has been written.

## EXAMPLES

### EXAMPLE 1
```
Test-PSFTaskEngineCache -Module 'mymodule' -Name 'maintenancetask'
```

Returns, whether the cache has been set for the module 'mymodule' and the task 'maintenancetask'
Does not require the cache to actually contain a value, but must exist.

## PARAMETERS

### -Module
The name of the module that generated the task.
Use scriptname in case of using this within a script.
Note: Must be the same as the name used within the task when calling 'Set-PSFTaskEngineCache'

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

### -Name
The name of the task for which the cache is.
Note: Must be the same as the name used within the task when calling 'Set-PSFTaskEngineCache'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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

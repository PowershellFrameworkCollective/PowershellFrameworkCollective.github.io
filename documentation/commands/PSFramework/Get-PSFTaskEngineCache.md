---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Get-PSFTaskEngineCache

## SYNOPSIS
Retrieve values from the cache for a task engine task.

## SYNTAX

```
Get-PSFTaskEngineCache [-Module] <String> [-Name] <String> [<CommonParameters>]
```

## DESCRIPTION
Retrieve values from the cache for a task engine task.
Tasks scheduled under the PSFramework task engine do not have a way to directly pass information to the primary runspace.
Using Set-PSFTaskEngineCache, they can store the information somewhere where the main runspace can retrieve it using this function.

## EXAMPLES

### EXAMPLE 1
```
Get-PSFTaskEngineCache -Module 'mymodule' -Name 'maintenancetask'
```

Retrieves the information stored under 'mymodule.maintenancetask'

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

## NOTES

## RELATED LINKS

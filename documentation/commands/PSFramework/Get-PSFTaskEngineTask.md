---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Get-PSFTaskEngineTask

## SYNOPSIS
Returns tasks registered for the task engine

## SYNTAX

```
Get-PSFTaskEngineTask [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns tasks registered for the task engine

## EXAMPLES

### EXAMPLE 1
```
Get-PSFTaskEngineTask
```

Returns all tasks registered to the task engine

### EXAMPLE 2
```
Get-PSFTaskEngineTask -Name 'mymodule.*'
```

Returns all tasks registered to the task engine whose name starts with 'mymodule.'
(It stands to reason that only tasks belonging to the module 'mymodule' would be returned that way)

## PARAMETERS

### -Name
Default: "*"
Only tasks with similar names are returned.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

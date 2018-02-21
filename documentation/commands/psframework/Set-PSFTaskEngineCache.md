---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Set-PSFTaskEngineCache

## SYNOPSIS
Sets the cache for a task engine task.

## SYNTAX

```
Set-PSFTaskEngineCache [-Module] <String> [-Name] <String> [-Value] <Object> [<CommonParameters>]
```

## DESCRIPTION
Sets the cache for a task engine task.
Tasks executed by the task engine have no way to directly transfer output to the main runspace.
This function is designed to work around this by providing a central storage.
This function should only be called tasks scheduled to execute within the task engine.

## EXAMPLES

### EXAMPLE 1
```
Set-PSFTaskEngineCache -Module 'mymodule' -Name 'maintenancetask' -Value $results
```

Stores the content of $results in the cache 'mymodule / maintenancetask'
These values can now be retrieved using Get-PSFTaskEngineCache.

## PARAMETERS

### -Module
The name of the module that generated the task.
Use scriptname in case of using this within a script.

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

### -Value
The value to set this cache to.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
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

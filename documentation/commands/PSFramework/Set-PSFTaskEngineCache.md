---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Set-PSFTaskEngineCache

## SYNOPSIS
Sets values and configuration for a cache entry.

## SYNTAX

```
Set-PSFTaskEngineCache [-Module] <String> [-Name] <String> [[-Value] <Object>]
 [[-Lifetime] <TimeSpanParameter>] [[-Collector] <ScriptBlock>] [[-CollectorArgument] <Object>]
 [<CommonParameters>]
```

## DESCRIPTION
Allows applying values and settings for a cache.
This allows applying a lifetime to cached data or offering a mechanism to automatically refresh it on retrieval.

This feature is specifically designed to interact with the Task Engine powershell task scheduler (See Register-PSFTaskEngineTask for details).
However it is open for interaction with all tools.
In particular, the cache is threadsafe to use through these functions.
The cache is global to the process, NOT the current runspace.
Background runspaces access the same data in a safe manner.

## EXAMPLES

### EXAMPLE 1
```
Set-PSFTaskEngineCache -Module 'mymodule' -Name 'maintenancetask' -Value $results
```

Stores the content of $results in the cache 'mymodule / maintenancetask'
These values can now be retrieved using Get-PSFTaskEngineCache.

### EXAMPLE 2
```
Set-PSFTaskEngineCache -Module MyModule -Name DomainController -Lifetime 8h -Collector { Get-ADDomainController }
```

Registers a cache that lists all domain controllers in the current domain, keeping the data valid for 8 hours before refreshing it.

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

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Lifetime
How long values stored in this cache should remain valid.

```yaml
Type: TimeSpanParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Collector
A scriptblock that is used to refresh the data cached.
Should return values in a save manner, will be called if retrieving data on a cache that has expired.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CollectorArgument
An argument to pass to the collector script.
Allows passing in values as argument to the collector script.
The arguments are stored persistently and are not subject to expiration.

```yaml
Type: Object
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

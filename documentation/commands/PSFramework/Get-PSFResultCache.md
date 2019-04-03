---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Get-PSFResultCache

## SYNOPSIS
Returns the last stored result

## SYNTAX

```
Get-PSFResultCache [[-Type] <String>] [<CommonParameters>]
```

## DESCRIPTION
Functions that implement the result cache store their information in the cache.
This can then be retrieved by the user running this command.
This forgives the user for forgetting to store the output in a variable and is especially precious when running commands that take a while to execute.

## EXAMPLES

### EXAMPLE 1
```
Get-PSFResultCache
```

Returns the latest cached result.

### EXAMPLE 2
```
Get-PSFResultCache -Type 'All'
```

Returns a meta-information object containing the last result, when it was written and which function did the writing.

## PARAMETERS

### -Type
Default: Value
Options: All, Value
By default, this function will return the output that was cached during the last execution.
However, this mode can be switched:
- All: Returns everything that has been cached.
This includes the name of the command calling Set-PFSResultCache as well as the timestamp when it was called.
- Value: Returns just the object(s) that were written to cache

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: Value
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

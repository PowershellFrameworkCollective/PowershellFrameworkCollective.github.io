---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Get-PSFLoggingProvider

## SYNOPSIS
Returns a list of the registered logging providers.

## SYNTAX

```
Get-PSFLoggingProvider [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of the registered logging providers.
Those are used to log messages to whatever system they are designed to log to.

PSFramework ships with a few default logging providers.
Custom logging destinations can be created by implementing your own, custom provider and registering it using Register-PSFLoggingProvider.

## EXAMPLES

### EXAMPLE 1
```
Get-PSFLoggingProvider
```

Returns all logging provider

### EXAMPLE 2
```
Get-PSFLoggingProvider -Name filesystem
```

Returns the filesystem provider

## PARAMETERS

### -Name
Default: '*'
The name to filter by

```yaml
Type: String
Parameter Sets: (All)
Aliases: Provider, ProviderName

Required: False
Position: 1
Default value: *
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

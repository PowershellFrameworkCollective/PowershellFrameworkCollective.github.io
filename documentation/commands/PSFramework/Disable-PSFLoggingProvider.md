---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Disable-PSFLoggingProvider

## SYNOPSIS
Disables the instance of a logging provider.

## SYNTAX

```
Disable-PSFLoggingProvider [-Name] <String> [[-InstanceName] <String>] [-NoFinalizeWait] [<CommonParameters>]
```

## DESCRIPTION
Disables the instance of a logging provider.
This ensures all logs that apply to the logging provider are flushed and the closing events are properly released.
For example, this ensures logfiles are complete and no longer in access.

Only works for v2+ Logging Providers, as it addresses logging provider instances, not the provider itself.

## EXAMPLES

### EXAMPLE 1
```
Disable-PSFLoggingProvider -Name logfile
```

Disables the default instance of the logfile provider, then waits until all applicable logs are processed
and the logfile is released.

### EXAMPLE 2
```
Disable-PSFLoggingProvider -Name logfile -InstanceName mytask
```

Disables the "mytask" instance of the logfile provider, then waits until all applicable logs are processed
and the logfile is released.

### EXAMPLE 3
```
Disable-PSFLoggingProvider -Name logfile -InstanceName mytask -NoFinalizeWait
```

Disables the "mytask" instance of the logfile provider, then waits until all applicable logs are processed
but not for the logfile to be released (which will happen soon after, in most cases).

## PARAMETERS

### -Name
Name of the logging provider to disable.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Provider, ProviderName

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InstanceName
Name of the instance of the logging provider to disable.
Defaults to: Default

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Default
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoFinalizeWait
Do not wait for the logging to conclude or the final events shutting down the provider instance to finish.
By default, this command waits for all aspects of shutting down a logging instance to complete.
Using this parameter is intended for situations where the powershell process continues and it is acceptable
to continue while the shutting down happens in the background.

Even with this parameter, all messages are flushed, so some waiting might be involved anyway,
based on just how many log messages are still waiting to be processed.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

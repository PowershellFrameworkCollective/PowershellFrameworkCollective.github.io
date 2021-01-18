---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Remove-PSFLoggingProviderRunspace

## SYNOPSIS
Removes a runspace from the list of dynamically included runspaces of an active logging provider instance.

## SYNTAX

```
Remove-PSFLoggingProviderRunspace [-ProviderName] <String> [[-InstanceName] <String>] [[-Runspace] <Guid>]
 [<CommonParameters>]
```

## DESCRIPTION
Removes a runspace from the list of dynamically included runspaces of an active logging provider instance.
See the help on Add-PSFLoggingProviderRunspace for details on how and why this is desirable.

## EXAMPLES

### EXAMPLE 1
```
Remove-PSFLoggingProviderRunspace -ProviderName 'logfile' -InstanceName UpdateTask
```

Removes the current runspace from the list of included runspaces on the logfile instance "UpdateTask".

## PARAMETERS

### -ProviderName
Name of the logging provider the instance is part of.

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

### -InstanceName
Name of the logging provider instance to target.
Default: "default"  (the instance created when you omit the instancename parameter on Set-PSFLoggingProvider)

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

### -Runspace
The Runspace ID of the runspace to remove.
Defaults to the current runspace.

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: [System.Management.Automation.Runspaces.Runspace]::DefaultRunspace.InstanceId
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

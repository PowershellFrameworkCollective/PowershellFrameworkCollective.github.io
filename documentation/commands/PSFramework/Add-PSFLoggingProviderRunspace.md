---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Add-PSFLoggingProviderRunspace

## SYNOPSIS
Adds a runspace to the list of dynamically included runspaces of an active logging provider instance.

## SYNTAX

```
Add-PSFLoggingProviderRunspace [-ProviderName] <String> [[-InstanceName] <String>] [[-Runspace] <Guid>]
 [<CommonParameters>]
```

## DESCRIPTION
Adds a runspace to the list of dynamically included runspaces of an active logging provider instance.
This is designed to allow runspaces to add themselves "on the fly" to a specific logging provider.

Consider this scenario:
You have a large workload you spread across many runspaces.
However, each workload item might perform one out of three different categories of tasks.
You want each of these categories to log into a dedicated logfile and have prepared a provider for each.
Set each such logging instance as "-RequiresInclude" so by default nothing gets logged to any of them.
Then each workload item can call this command to add itself to the correct logging provider instance.

When done, call "Remove-PSFLoggingProviderRunspace" to remove that runspace correctly from the instance.
When using runspaces with a runspace pool, runspaces might be recycled for workitems of other categories, so cleaning it up is a useful habit.

Note:
This call will fail if the instance has not been created yet!
After setting up the logging provider instance using Set-PSFLoggingProvider, a short delay may occur before the instance is created.
With the default configuration, this delay should be no worse than 6 seconds and generally a lot less.
You can use "Get-PSFLoggingProviderInstance -ProviderName \<providername\> -Name \<instancename\>" to check whether it has been created.

## EXAMPLES

### EXAMPLE 1
```
Add-PSFLoggingProviderRunspace -ProviderName 'logfile' -InstanceName UpdateTask
```

Adds the current runspace to the list of included runspaces on the logfile instance "UpdateTask".

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
The Runspace ID of the runspace to add.
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

---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Register-PSFLoggingProvider

## SYNOPSIS
Registers a new logging provider to the PSFramework logging system.

## SYNTAX

### Version1 (Default)
```
Register-PSFLoggingProvider -Name <String> [-Enabled] [-RegistrationEvent <ScriptBlock>]
 [-BeginEvent <ScriptBlock>] [-StartEvent <ScriptBlock>] -MessageEvent <ScriptBlock>
 [-ErrorEvent <ScriptBlock>] [-EndEvent <ScriptBlock>] [-FinalEvent <ScriptBlock>]
 [-ConfigurationParameters <ScriptBlock>] [-ConfigurationScript <ScriptBlock>]
 [-IsInstalledScript <ScriptBlock>] [-InstallationScript <ScriptBlock>] [-InstallationParameters <ScriptBlock>]
 [-ConfigurationSettings <ScriptBlock>] [-EnableException] [<CommonParameters>]
```

### Version2
```
Register-PSFLoggingProvider -Name <String> [-Version2] [-Enabled] -ConfigurationRoot <String>
 -InstanceProperties <String[]> [-ConfigurationDefaultValues <Hashtable>] [-FunctionDefinitions <ScriptBlock>]
 [-RegistrationEvent <ScriptBlock>] [-BeginEvent <ScriptBlock>] [-StartEvent <ScriptBlock>]
 -MessageEvent <ScriptBlock> [-ErrorEvent <ScriptBlock>] [-EndEvent <ScriptBlock>] [-FinalEvent <ScriptBlock>]
 [-ConfigurationParameters <ScriptBlock>] [-ConfigurationScript <ScriptBlock>]
 [-IsInstalledScript <ScriptBlock>] [-InstallationScript <ScriptBlock>] [-InstallationParameters <ScriptBlock>]
 [-ConfigurationSettings <ScriptBlock>] [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
This function registers all components of the PSFramework logging provider systems.
It allows you to define your own logging destination and configuration and tie them into the default logging system.

In order to properly utilize its power, it becomes necessary to understand how the logging works beneath the covers:
- On Start of the logging script, it runs a one-time scriptblock per enabled provider (this will also occur when later enabling a provider)
- Thereafter the script will continue, logging in cycles of Start \> Log all Messages \> Log all Errors \> End
Each of those steps has its own event, allowing for fine control over what happens where.
- Finally, on shutdown of a provider it again offers an option to execute some code (to dispose/free resources in use)

NOTE: Logging Provider Versions
There are two versions / generations of logging providers, that are fundamentally different from each other:

Version 1
---------

All providers share the same scope for the execution of ALL of those actions/scriptblocks!
This makes it important to give your variables/functions a unique name, in order to avoid conflicts.
General Guideline:
- All variables should start with the name of the provider and an underscore.
Example: $filesystem_root
- All functions should use the name of the provider as prefix.
Example: Clean-FileSystemErrorXml

Version 2
---------

Each provider runs in an isolated module context.
A provider can have multiple instances of itself active at the same time, each with separate resource isolation.
Additional tooling provided makes it also easier to publish complex logging providers.
Share variables between events by making them script-scope (e.g.: $script:path)

## EXAMPLES

### EXAMPLE 1
```
Register-PSFLoggingProvider -Name "filesystem" -Enabled $true -RegistrationEvent $registrationEvent -BeginEvent $begin_event -StartEvent $start_event -MessageEvent $message_Event -ErrorEvent $error_Event -EndEvent $end_event -FinalEvent $final_event -ConfigurationParameters $configurationParameters -ConfigurationScript $configurationScript -IsInstalledScript $isInstalledScript -InstallationScript $installationScript -InstallationParameters $installationParameters -ConfigurationSettings $configuration_Settings
```

Registers the filesystem provider, providing events for every single occasion.

## PARAMETERS

### -Name
A unique name for your provider.
Registering a provider under a name already registered, NOTHING will happen.
This function will instead silently terminate.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Version2
Flags the provider as a second generation logging provider.
This reduces the complexity and improves the overall user experience while adding multi-instance capability to the service.
All new providers should be built as version2 providers.
Generation 1 legacy providers are still supported under the PSFramework Reliability Promise

```yaml
Type: SwitchParameter
Parameter Sets: Version2
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Enabled
Setting this will enable the provider on registration.

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

### -ConfigurationRoot
Provider instance information is stored in the configuration system.
Assuming you would store the path location for the provider under this config setting:
'PSFramework.Logging.LogFile.FilePath'
Then the ConfigurationRoot would be:
'PSFramework.Logging.LogFile'

For more information on the configuration system, see:
https://psframework.org/documentation/documents/psframework/configuration.html

```yaml
Type: String
Parameter Sets: Version2
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InstanceProperties
The properties needed to define an instance of a provider.
Examples from the default providers:
LogFile: 'CsvDelimiter','FilePath','FileType','Headers','IncludeHeader','Logname','TimeFormat'
GELF: 'Encrypt','GelfServer','Port'

```yaml
Type: String[]
Parameter Sets: Version2
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ConfigurationDefaultValues
A hashtable containing the default values to assume when creating a new instance of a logging provider.
This data is used during Set-PSFLoggingProvider when nothing in particular is specified for a given value.
Instances that are defined through configuration are responsible for their full configuration set and will not be provided these values.

```yaml
Type: Hashtable
Parameter Sets: Version2
Aliases:

Required: False
Position: Named
Default value: @{ }
Accept pipeline input: False
Accept wildcard characters: False
```

### -FunctionDefinitions
If your provider instances need access to helper functions, the easiest way is to provide them using this parameter.
Specify a scriptblock that contains your function statements with the full definition, they will be made available to the provider instances.
Note: All logging provider instances are isolated from each other.
Even though multiple instances will have access to equal instances, they will not share access to variables and such.

```yaml
Type: ScriptBlock
Parameter Sets: Version2
Aliases:

Required: False
Position: Named
Default value: { }
Accept pipeline input: False
Accept wildcard characters: False
```

### -RegistrationEvent
Scriptblock that should be executed on registration.
This allows you to perform installation actions synchronously, with direct user interaction.
At the same time, by adding it as this parameter, it will only performed on the initial registration, rather than every time the provider is registered (runspaces, Remove-Module/Import-Module)

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BeginEvent
The actions that should be taken once when setting up the logging.
Can well be used to register helper functions or loading other resources that should be loaded on start only.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: { }
Accept pipeline input: False
Accept wildcard characters: False
```

### -StartEvent
The actions taken at the beginning of each logging cycle.
Typically used to establish connections or do some necessary pre-connections.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: { }
Accept pipeline input: False
Accept wildcard characters: False
```

### -MessageEvent
The actions taken to process individual messages.
The very act of writing logs.
This scriptblock receives a message object (As returned by Get-PSFMessage) as first and only argument.
Under some circumstances, this message may be a $null object, your scriptblock must be able to handle this.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ErrorEvent
The actions taken to process individual error messages.
The very act of writing logs.
This scriptblock receives a message object (As returned by 'Get-PSFMessage -Errors') as first and only argument.
Under some circumstances, this message may be a $null object, your scriptblock must be able to handle this.
This consists of complex, structured data and may not be suitable to all logging formats.
However all errors are ALWAYS accompanied by a message, making integrating this optional.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: { }
Accept pipeline input: False
Accept wildcard characters: False
```

### -EndEvent
Actions taken when finishing up a logging cycle.
Can be used to close connections.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: { }
Accept pipeline input: False
Accept wildcard characters: False
```

### -FinalEvent
Final action to take when the logging terminates.
This should release all resources reserved.
This event will fire when:
- The console is being closed
- The logging script is stopped / killed
- The logging provider is disabled

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: { }
Accept pipeline input: False
Accept wildcard characters: False
```

### -ConfigurationParameters
The function Set-PSFLoggingProvider can be used to configure this logging provider.
Using this parameter it is possible to register dynamic parameters when configuring your provider.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: { }
Accept pipeline input: False
Accept wildcard characters: False
```

### -ConfigurationScript
When using Set-PSFLoggingProvider, this script can be used to input given by the dynamic parameters generated by the -ConfigurationParameters parameter.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: { }
Accept pipeline input: False
Accept wildcard characters: False
```

### -IsInstalledScript
A scriptblock verifying that all prerequisites are properly installed.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: { $true }
Accept pipeline input: False
Accept wildcard characters: False
```

### -InstallationScript
A scriptblock performing the installation of the provider's prerequisites.
Used by Install-PSFProvider in conjunction with the script provided by -InstallationParameters

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: { }
Accept pipeline input: False
Accept wildcard characters: False
```

### -InstallationParameters
A scriptblock returning dynamic parameters that are offered when running Install-PSFprovider.
Those can then be used by the installation scriptblock specified in the aptly named '-InstallationScript' parameter.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: { }
Accept pipeline input: False
Accept wildcard characters: False
```

### -ConfigurationSettings
This is executed before actually registering the scriptblock.
It allows you to include any logic you wish, but it is specifically designed for configuration settings using Set-PSFConfig with the '-Initialize' parameter.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableException
This parameters disables user-friendly warnings and enables the throwing of exceptions.
This is less user friendly, but allows catching exceptions in calling scripts.

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

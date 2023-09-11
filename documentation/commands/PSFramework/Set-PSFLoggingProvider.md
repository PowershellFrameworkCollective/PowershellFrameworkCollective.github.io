---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Set-PSFLoggingProvider

## SYNOPSIS
Configures a logging provider.

## SYNTAX

```
Set-PSFLoggingProvider [-Name] <String> [[-InstanceName] <String>] [[-Enabled] <Boolean>]
 [[-IncludeModules] <String[]>] [[-ExcludeModules] <String[]>] [[-IncludeFunctions] <String[]>]
 [[-ExcludeFunctions] <String[]>] [[-IncludeRunspaces] <Guid[]>] [[-ExcludeRunspaces] <Guid[]>]
 [[-IncludeTags] <String[]>] [[-ExcludeTags] <String[]>] [[-MinLevel] <Int32>] [[-MaxLevel] <Int32>]
 [-RequiresInclude] [-ExcludeWarning] [-ExcludeError] [-Wait] [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
This command allows configuring the way a logging provider works.
This grants the ability to ...
- Enable / Disable a provider
- Set additional parameters defined by the provider (each provider may implement its own settings, exposed through dynamic parameters)
- Configure filters about what messages get sent to a given provider.

## EXAMPLES

### EXAMPLE 1
```
Set-PSFLoggingProvider -Name filesystem -Enabled $false
```

Disables the filesystem provider.

### EXAMPLE 2
```
Set-PSFLoggingProvider -Name filesystem -ExcludeModules "PSFramework"
```

Prevents all messages from the PSFramework module to be logged to the file system

## PARAMETERS

### -Name
The name of the provider to configure

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
A description of the InstanceName parameter.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Enabled
Whether the provider should be enabled or disabled.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeModules
Only messages from modules listed here will be logged.
Exact match only, an empty list results in all modules being logged.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeModules
Messages from excluded modules will not be logged using this provider.
Overrides -IncludeModules in case of overlap.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeFunctions
Only messages from functions that match at least one entry noted here will be logged.
Uses wildcard expressions.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeFunctions
Messages from functions that match at least one entry noted here will NOT be logged.
Uses wildcard expressions.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeRunspaces
Only messages that come from one of the defined runspaces will be logged.

```yaml
Type: Guid[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeRunspaces
Messages that come from one of the defined runspaces will NOT be logged.

```yaml
Type: Guid[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeTags
Only messages containing the listed tags will be logged.
Exact match only, only a single match is required for a message to qualify.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeTags
Messages containing any of the listed tags will not be logged.
Overrides -IncludeTags in case of overlap.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MinLevel
The minimum level of a message that will be logged.
Note: The lower the message level, the MORE important it is.
Levels range from 1 through 9:
- InternalComment: 9
- Debug: 8
- Verbose: 5
- Host: 2
- Critical: 1
The level "Warning" is not represented on this scale.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxLevel
The maximum level of a message that will be logged.
Note: The lower the message level, the MORE important it is.
Levels range from 1 through 9:
- InternalComment: 9
- Debug: 8
- Verbose: 5
- Host: 2
- Critical: 1
The level "Warning" is not represented on this scale.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -RequiresInclude
By default, messages will be written to a logging provider, unless a specific exclude rule was met or any include rule was not met.
That means, if no exclude and include rules exist at a given time, all messages will be written to the logging provider instance.
Setting this to true will instead require at least one include rule to exist - and be met - before logging a message.
This is designed for in particular for runspace-bound logging providers, which might at runtime swiftly gain or lose included runspaces.

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

### -ExcludeWarning
Whether to exclude warnings from the logging provider / instance.

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

### -ExcludeError
Whether to exclude errors from the logging provider / instance.

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

### -Wait
Whether to have the command wait until the provider instance is provisioned and ready to handle messages.
By default, the asynchroneous nature of the logging system my cause a slight delay, that in some instances could lead to missing the first few messages.
Enables the logging runspace if disabled, may timeout (30 seconds) in extreme-load situations caused by other runspaces.

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

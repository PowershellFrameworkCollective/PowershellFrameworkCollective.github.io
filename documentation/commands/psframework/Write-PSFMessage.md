---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Write-PSFMessage

## SYNOPSIS
This function receives messages, then logs and reports them.

## SYNTAX

```
Write-PSFMessage [-Level <MessageLevel>] [-Message] <String> [-Tag <String[]>] [-FunctionName <String>]
 [-ModuleName <String>] [-File <String>] [-Line <Int32>] [-ErrorRecord <ErrorRecord[]>]
 [-Exception <Exception>] [-Once <String>] [-OverrideExceptionMessage] [-Target <Object>]
 [-EnableException <Boolean>] [<CommonParameters>]
```

## DESCRIPTION
This function receives messages, then logs and reports them.
Other functions hand off all their information output for processing to this function.

This function will then handle:
- Warning output
- Error management for non-terminating errors (For errors that terminate execution or continue on with the next object use "Stop-PSFFunction")
- Logging
- Verbose output
- Message output to users

For the complex description on how this works and how users and developers can influence it, run:
Get-Help about_psf_message

## EXAMPLES

### BEISPIEL 1
```
Write-PSFMessage -Level Verbose -Message "Connecting to $computer"
```

Writes the message "Connecting to $computer" to verbose.
Will also log the message.

### BEISPIEL 2
```
Write-PSFMessage -Level Warning -Message "Failed to retrieve additional network adapter information from $computer"
```

Writes the message "Failed to retrieve additional network adapter information from $computer" as a warning.
Will also log the message.

### BEISPIEL 3
```
Write-PSFMessage -Level Verbose -Message "Connecting to $computer" -Target $computer
```

Writes the message "Connecting to $computer" to verbose.
Includes the variable $computer in the message.
This has no effect on the text shown but will be available for debugging purposes.
Will also log the message.

### BEISPIEL 4
```
Write-PSFMessage -Level Host -Message "This command has been deprecated, use 'Get-NewExample' instead" -Once 'Get-Example'
```

Writes the message "This command has been deprecated, use 'Get-NewExample' instead" to the screen.
This message will only be shown once per powershell process.
Will also log the message.

### BEISPIEL 5
```
Write-PSFMessage -Level Warning -Message "Failed to retrieve additional network adapter information from $computer" -Target $computer -ErrorRecord $_
```

Writes the message "Failed to retrieve additional network adapter information from $computer" as a warning.
Will also append the message of the exception to the text.
Will also add the error record to the error log
Will also log the message.

## PARAMETERS

### -Level
This parameter represents the verbosity of the message.
The lower the number, the more important it is for a human user to read the message.
By default, the levels are distributed like this:
- 1-3 Direct verbose output to the user (using Write-Host)
- 4-6 Output only visible when requesting extra verbosity (using Write-Verbose)
- 1-9 Debugging information, written using Write-Debug

In addition, it is possible to select the level "Warning" which moves the message out of the configurable range:
The user will always be shown this message, unless he silences the entire verbosity.

Possible levels:
Critical (1), Important / Output / Host (2), Significant (3), VeryVerbose (4), Verbose (5), SomewhatVerbose (6), System (7), Debug (8), InternalComment (9), Warning (666)
Either one of the strings or its respective number will do as input.

```yaml
Type: MessageLevel
Parameter Sets: (All)
Aliases:
Accepted values: Critical, Important, Output, Host, Significant, VeryVerbose, Verbose, SomewhatVerbose, System, Debug, InternalComment, Warning

Required: False
Position: Named
Default value: Verbose
Accept pipeline input: False
Accept wildcard characters: False
```

### -Message
The message to write/log.
The function name and timestamp will automatically be prepended.

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

### -Tag
Tags to add to the message written.
This allows filtering and grouping by category of message, targeting specific messages.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FunctionName
The name of the calling function.
Will be automatically set, but can be overridden when necessary.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: ((Get-PSCallStack)[0].Command)
Accept pipeline input: False
Accept wildcard characters: False
```

### -ModuleName
The name of the module, the calling function is part of.
Will be automatically set, but can be overridden when necessary.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: ((Get-PSCallStack)[0].InvocationInfo.MyCommand.ModuleName)
Accept pipeline input: False
Accept wildcard characters: False
```

### -File
The file in which Write-PSFMessage was called.
Will be automatically set, but can be overridden when necessary.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: ((Get-PSCallStack)[0].Position.File)
Accept pipeline input: False
Accept wildcard characters: False
```

### -Line
The line on which Write-PSFMessage was called.
Will be automatically set, but can be overridden when necessary.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: ((Get-PSCallStack)[0].Position.StartLineNumber)
Accept pipeline input: False
Accept wildcard characters: False
```

### -ErrorRecord
If an error record should be noted with the message, add the full record here.
Especially designed for use with Warning-mode, it can legally be used in either mode.
The error will be added to the $Error variable and enqued in the logging/debugging system.

```yaml
Type: ErrorRecord[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Exception
Allows specifying an inner exception as input object.
This will be passed on to the logging and used for messages.
When specifying both ErrorRecord AND Exception, Exception wins, but ErrorRecord is still used for record metadata.

```yaml
Type: Exception
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Once
Setting this parameter will cause this function to write the message only once per session.
The string passed here and the calling function's name are used to create a unique ID, which is then used to register the action in the configuration system.
Thus will the lockout only be written if called once and not burden the system unduly.
This lockout will be written as a hidden value, to see it use Get-PSFConfig -Force.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OverrideExceptionMessage
Disables automatic appending of exception messages.
Use in cases where you already have a speaking message interpretation and do not need the original message.

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

### -Target
Add the object the message is all about, in order to simplify debugging / troubleshooting.
For example, when calling this from a function targeting a remote computer, the computername could be specified here, allowing all messages to easily be correlated to the object processed.

```yaml
Type: Object
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
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
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

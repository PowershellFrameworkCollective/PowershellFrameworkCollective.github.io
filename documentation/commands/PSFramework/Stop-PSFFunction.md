---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Stop-PSFFunction

## SYNOPSIS
Function that interrupts a function.

## SYNTAX

### Message (Default)
```
Stop-PSFFunction -Message <String> [-EnableException <Boolean>] [-Category <ErrorCategory>]
 [-ErrorRecord <ErrorRecord[]>] [-Tag <String[]>] [-FunctionName <String>] [-ModuleName <String>]
 [-File <String>] [-Line <Int32>] [-Exception <Exception>] [-OverrideExceptionMessage] [-Target <Object>]
 [-Continue] [-SilentlyContinue] [-ContinueLabel <String>] [-Cmdlet <PSCmdlet>] [-StepsUpward <Int32>]
 [<CommonParameters>]
```

### String
```
Stop-PSFFunction -String <String> [-StringValues <Object[]>] [-EnableException <Boolean>]
 [-Category <ErrorCategory>] [-ErrorRecord <ErrorRecord[]>] [-Tag <String[]>] [-FunctionName <String>]
 [-ModuleName <String>] [-File <String>] [-Line <Int32>] [-Exception <Exception>] [-OverrideExceptionMessage]
 [-Target <Object>] [-Continue] [-SilentlyContinue] [-ContinueLabel <String>] [-Cmdlet <PSCmdlet>]
 [-StepsUpward <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Function that interrupts a function.

This function is a utility function used by other functions to reduce error catching overhead.
It is designed to allow gracefully terminating a function with a warning by default and also allow opt-in into terminating errors.
It also allows simple integration into loops.

Note:
When calling this function with the intent to terminate the calling function in non-ExceptionEnabled mode too, you need to add a return below the call.

For a more detailed explanation - including commented full-scale implementation examples - see the associated help article:
Get-Help about_psf_flowcontrol

## EXAMPLES

### EXAMPLE 1
```
Stop-PSFFunction -Message "Foo failed bar!" -EnableException $EnableException -ErrorRecord $_
```

return

Depending on whether $EnableException is true or false it will:
- Throw a bloody terminating error.
Game over.
- Write a nice warning about how Foo failed bar, then terminate the function.
The return on the next line will then end the calling function.

### EXAMPLE 2
```
Stop-PSFFunction -Message "Foo failed bar!" -EnableException $EnableException -Category InvalidOperation -Target $foo -Continue
```

Depending on whether $EnableException is true or false it will:
- Throw a bloody terminating error.
Game over.
- Write a nice warning about how Foo failed bar, then call continue to process the next item in the loop.
In both cases, the error record added to $error will have the content of $foo added, the better to figure out what went wrong.

## PARAMETERS

### -Message
A message to pass along, explaining just what the error was.

```yaml
Type: String
Parameter Sets: Message
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -String
A stored string to use to write the log.
Used in combination with the localization component.
For more details see the help on Import-PSFLocalizedString and Get-PSFLocalizedString.

```yaml
Type: String
Parameter Sets: String
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StringValues
Values to format into the localized string referred to in the -String parameter.

```yaml
Type: Object[]
Parameter Sets: String
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableException
Replaces user friendly yellow warnings with bloody red exceptions of doom!
Use this if you want the function to throw terminating errors you want to catch.

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

### -Category
What category does this termination belong to?
Is automatically set when passing an error record.
Helps with differentiating exceptions without having to resort to text parsing.

```yaml
Type: ErrorCategory
Parameter Sets: (All)
Aliases:
Accepted values: NotSpecified, OpenError, CloseError, DeviceError, DeadlockDetected, InvalidArgument, InvalidData, InvalidOperation, InvalidResult, InvalidType, MetadataError, NotImplemented, NotInstalled, ObjectNotFound, OperationStopped, OperationTimeout, SyntaxError, ParserError, PermissionDenied, ResourceBusy, ResourceExists, ResourceUnavailable, ReadError, WriteError, FromStdErr, SecurityError, ProtocolError, ConnectionError, AuthenticationError, LimitsExceeded, QuotaExceeded, NotEnabled

Required: False
Position: Named
Default value: NotSpecified
Accept pipeline input: False
Accept wildcard characters: False
```

### -ErrorRecord
An option to include an inner exception in the error record (and in the exception thrown, if one is thrown).
Use this, whenever you call Stop-PSFFunction in a catch block.

Note:
Pass the full error record, not just the exception.

```yaml
Type: ErrorRecord[]
Parameter Sets: (All)
Aliases: InnerErrorRecord

Required: False
Position: Named
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
The name of the function to crash.
This parameter is very optional, since it automatically selects the name of the calling function.
The function name is used as part of the errorid.
That in turn allows easily figuring out, which exception belonged to which function when checking out the $error variable.

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

### -ModuleName
The name of the module, the function to be crashed is part of.
This parameter is very optional, since it automatically selects the name of the calling function.

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

### -File
The file in which Stop-PSFFunction was called.
Will be automatically set, but can be overridden when necessary.

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

### -Line
The line on which Stop-PSFFunction was called.
Will be automatically set, but can be overridden when necessary.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
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
The object that was processed when the error was thrown.
For example, if you were trying to process a Database Server object when the processing failed, add the object here.
This object will be in the error record (which will be written, even in non-silent mode, just won't show it).
If you specify such an object, it becomes simple to actually figure out, just where things failed at.

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

### -Continue
This will cause the function to call continue while not running with exceptions enabled (-EnableException).
Useful when mass-processing items where an error shouldn't break the loop.

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

### -SilentlyContinue
This will cause the function to call continue while running with exceptions enabled (-EnableException).
Useful when mass-processing items where an error shouldn't break the loop.

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

### -ContinueLabel
When specifying a label in combination with "-Continue" or "-SilentlyContinue", this function will call continue with this specified label.
Helpful when trying to continue on an upper level named loop.

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

### -Cmdlet
The $PSCmdlet object of the calling command.
Used to write exceptions in a more hidden manner, avoiding exposing internal script text in the default message display.

```yaml
Type: PSCmdlet
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StepsUpward
When not throwing an exception and not calling continue, Stop-PSFFunction signals the calling command to stop.
In some cases you may want to signal a step or more further up the chain (notably from helper functions within a function).
This parameter allows you to add additional steps up the callstack that it will notify.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

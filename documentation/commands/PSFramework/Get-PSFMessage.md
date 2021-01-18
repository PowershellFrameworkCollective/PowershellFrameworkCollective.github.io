---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Get-PSFMessage

## SYNOPSIS
Returns log entries for the PSFramework

## SYNTAX

```
Get-PSFMessage [[-FunctionName] <String>] [[-ModuleName] <String>] [[-Target] <Object>] [[-Tag] <String[]>]
 [[-Last] <Int32>] [[-Skip] <Int32>] [[-Runspace] <Guid>] [[-Level] <MessageLevel[]>] [-Errors]
 [<CommonParameters>]
```

## DESCRIPTION
Returns log entries for the PSFramework.
Handy when debugging or developing a script using it.

## EXAMPLES

### EXAMPLE 1
```
Get-PSFMessage
```

Returns all log entries currently in memory.

### EXAMPLE 2
```
Get-PSFMessage -Target "a" -Last 1 -Skip 1
```

Returns all log entries that targeted the object "a" in the second last execution sent.

### EXAMPLE 3
```
Get-PSFMessage -Tag "fail" -Last 5
```

Returns all log entries within the last 5 executions that contained the tag "fail"

## PARAMETERS

### -FunctionName
Default: "*"
Only messages written by similar functions will be returned.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -ModuleName
Default: "*"
Only messages written by commands from similar modules will be returned.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Target
Only messages handling the specified target will be returned.

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

### -Tag
Only messages containing one of these tags will be returned.

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

### -Last
Only messages written by the last X executions will be returned.
Uses Get-History to determine execution.
Ignores Get-PSFmessage commands.
By default, this will also include messages from other runspaces.
If your command executes in parallel, that's useful.
If it doesn't and you were offloading executions to other runspaces, consider also filtering by runspace using '-Runspace'

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Skip
How many executions to skip when specifying '-Last'.
Has no effect without the '-Last' parameter.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Runspace
The guid of the runspace to return messages from.
By default, messages from all runspaces are returned.
Run the following line to see the list of guids:

Get-Runspace | ft Id, Name, InstanceId -Autosize

```yaml
Type: Guid
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Level
Limit the message selection by level.
Message levels have a numeric value, making it easier to select a range:

  -Level (1..6)

Will select the first 6 levels (Critical - SomewhatVerbose).

```yaml
Type: MessageLevel[]
Parameter Sets: (All)
Aliases:
Accepted values: Critical, Important, Output, Host, Significant, VeryVerbose, Verbose, SomewhatVerbose, System, Debug, InternalComment, Warning, Error

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Errors
Instead of log entries, the error entries will be retrieved

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

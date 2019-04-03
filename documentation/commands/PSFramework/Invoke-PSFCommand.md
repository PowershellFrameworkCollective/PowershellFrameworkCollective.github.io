---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Invoke-PSFCommand

## SYNOPSIS
An Invoke-Command wrapper with integrated session management.

## SYNTAX

```
Invoke-PSFCommand [[-ComputerName] <ComputerParameter[]>] [-ScriptBlock] <ScriptBlock>
 [[-ArgumentList] <Object[]>] [[-Credential] <PSCredential>] [-HideComputerName] [[-ThrottleLimit] <Int32>]
 [<CommonParameters>]
```

## DESCRIPTION
This wrapper command around Invoke-Command allows conveniently calling remote calls.

- It uses the PSFComputer parameter class, and is thus a lot more flexible in accepted input
- It automatically reuses sessions specified for input
- It automatically establishes new sessions, tracks usage and retires sessions that have timed out.

Using this command, it is no longer necessary to first establish a connection and then manually handle the session object.
Just point the command at the computer and it will remember.
It also reuses sessions across multiple commands that call it.

Note:
Special connection conditions (like a custom application name, alternative authentication schemes, etc.) are not supported and require using New-PSSession to establish the connection.
Once that session has been established, the session object can be used with this command and will be used for command invocation.

## EXAMPLES

### EXAMPLE 1
```
Invoke-PSFCommand -ScriptBlock $ScriptBlock
```

Runs the $scriptblock against the local computer.

### EXAMPLE 2
```
Invoke-PSFCommand -ScriptBlock $ScriptBlock (Get-ADComputer -Filter "name -like 'srv-db*'")
```

Runs the $scriptblock against all computers in AD with a name that starts with "srv-db".

## PARAMETERS

### -ComputerName
The computer(s) to invoke the command on.
Accepts all kinds of things that legally point at a computer, including DNS names, ADComputer objects, IP Addresses, SQL Server connection strings, CimSessions or PowerShell Sessions.
It will reuse PSSession objects if specified (and not include them in its session management).

```yaml
Type: ComputerParameter[]
Parameter Sets: (All)
Aliases: Session

Required: False
Position: 1
Default value: $env:COMPUTERNAME
Accept pipeline input: False
Accept wildcard characters: False
```

### -ScriptBlock
The code to execute.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ArgumentList
The arguments to pass into the scriptblock.

```yaml
Type: Object[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
Credentials to use when establishing connections.
Note: These will be ignored if there already exists an established connection.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HideComputerName
Indicates that this cmdlet omits the computer name of each object from the output display.
By default, the name of the computer that generated the object appears in the display.

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

### -ThrottleLimit
Specifies the maximum number of concurrent connections that can be established to run this command.
If you omit this parameter or enter a value of 0, the default value, 32, is used.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: 32
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Write-PSFMessageProxy

## SYNOPSIS
A proxy command that allows smoothly redirecting messages to Write-PSFMessage.

## SYNTAX

```
Write-PSFMessageProxy [[-Message] <String>] [-NoNewline] [-Separator <Object>]
 [-ForegroundColor <ConsoleColor>] [-BackgroundColor <ConsoleColor>] [-Tags <String[]>] [<CommonParameters>]
```

## DESCRIPTION
This function is designed to pick up the alias it was called by and to redirect the message that was sent to Write-PSFMessage.
For example, by creating an alias for Write-Host pointing at 'Write-PSFMessageProxy' will cause it to redirect the message at 'Important' level (which is written to host by default, but also logged).

By creating those aliases, it becomes easy to shift current scripts to use the logging, without having to actually update the code.

## EXAMPLES

### EXAMPLE 1
```
Write-PSFMessageProxy "Example Message"
```

Will write the message "Example Message" to verbose.

### EXAMPLE 2
```
Set-Alias Write-Host Write-PSFMessageProxy
```

PS C:\\\> Write-Host "Example Message"

This will create an alias named "Write-Host" pointing at "Write-PSFMessageProxy".
Then it will write the message "Example Message", which is automatically written to Level "Important" (which by default will be written to host).

## PARAMETERS

### -Message
The message to write.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Object, MessageData

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoNewline
Dummy parameter to make Write-Host redirection happy.
IT WILL BE IGNORED!

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

### -Separator
Dummy parameter to make Write-Host redirection happy.
IT WILL BE IGNORED!

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

### -ForegroundColor
Configure the foreground color for host messages.

```yaml
Type: ConsoleColor
Parameter Sets: (All)
Aliases:
Accepted values: Black, DarkBlue, DarkGreen, DarkCyan, DarkRed, DarkMagenta, DarkYellow, Gray, DarkGray, Blue, Green, Cyan, Red, Magenta, Yellow, White

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BackgroundColor
Dummy parameter to make Write-Host redirection happy.
IT WILL BE IGNORED!

```yaml
Type: ConsoleColor
Parameter Sets: (All)
Aliases:
Accepted values: Black, DarkBlue, DarkGreen, DarkCyan, DarkRed, DarkMagenta, DarkYellow, Gray, DarkGray, Blue, Green, Cyan, Red, Magenta, Yellow, White

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tags
Add tags to the messages.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Proxied
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

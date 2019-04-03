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
Write-PSFMessageProxy [[-Message] <String>] [<CommonParameters>]
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
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

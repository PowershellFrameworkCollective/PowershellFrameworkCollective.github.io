---
external help file: MailDaemon-help.xml
Module Name: MailDaemon
online version:
schema: 2.0.0
---

# Add-MDMailContent

## SYNOPSIS
Adds content to a pending email.

## SYNTAX

```
Add-MDMailContent [[-Body] <String>] [[-Attachments] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Adds content to a pending email.
Use this command to incrementally add to the mail sent.

## EXAMPLES

### EXAMPLE 1
```
Add-MDMailContent -Body "Phase 3: Completed"
```

Adds the line "Phase 3: Completed" to the email body.

## PARAMETERS

### -Body
Add text to the mail body.

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

### -Attachments
Add files to the list of files to send.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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

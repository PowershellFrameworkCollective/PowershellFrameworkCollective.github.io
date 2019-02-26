---
external help file: MailDaemon-help.xml
Module Name: MailDaemon
online version:
schema: 2.0.0
---

# Send-MDMail

## SYNOPSIS
Queues current email for delivery.

## SYNTAX

```
Send-MDMail [-TaskName] <String> [<CommonParameters>]
```

## DESCRIPTION
Uses the data prepared by Set-MDMail or Add-MDMailContent and queues the email for delivery.

## EXAMPLES

### EXAMPLE 1
```
Send-MDMail -TaskName "Logrotate"
```

Queues the currently prepared email under the name "Logrotate"

## PARAMETERS

### -TaskName
Name of the task that is sending the email.
Used in the name of the file used to queue messages in order to reduce likelyhood of accidental clash.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

---
external help file: MailDaemon-help.xml
Module Name: MailDaemon
online version:
schema: 2.0.0
---

# Invoke-MDDaemon

## SYNOPSIS
Processes the email queue and sends emails

## SYNTAX

```
Invoke-MDDaemon [<CommonParameters>]
```

## DESCRIPTION
Processes the email queue and sends emails.
Should be scheduled using a scheduled task.
Recommended Setting:
- Launch on boot with delay
- Launch on Midnight
- Repeat every 30 minutes for one day

## EXAMPLES

### EXAMPLE 1
```
Invoke-MDDaemon
```

Processes the email queue and sends emails

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

---
external help file: MailDaemon-help.xml
Module Name: MailDaemon
online version:
schema: 2.0.0
---

# Set-MDDaemon

## SYNOPSIS
Configures the Daemon settings on the target computer(s)

## SYNTAX

```
Set-MDDaemon [[-PickupPath] <String>] [[-SentPath] <String>] [[-MailSentRetention] <TimeSpan>]
 [[-SmtpServer] <String>] [[-SenderDefault] <String>] [[-RecipientDefault] <String>]
 [[-SenderCredentialPath] <String>] [[-ComputerName] <ComputerParameter[]>] [[-Credential] <PSCredential>]
 [<CommonParameters>]
```

## DESCRIPTION
Command that governs the Mail Daemon settings.

## EXAMPLES

### EXAMPLE 1
```
Set-MDDaemon -PickupPath 'C:\MailDaemon\Pickup'
```

Updates the configuration to now pickup incoming emails from 'C:\MailDaemon\Pickup'.
Will not move pending email jobs.

## PARAMETERS

### -PickupPath
The folder in which emails are queued for delivery.

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

### -SentPath
The folder in which emails that were successfully sent are stored for a specified time before being deleted.

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

### -MailSentRetention
The time to keep successfully sent emails around.

```yaml
Type: TimeSpan
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SmtpServer
The mailserver to use for sending emails.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SenderDefault
The default email address to use as sender.
This is used for mails queued by a task that did not specify a sender.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RecipientDefault
Default email address to send the email to, if the individual script queuing the email does not specify one.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SenderCredentialPath
The path to where the credentials file can be found, that should be used by the daemon.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ComputerName
The computer(s) to work against.
Defaults to localhost, but can be used to update the module settings across a wide range of computers.

```yaml
Type: ComputerParameter[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: $env:COMPUTERNAME
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Credential
The credentials to use when connecting to computers.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
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

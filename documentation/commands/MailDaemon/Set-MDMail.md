---
external help file: MailDaemon-help.xml
Module Name: MailDaemon
online version:
schema: 2.0.0
---

# Set-MDMail

## SYNOPSIS
Changes properties for the upcoming mail to queue.

## SYNTAX

```
Set-MDMail [[-From] <String>] [[-To] <String>] [[-Cc] <String[]>] [[-Subject] <String>] [[-Body] <String>]
 [-BodyAsHtml] [[-Attachments] <String>] [-RemoveAttachments] [[-NotBefore] <DateTime>] [<CommonParameters>]
```

## DESCRIPTION
This command sets up the email to send, configuring properties such as the sender, recipient or content.

## EXAMPLES

### EXAMPLE 1
```
Set-MDMail -From 'script@contoso.com' -To 'support@contoso.com' -Subject 'Daily Update Report' -Body $body
```

Sends an email as script@contoso.com to support@contoso.com, reporting on the daily update status.

## PARAMETERS

### -From
The email address of the sender.

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

### -To
The email address to send to.

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

### -Cc
Additional addresses to keep in the information flow.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Subject
The subject to send the email under.

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

### -Body
The body of the email to send.
You can individually add content to the body using Add-MDMailContent.

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

### -BodyAsHtml
Whether the body is to be understood as html text.

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

### -Attachments
Any attachments to send.
Avoid sending large attachments with emails.
You can individually add attachments to the email using Add-MDMailContent (using this parameter will replace attachments sent).

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

### -RemoveAttachments
After sending the email, remove the attachments sent.
Use this to have the system clean up temporary files you wrote before sending this report.

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

### -NotBefore
Do not send this email before this timestamp has come to pass.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
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

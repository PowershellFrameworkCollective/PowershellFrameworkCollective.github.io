---
external help file: MailDaemon-help.xml
Module Name: MailDaemon
online version:
schema: 2.0.0
---

# Install-MDDaemon

## SYNOPSIS
Configures a computer for using the Mail Daemon

## SYNTAX

```
Install-MDDaemon [[-ComputerName] <ComputerParameter[]>] [[-Credential] <PSCredential>] [-NoTask]
 [[-TaskUser] <PSCredential>] [[-PickupPath] <String>] [[-SentPath] <String>] [[-DaemonUser] <String>]
 [[-WriteUser] <String[]>] [[-MailSentRetention] <TimeSpan>] [[-SmtpServer] <String>]
 [[-SenderDefault] <String>] [[-SenderCredential] <PSCredential>] [[-RecipientDefault] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Configures a computer for using the Mail Daemon.
This can include:
- Installing the scheduled task
- Creating folder and permission structure
- Setting up the mail daemon configuration

This action can be performed both locally or against remote computers

## EXAMPLES

### EXAMPLE 1
```
Install-MDDaemon -ComputerName DC1, DC2, DC3 -TaskUser $cred -DaemonUser "DOMAIN\MailDaemon" -SmtpServer 'mail.domain.org' -SenderDefault 'daemon@domain.org' -RecipientDefault 'helpdesk-t2@domain.org'
```

Configures the mail daemon NoTask on the servers DC1, DC2 and DC3

## PARAMETERS

### -ComputerName
The computer(s) to work against.
Defaults to localhost, but can be used to install the module and set up the task across a wide range of computers.

```yaml
Type: ComputerParameter[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoTask
Create the scheduled task.

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

### -TaskUser
The credentials of the user the scheduled task will be executed as.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PickupPath
The folder in which emails are queued for delivery.

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

### -SentPath
The folder in which emails that were successfully sent are stored for a specified time before being deleted.

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

### -DaemonUser
The user to grant permissions needed to function as the Daemon account.
This grants read/write access to all working folders.

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

### -WriteUser
The user/group to grant permissions to needed to queue email.
This grants write-only access to the mail inbox.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
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
Position: 8
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
Position: 9
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
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SenderCredential
The credentials to use to send emails.
Will be stored in an encrypted file that can only be opened by the taskuser and from the computer it is installed on.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
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
Position: 12
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

---
external help file: MailDaemon-help.xml
Module Name: MailDaemon
online version:
schema: 2.0.0
---

# Save-MDCredential

## SYNOPSIS
Stores credentials securely for use by the specified account.

## SYNTAX

```
Save-MDCredential [-TargetCredential] <PSCredential> [-Path] <String> [[-AccessAccount] <PSCredential>]
 [[-ComputerName] <ComputerParameter[]>] [[-Credential] <PSCredential>] [<CommonParameters>]
```

## DESCRIPTION
This command encrypts credentials to a protected credentials file in the file system.
This is designed to allow storing credential objects for use by scheduled task that run as SYSTEM or a service account.

## EXAMPLES

### EXAMPLE 1
```
Save-MDCredential -ComputerName DC1,DC2,DC3 -TargetCredential $cred -Path "C:\ProgramData\PowerShell\Tasks\tesk1_credential.clixml"
```

Saves the credentials stored in $cred on the computers DC1, DC2, DC3 for use by the SYSTEM account

## PARAMETERS

### -TargetCredential
The credentials to encrypt and write to file.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
The path where to store the credential.
Always considered as local path from the computer it is registered on.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AccessAccount
The account that should have access to the credential.
Defaults to the system account.
Offer a full credentials object for a regular user account.

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

### -ComputerName
The computer(s) to write the credential to.

```yaml
Type: ComputerParameter[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: $env:COMPUTERNAME
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Credential
The credentials to use to authenticate to the target system.
NOT the credentials stored for reuse.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
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

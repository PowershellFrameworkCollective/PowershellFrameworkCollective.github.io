---
external help file: MailDaemon-help.xml
Module Name: MailDaemon
online version:
schema: 2.0.0
---

# Update-MDFolderPermission

## SYNOPSIS
Assigns permissions for the mail daemon working folders.

## SYNTAX

```
Update-MDFolderPermission [[-ComputerName] <ComputerParameter[]>] [[-Credential] <PSCredential>]
 [[-DaemonUser] <String>] [[-WriteUser] <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Assigns permissions for the mail daemon working folders.
Enables simple assignment of privileges in case regular accounts need to write to protected pickup paths and helps implementing least privilege.

## EXAMPLES

### EXAMPLE 1
```
Update-MDFolderPermission -DaemonUser 'domain\srv_server1mail$'
```

Grants Daemon User privileges on the local computer to the service account 'domain\srv_server1mail$'

## PARAMETERS

### -ComputerName
The computer(s) to work against.
Defaults to localhost.

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

### -DaemonUser
The user to grant the necessary access to manage submitted mail items.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WriteUser
Users that should be able to submit mails.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
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

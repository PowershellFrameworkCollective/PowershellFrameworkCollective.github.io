---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Register-PSFRunspace

## SYNOPSIS
Registers a scriptblock to run in the background.

## SYNTAX

```
Register-PSFRunspace -ScriptBlock <ScriptBlock> -Name <String> [-NoMessage] [<CommonParameters>]
```

## DESCRIPTION
This function registers a scriptblock to run in separate runspace.
This is different from most runspace solutions, in that it is designed for permanent background tasks that need to be done.
It guarantees a single copy of the task to run within the powershell process, even when running the same module in many runspaces in parallel.

The scriptblock must be built with some rules in mind, for details on using this system run:
Get-Help about_psf_runspace

Updating:
If this function is called multiple times, targeting the same name, it will update the scriptblock.
- If that scriptblock is the same as the previous scriptblock, nothing changes
- If that scriptblock is different from the previous ones, it will be registered, but will not be executed right away!
  Only after stopping and starting the runspace will it operate under the new scriptblock.

## EXAMPLES

### EXAMPLE 1
```
Register-PSFRunspace -ScriptBlock $scriptBlock -Name 'mymodule.maintenance'
```

Registers the script defined in $scriptBlock under the name 'mymodule.maintenance'
It does not start the runspace yet.
If it already exists, it will overwrite the scriptblock without affecting the running script.

### EXAMPLE 2
```
Register-PSFRunspace -ScriptBlock $scriptBlock -Name 'mymodule.maintenance'
```

PS C:\\\> Start-PSFRunspace -Name 'mymodule.maintenance'

Registers the script defined in $scriptBlock under the name 'mymodule.maintenance'
Then it starts the runspace, running the registered $scriptBlock

## PARAMETERS

### -ScriptBlock
The scriptblock to run in a dedicated runspace.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The name to register the scriptblock under.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoMessage
Setting this will prevent messages be written to the message / logging system.
This is designed to make the PSFramework not flood the log on each import.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Import-PSFCmdlet

## SYNOPSIS
Loads a cmdlet into the current context.

## SYNTAX

```
Import-PSFCmdlet [-Name] <String> [-Type] <Type> [[-HelpFile] <String>] [[-Module] <PSModuleInfo>]
 [<CommonParameters>]
```

## DESCRIPTION
Loads a cmdlet into the current context.
This can be used to register a cmdlet during module import, making it easy to have hybrid modules publishing both cmdlets and functions.
Can also be used to register cmdlets written in PowerShell classes.

## EXAMPLES

### EXAMPLE 1
```
Import-PSFCmdlet -Name Get-Something -Type ([GetSomethingCommand])
```

Imports the Get-Something cmdlet into the current context.

### EXAMPLE 2
```
Import-PSFCmdlet -Name Get-Something -Type ([GetSomethingCommand]) -Module (Get-Module PSReadline)
```

Imports the Get-Something cmdlet into the PSReadline module.

## PARAMETERS

### -Name
The name of the cmdlet to register.

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

### -Type
The type of the class implementing the cmdlet.

```yaml
Type: Type
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HelpFile
Path to the help XML containing the help for the cmdlet.

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

### -Module
Module to inject the cmdlet into.

```yaml
Type: PSModuleInfo
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Original Author: Chris Dent
Link: https://www.indented.co.uk/cmdlets-without-a-dll/

## RELATED LINKS

---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# New-PSFSessionContainer

## SYNOPSIS
Creates an object containing multiple session objects to the same computer.

## SYNTAX

```
New-PSFSessionContainer [-ComputerName] <ComputerParameter> [-Session] <Object[]> [-EnableException]
 [<CommonParameters>]
```

## DESCRIPTION
Creates an object containing multiple session objects to the same computer.
Using this, a single object can be used to point at a computer while containing session objects for multiple protocols inside.

Only session types registered via Reigster-PSSessionObjectType are supported.

## EXAMPLES

### EXAMPLE 1
```
New-PSFSessionContainer -ComputerName "server1" -Session $pssession, $cimsession, $smosession
```

Create a session container containing three different kinds of session objects

## PARAMETERS

### -ComputerName
The name of the computer to connect to

```yaml
Type: ComputerParameter
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Session
The session objects that are a live connection to the host.

```yaml
Type: Object[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -EnableException
This parameters disables user-friendly warnings and enables the throwing of exceptions.
This is less user friendly, but allows catching exceptions in calling scripts.

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

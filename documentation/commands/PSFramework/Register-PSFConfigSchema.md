---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Register-PSFConfigSchema

## SYNOPSIS
Register new schemas for ingersting configuration data.

## SYNTAX

```
Register-PSFConfigSchema [[-Name] <String>] [[-Schema] <ScriptBlock>] [<CommonParameters>]
```

## DESCRIPTION
Register new schemas for ingersting configuration data.
This can be used to dynamically extend the configuration system and add new file types as supported input.

## EXAMPLES

### EXAMPLE 1
```
Register-PSFConfigSchema -Name Default -Schema $scriptblock
```

Registers the scriptblock stored in $scriptblock under 'Default'

## PARAMETERS

### -Name
The name of the Schema to register.

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

### -Schema
The Schema Code to register.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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

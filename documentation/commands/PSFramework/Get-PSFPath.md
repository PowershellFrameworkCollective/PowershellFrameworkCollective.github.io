---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Get-PSFPath

## SYNOPSIS
Access a configured path.

## SYNTAX

```
Get-PSFPath [-Name] <String> [<CommonParameters>]
```

## DESCRIPTION
Access a configured path.
Paths can be configured using Set-PSFPath or using the configuration system.
To register a path using the configuration system create a setting key named like this:
"PSFramework.Path.\<PathName\>"
For example the following setting points at the temp path:
"PSFramework.Path.Temp"

## EXAMPLES

### EXAMPLE 1
```
Get-PSFPath -Name 'temp'
```

Returns the temp path.

## PARAMETERS

### -Name
Name of the path to retrieve.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Register-PSFTeppArgumentCompleter

## SYNOPSIS
Registers a parameter for a prestored Tepp.

## SYNTAX

```
Register-PSFTeppArgumentCompleter [-Command] <String[]> [-Parameter] <String[]> [-Name] <String>
 [<CommonParameters>]
```

## DESCRIPTION
Registers a parameter for a prestored Tepp.
This function allows easily registering a function's parameter for Tepp in the function-file, rather than in a centralized location.

## EXAMPLES

### EXAMPLE 1
```
Register-PSFTeppArgumentCompleter -Command Get-Test -Parameter Example -Name MyModule.Example
```

Registers the parameter 'Example' of the command 'Get-Test' to receive the tab completion registered to 'MyModule.Example'

## PARAMETERS

### -Command
Name of the command whose parameter should receive Tepp.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Parameter
Name of the parameter that should be Tepp'ed.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Name of the Tepp Completioner to use.
Use the same name as was assigned in Register-PSFTeppScriptblock (which needs to be called first).

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
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

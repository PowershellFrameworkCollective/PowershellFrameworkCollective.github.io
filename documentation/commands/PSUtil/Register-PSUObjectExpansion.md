---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Register-PSUObjectExpansion

## SYNOPSIS
Registers a custom scriptblock for a type when processed by Expand-PSUObject.

## SYNTAX

```
Register-PSUObjectExpansion [-TypeName] <String> [-ScriptBlock] <ScriptBlock> [<CommonParameters>]
```

## DESCRIPTION
Registers a custom scriptblock for a type when processed by Expand-PSUObject.

Expand-PSUObject enables accelerated object expansion,
by shortening the "Select-Object -ExpandProperty" call to "exp".
It further has a list of default properties to expand,
but it also allows implementing custom expansion rules, based on input type.

This commands sets up these custom expansion rules.
Define a scriptblock, it receives a single parameter - the input object to expand.
The scriptblock is then responsible for expanding it and producing the desired output.

## EXAMPLES

### EXAMPLE 1
```
Register-PSUObjectExpansion -TypeName 'MyModule.MyClass' -ScriptBlock $ScriptBlock
```

Sets up a custom expansion rule for the 'MyModule.MyClass' class.

## PARAMETERS

### -TypeName
The name of the type to custom-expand.

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

### -ScriptBlock
The scriptblock performing the expansion.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: True
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

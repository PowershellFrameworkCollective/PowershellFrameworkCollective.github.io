---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Register-PSFArgumentTransformationScriptblock

## SYNOPSIS
Registers an input conversion scriptblock for use in Parameter Binding.

## SYNTAX

```
Register-PSFArgumentTransformationScriptblock [-Name] <String> [-Scriptblock] <ScriptBlock>
 [<CommonParameters>]
```

## DESCRIPTION
Registers an input conversion scriptblock for use in Parameter Binding.
It receives exactly one input - the parameter input to convert.
The scriptblock is expected to return the result in the expected type - only the first value returned is used.

If this conversion failes, it will still try to convert it with the default PowerShell type conversion.

The scriptblock registered here can later be referenced in your commands as a parameter attribute like this:
\[PsfScriptTransformation("MyModule.User", \[MyModule.User\])\]

- The first value is the name specified here.
- The second value is the expected data type.

## EXAMPLES

### EXAMPLE 1
```
Register-PSFArgumentTransformationScriptblock -Name MyModule.User -Scriptblock $conversion
```

Registers the input conversion as defined in $conversion under "MyModule.User"

## PARAMETERS

### -Name
Name of the scriptblock.
The name can be arbitrary, but naming should consider the potential to conflict with other modules.

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

### -Scriptblock
The script logic performing the conversion.

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

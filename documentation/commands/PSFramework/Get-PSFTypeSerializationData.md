---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Get-PSFTypeSerializationData

## SYNOPSIS
Creates a type extension XML for serializing an object

## SYNTAX

```
Get-PSFTypeSerializationData [[-InputObject] <Object[]>] [[-Mode] <String>] [-Fragment]
 [[-Serializer] <String>] [[-Method] <String>] [<CommonParameters>]
```

## DESCRIPTION
Creates a type extension XML for serializing an object
Use this to register a type with a type serializer, so it will retain its integrity across process borders.

This is relevant in order to have an object retain its type when ...
- sending it over PowerShell Remoting
- writing it to file via Export-Clixml and reading it later via Import-Clixml

Note:
In the default serializer, all types registered must:
- Have all public properties be read & writable (the write needs not do anything, but it must not throw an exception).
- All non-public properties will be ignored.
- Come from an Assembly with a static name (like an existing dll file, not compiled at runtime).

## EXAMPLES

### EXAMPLE 1
```
Get-PSFTypeSerializationData -InputObject 'My.Custom.Type'
```

Generates an XML text that can be used to register via Update-TypeData.

## PARAMETERS

### -InputObject
The type to serialize.
- Accepts a type object
- The string name of the type
- An object, whose type will then be determined

```yaml
Type: Object[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Mode
Whether all types listed should be generated as a single definition ('Grouped'; default) or as one definition per type.
Since multiple files have worse performance, it is generally recommended to group them all in a single file.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Grouped
Accept pipeline input: False
Accept wildcard characters: False
```

### -Fragment
By setting this, the type XML is emitted without the outer XML shell, containing only the \<Type\> node(s).
Use this if you want to add the output to existing type extension xml.

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

### -Serializer
The serializer to use for the conversion.
By default, the PSFramework serializer is used, which should work well enough, but requires the PSFramework to be present.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: PSFramework.Serialization.SerializationTypeConverter
Accept pipeline input: False
Accept wildcard characters: False
```

### -Method
The serialization method to use.
By default, the PSFramework serialization method is used, which should work well enough, but requires the PSFramework to be present.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: GetSerializationData
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

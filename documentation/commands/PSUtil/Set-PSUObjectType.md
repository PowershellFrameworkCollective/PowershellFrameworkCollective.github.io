---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Set-PSUObjectType

## SYNOPSIS
Tries to convert an object from one type of another.

## SYNTAX

### String (Default)
```
Set-PSUObjectType [-InputObject <Object>] [[-TypeName] <String>] [-EnableException] [<CommonParameters>]
```

### Type
```
Set-PSUObjectType [-InputObject <Object>] [-Type <Type>] [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Tries to convert an object from one type of another.

## EXAMPLES

### EXAMPLE 1
```
"01", "02", "03", "42" | Set-PSUObjectType "int"
```

Tries to convert strings with numeric values into pure integers (hint: This will probably succeede).

## PARAMETERS

### -InputObject
The objects to convert.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Type
ParSet: Type
The type to cast to.

```yaml
Type: Type
Parameter Sets: Type
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TypeName
ParSet: String
The type to cast to.

```yaml
Type: String
Parameter Sets: String
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableException
Replaces user friendly yellow warnings with bloody red exceptions of doom!
Use this if you want the function to throw terminating errors you want to catch.

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

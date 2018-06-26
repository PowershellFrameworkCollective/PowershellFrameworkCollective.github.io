---
external help file: PSUtil-help.xml
Module Name: PSUtil
online version:
schema: 2.0.0
---

# Select-PSUObject

## SYNOPSIS
Wrapper around Select-Object, extends property parameter.

## SYNTAX

### DefaultParameter (Default)
```
Select-PSUObject [-InputObject <PSObject>] [[-Property] <SelectParameter[]>] [-ExcludeProperty <String[]>]
 [-ExpandProperty <String>] [-Unique] [-Last <Int32>] [-First <Int32>] [-Skip <Int32>] [-Wait]
 [<CommonParameters>]
```

### SkipLastParameter
```
Select-PSUObject [-InputObject <PSObject>] [[-Property] <SelectParameter[]>] [-ExcludeProperty <String[]>]
 [-ExpandProperty <String>] [-Unique] [-SkipLast <Int32>] [<CommonParameters>]
```

### IndexParameter
```
Select-PSUObject [-InputObject <PSObject>] [-Unique] [-Wait] [-Index <Int32[]>] [<CommonParameters>]
```

## DESCRIPTION
Wrapper around Select-Object, extends property parameter.

This function allows specifying in-line transformation of the prioperties specified without needing to use complex hashtables.
Without removing the ability to specify just those hashtables.

See the description of the Property parameter for an exhaustive list of legal notations.

## EXAMPLES

### EXAMPLE 1
```
Get-ChildItem | Select-PSUObject *, "Length as Size size MB:2:1"
```

Selects all properties from the input objects ...
- adding a new property named "Size" ...
- With the Length property recalculated to MB ...
- With 2 decimals ...
- With the size identifier attached

### EXAMPLE 2
```
Get-ChildItem | Select-PSUObject *, "Length as RemoteLength from remotefiles where Name = Name"
```

Selects all properties from the input objects ...
- Adding a new property named "RemoteLength" ...
- Which is picked from the object stored in the variable $remotefiles that has the same name as the input object

## PARAMETERS

### -InputObject
The object(s) to select from.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Property
The properties to select.
- Supports hashtables, which will be passed through to Select-Object.
- Supports renaming as it is possible in SQL: "Length AS Size" will select the Length property but rename it to size.
- Supports casting to a specified type: "Address to IPAddress" or "Length to int".
Uses PowerShell type-conversion.
- Supports parsing numbers to sizes: "Length size GB:2" Converts numeric input (presumed to be bytes) to gigabyte with two decimals.
  Also supports toggling on Unit descriptors by adding another element: "Length size GB:2:1"
- Supports selecting properties from objects in other variables: "ComputerName from VarName" (Will insert the property 'ComputerName' from variable $VarName)
- Supports filtering when selecting from outside objects: "ComputerName from VarName where ObjectId = Id" (Will insert the property 'ComputerName' from the object in variable $VarName, whose ObjectId property is equal to the inputs Id property)

```yaml
Type: SelectParameter[]
Parameter Sets: DefaultParameter, SkipLastParameter
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeProperty
Properties to not list.

```yaml
Type: String[]
Parameter Sets: DefaultParameter, SkipLastParameter
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExpandProperty
Properties to expand.

```yaml
Type: String
Parameter Sets: DefaultParameter, SkipLastParameter
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Unique
Do not list multiples of the same value.

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

### -Last
Select the last n items.

```yaml
Type: Int32
Parameter Sets: DefaultParameter
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -First
Select the first n items.

```yaml
Type: Int32
Parameter Sets: DefaultParameter
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Skip
Skip the first (or last if used with -Last) n items.

```yaml
Type: Int32
Parameter Sets: DefaultParameter
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkipLast
Skip the last n items.

```yaml
Type: Int32
Parameter Sets: SkipLastParameter
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Wait
Indicates that the cmdlet turns off optimization.Windows PowerShell runs commands in the order that they appear in the command pipeline and lets them generate all objects.
By default, if you include a Select-Object command with the First or Index parameters in a command pipeline, Windows PowerShell stops the command that generates the objects as soon as the selected number of objects is generated.

```yaml
Type: SwitchParameter
Parameter Sets: DefaultParameter, IndexParameter
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Index
Specifies an array of objects based on their index values.
Enter the indexes in a comma-separated list.

```yaml
Type: Int32[]
Parameter Sets: IndexParameter
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

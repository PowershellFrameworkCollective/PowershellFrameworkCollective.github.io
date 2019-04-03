---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Select-PSFPropertyValue

## SYNOPSIS
Expand specific property values based on selection logic.

## SYNTAX

### Default (Default)
```
Select-PSFPropertyValue [-Property] <String[]> [-InputObject <Object>] [<CommonParameters>]
```

### Fallback
```
Select-PSFPropertyValue [-Property] <String[]> [-Fallback] [-InputObject <Object>] [<CommonParameters>]
```

### Select
```
Select-PSFPropertyValue [-Property] <String[]> [-Select <String>] [-InputObject <Object>] [<CommonParameters>]
```

### Join
```
Select-PSFPropertyValue [-Property] <String[]> [-JoinBy <String>] [-InputObject <Object>] [<CommonParameters>]
```

### Format
```
Select-PSFPropertyValue [-Property] <String[]> [-FormatWith <String>] [-InputObject <Object>]
 [<CommonParameters>]
```

## DESCRIPTION
This command allows picking a set of properties and then returning ...
- All their values
- The value that meets specific rules
- A composite value

## EXAMPLES

### EXAMPLE 1
```
Get-ADComputer -Filter * | Select-PSFPropertyValue -Property 'DNSHostName', 'Name' -Fallback
```

For each computer in the domain, it will pick the DNSHostName if available, otherwise the Name.

## PARAMETERS

### -Property
The properties to work with, in the order they should be considered.

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

### -Fallback
Whether to fall back on other properties if the first one doesn't contain values.
This picks the value of the first property that actually has a value.

```yaml
Type: SwitchParameter
Parameter Sets: Fallback
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Select
Select either the largest or lowest propertyvalue in the Propertynames specified.

```yaml
Type: String
Parameter Sets: Select
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -JoinBy
Joins the selected properties by the string specified.

```yaml
Type: String
Parameter Sets: Join
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FormatWith
Formats the selected properties into the specified format string.

```yaml
Type: String
Parameter Sets: Format
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
The object(s) whose properties to inspect.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

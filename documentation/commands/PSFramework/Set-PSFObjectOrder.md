---
external help file: PSFramework.dll-Help.xml
Module Name: PSFramework
online version: https://go.microsoft.com/fwlink/?LinkID=2097038
schema: 2.0.0
---

# Set-PSFObjectOrder

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

### Default (Default)
```
Set-PSFObjectOrder [-Stable] [-Descending] [-Unique] [-InputObject <PSObject>] [[-Property] <SortParameter[]>]
 [-Culture <String>] [-CaseSensitive] [<CommonParameters>]
```

### Top
```
Set-PSFObjectOrder [-Descending] [-Unique] -Top <Int32> [-InputObject <PSObject>]
 [[-Property] <SortParameter[]>] [-Culture <String>] [-CaseSensitive] [<CommonParameters>]
```

### Bottom
```
Set-PSFObjectOrder [-Descending] [-Unique] -Bottom <Int32> [-InputObject <PSObject>]
 [[-Property] <SortParameter[]>] [-Culture <String>] [-CaseSensitive] [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Bottom
{{ Fill Bottom Description }}

```yaml
Type: Int32
Parameter Sets: Bottom
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CaseSensitive
{{ Fill CaseSensitive Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Culture
{{ Fill Culture Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Descending
{{ Fill Descending Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
{{ Fill InputObject Description }}

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
{{ Fill Property Description }}

```yaml
Type: SortParameter[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Stable
{{ Fill Stable Description }}

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Top
{{ Fill Top Description }}

```yaml
Type: Int32
Parameter Sets: Top
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Unique
{{ Fill Unique Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Management.Automation.PSObject

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS

[https://go.microsoft.com/fwlink/?LinkID=2097038](https://go.microsoft.com/fwlink/?LinkID=2097038)


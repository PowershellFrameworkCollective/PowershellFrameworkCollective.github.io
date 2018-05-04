---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# New-PSMDFormatTableDefinition

## SYNOPSIS
Generates a format XML for the input type.

## SYNTAX

### default (Default)
```
New-PSMDFormatTableDefinition -InputObject <Object> [-IncludeProperty <String[]>] [-ExcludeProperty <String[]>]
 [-DocumentName <String>] [-SortColumns] [-ColumnOrder <String[]>] [-ColumnOrderHash <Hashtable[]>]
 [-ColumnTransformations <ColumnTransformation[]>] [<CommonParameters>]
```

### fragment
```
New-PSMDFormatTableDefinition -InputObject <Object> [-IncludeProperty <String[]>] [-ExcludeProperty <String[]>]
 [-Fragment] [-SortColumns] [-ColumnOrder <String[]>] [-ColumnOrderHash <Hashtable[]>]
 [-ColumnTransformations <ColumnTransformation[]>] [<CommonParameters>]
```

## DESCRIPTION
Generates a format XML for the input type.
Currently, only tables are supported.

Note:
Loading format files has a measureable impact on module import PER FILE.
For the sake of performance, you should only generate a single file for an entire module.

You can generate all items in a single call (which will probably be messy on many types at a time)
Or you can use the -Fragment parameter to create individual fragments, and combine them by passing
those items again to this command (the final time without the -Fragment parameter).

## EXAMPLES

### EXAMPLE 1
```
Get-ChildItem | New-PSMDFormatTableDefinition
```

Generates a format xml for the objects in the current path (files and folders in most cases)

### EXAMPLE 2
```
Get-ChildItem | New-PSMDFormatTableDefinition -IncludeProperty LastWriteTime, FullName
```

Creates a format xml that only includes the columns LastWriteTime, FullName

## PARAMETERS

### -InputObject
The object that will be used to generate the format XML for.
Will not duplicate its work if multiple object of the same type are passed.
Accepts objects generated when using the -Fragment parameter, combining them into a single document.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -IncludeProperty
Only properties in this list will be included.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeProperty
Only properties not in this list will be included.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Fragment
The function will only return a partial Format-XML object (an individual table definition per type).

```yaml
Type: SwitchParameter
Parameter Sets: fragment
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -DocumentName
Adds a name to the document generated.
Purely cosmetic.

```yaml
Type: String
Parameter Sets: default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SortColumns
Enabling this will cause the command to sort columns alphabetically.
Explicit order styles take precedence over alphabetic sorting.

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

### -ColumnOrder
Specify a list of properties in the order they should appear.
For properties with labels: Labels take precedence over selected propertyname.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ColumnOrderHash
Allows explicitly defining the order of columns on a per-type basis.
These hashtables need to have two properties:
- Type: The name of the type it applies to (e.g.: "System.IO.FileInfo")
- Properties: The list of properties in the order they should appear.
Example: @{ Type = "System.IO.FileInfo"; Properties = "Name", "Length", "LastWriteTime" }
This parameter takes precedence over ColumnOrder in instances where the
processed typename is explicitly listed in a hashtable.

```yaml
Type: Hashtable[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ColumnTransformations
A complex parameter that allows customizing columns or even adding new ones.
This parameter accepts a hashtable that can ...
- Set column width
- Set column alignment
- Add a script column
- Assign a label to a column
It can be targeted by typename as well as propertyname.
Possible properties (others will be ignored):
Content          |  Type  | Possible Hashtable Keys
Filter: Typename | string | T / Type / TypeName / FilterViewName
Filter: Property | string | C / Column / Name / P / Property / PropertyName
Append           |  bool  | A / Append
ScriptBlock      | script | S / Script / ScriptBlock
Label            | string | L / Label
Width            |  int   | W / Width
Alignment        | string | Align / Alignment

Notes:
- Append needs to be specified if a new column should be added if no property to override was found.
  Use this to add a completely new column with a ScriptBlock.
- Alignment: Expects a string, can be any choice of "Left", "Center", "Right"

Example:
$transform = @{
    Type = "System.IO.FileInfo"
    Append = $true
    Script = { "{0} | {1}" -f $_.Extension, $_.Length }
    Label = "Ext.Length"
    Align = "Left"
}

```yaml
Type: ColumnTransformation[]
Parameter Sets: (All)
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

### PSModuleDevelopment.Format.Document

### PSModuleDevelopment.Format.TableDefinition

## NOTES

## RELATED LINKS

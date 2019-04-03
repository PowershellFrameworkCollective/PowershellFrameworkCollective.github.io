---
external help file: PSModuleDevelopment-help.xml
Module Name: PSModuleDevelopment
online version:
schema: 2.0.0
---

# Search-PSMDPropertyValue

## SYNOPSIS
Recursively search an object for property values.

## SYNTAX

```
Search-PSMDPropertyValue [[-Value] <Object>] [-Object] <Object> [-Match] [[-Depth] <Int32>]
 [<CommonParameters>]
```

## DESCRIPTION
Recursively search an object for property values.
This can be useful to determine just where an object stores a given piece of information in scenarios, where objects either have way too many properties or a deeply nested data structure.

## EXAMPLES

### EXAMPLE 1
```
Get-Mailbox Max.Mustermann | Search-PSMDPropertyValue -Object 'max.mustermann@contoso.com' -Match
```

Searches all properties on the mailbox of Max Mustermann for his email address.

## PARAMETERS

### -Value
The value to search for.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Object
The object to search.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Match
Search by comparing with regex, rather than equality comparison.

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

### -Depth
Default: 3
How deep should the query recurse.
The deeper, the longer it can take on deeply nested objects.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 3
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

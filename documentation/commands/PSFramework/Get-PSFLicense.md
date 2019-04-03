---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Get-PSFLicense

## SYNOPSIS
Returns registered licenses

## SYNTAX

```
Get-PSFLicense [[-Filter] <String>] [-ProductType <ProductType[]>] [-LicenseType <LicenseType>]
 [-Manufacturer <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns all matching licenses from the PSFramework internal license cache.

## EXAMPLES

### EXAMPLE 1
```
Get-PSFLicense *Microsoft*
```

Returns all registered licenses for products with the string "Microsoft" in their name

### EXAMPLE 2
```
Get-PSFLicense -LicenseType Commercial -ProductType Library
```

Returns a list of all registered licenses for products that have commercial licenses and are libraries.

## PARAMETERS

### -Filter
Default: "*"
Filters for the name of the product.
Uses the -like operator.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Product

Required: False
Position: 1
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProductType
Only licenses of products for any of the specified types are considered.

```yaml
Type: ProductType[]
Parameter Sets: (All)
Aliases:
Accepted values: Module, Script, Library, Application, Other

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LicenseType
Only licenses of any matching type are returned.

```yaml
Type: LicenseType
Parameter Sets: (All)
Aliases:
Accepted values: Free, Commercial, NoAttribution, NoModify

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Manufacturer
Default: "*"
Only licenses for products of a matching manufacturer are returned.
Uses the -like operator for comparisons.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### PSFramework.License.License
## NOTES

## RELATED LINKS

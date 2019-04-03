---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# New-PSFLicense

## SYNOPSIS
Creates a new license object and registers it

## SYNTAX

```
New-PSFLicense [-Product] <String> [[-Manufacturer] <String>] [[-ProductVersion] <Version>]
 [-ProductType] <ProductType> [[-Name] <String>] [[-Version] <Version>] [[-Date] <DateTime>]
 [[-Type] <LicenseType>] [-Text] <String> [[-Description] <String>] [[-Parent] <License>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
This function creates a new license object used by the PSFramework licensing component.
The license is automatically registered in the current process' license store.

## EXAMPLES

### EXAMPLE 1
```
New-PSFLicense -Product 'Awesome Test Product' -Manufacturer 'Awesome Inc.' -ProductVersion '1.0.1.0' -ProductType Application -Name FreeBSD -Version "3.0.0.0" -Date (Get-Date -Year 2016 -Month 11 -Day 28 -Hour 0 -Minute 0 -Second 0) -Text @"
```

Copyright (c) 2016, Awesome Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1.
Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
2.
Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

The views and conclusions contained in the software and documentation are those
of the authors and should not be interpreted as representing official policies,
either expressed or implied, of the FreeBSD Project.
"@

This registers the Awesome Test Product as licensed under the common FreeBSD license.

## PARAMETERS

### -Product
The product that is being licensed

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

### -Manufacturer
The entity that produced the licensed product

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: ACME ltd.
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProductVersion
The version of the licensed product

```yaml
Type: Version
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 1.0.0.0
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProductType
What kind of product is te license for?
Options: Module, Script, Library, Application, Other

```yaml
Type: ProductType
Parameter Sets: (All)
Aliases:
Accepted values: Module, Script, Library, Application, Other

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Most licenses used have a name.
Feel free to register that name as well.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: Unknown
Accept pipeline input: False
Accept wildcard characters: False
```

### -Version
What version is the license?

```yaml
Type: Version
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: 1.0.0.0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Date
When was the product licensed with the registered license

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: (Get-Date -Year 1989 -Month 10 -Day 3 -Hour 0 -Minute 0 -Second 0)
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type
Default: Free
This shows the usual limitations that apply to this license.
By Default, licenses are considered free and may be modified, but require attribution when used in your own product.

```yaml
Type: LicenseType
Parameter Sets: (All)
Aliases:
Accepted values: Free, Commercial, NoAttribution, NoModify

Required: False
Position: 8
Default value: Free
Accept pipeline input: False
Accept wildcard characters: False
```

### -Text
The full text of your license.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
A description of the content.
Useful when describing how some license is used within your own product.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Parent
The license of the product within which the product of this license is used.

```yaml
Type: License
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
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

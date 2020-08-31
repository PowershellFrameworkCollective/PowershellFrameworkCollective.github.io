---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Get-PSFDynamicContentObject

## SYNOPSIS
Retrieves a named value object that can be updated from another runspace.

## SYNTAX

```
Get-PSFDynamicContentObject [-Name] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Retrieves a named value object that can be updated from another runspace.

This comes in handy to have a variable that is automatically updated.
Use this function to receive an object under a given name.
Use Set-PSFDynamicContentObject to update the value of the object.

It matters not from what runspace you update the object.

Note:
When planning to use such an object, keep in mind that it can easily change its content at any given time.

## EXAMPLES

### EXAMPLE 1
```
Get-PSFDynamicContentObject -Name "Test"
```

Returns the Dynamic Content Object named "test"

## PARAMETERS

### -Name
The name of the object to retrieve.
Will create an empty value object if the object doesn't already exist.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### PSFramework.Utility.DynamicContentObject
## NOTES

## RELATED LINKS

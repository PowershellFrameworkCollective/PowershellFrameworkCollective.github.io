---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Set-PSFDynamicContentObject

## SYNOPSIS
Updates a value object that can easily be accessed on another runspace.

## SYNTAX

```
Set-PSFDynamicContentObject [[-Name] <String[]>] [[-Object] <DynamicContentObject[]>] [-Value] <Object>
 [<CommonParameters>]
```

## DESCRIPTION
Updates a value object that can easily be accessed on another runspace.

The Dynamic Content Object system allows the user to easily have the content of a variable updated in the background.
The update is performed by this very function.

## EXAMPLES

### EXAMPLE 1
```
Set-PSFDynamicContentObject -Name Test -Value $Value
```

Sets the Dynamic Content Object named "test" to the value $Value.

## PARAMETERS

### -Name
The name of the value to update.
Not case sensitive.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Object
The value object to update

```yaml
Type: DynamicContentObject[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Value
The value to apply

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
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

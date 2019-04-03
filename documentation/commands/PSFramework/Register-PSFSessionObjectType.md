---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Register-PSFSessionObjectType

## SYNOPSIS
Registers a new type as a live session object.

## SYNTAX

```
Register-PSFSessionObjectType [-DisplayName] <String> [-TypeName] <String> [<CommonParameters>]
```

## DESCRIPTION
Registers a new type as a live session object.
This is used in the session container object, used to pass through multiple types of connection objects to a single PSFComputer parameterclassed parameter.

## EXAMPLES

### EXAMPLE 1
```
Register-PSFSessionObjectType -DisplayName 'PSSession' -TypeName 'System.Management.Automation.Runspaces.PSSession'
```

Registers the type 'System.Management.Automation.Runspaces.PSSession' under the name of 'PSSession'.

## PARAMETERS

### -DisplayName
The display name for the type.
Pick anything that intuitively points at what the object is.

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

### -TypeName
The full name of the type.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

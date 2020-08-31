---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Export-PSFModuleClass

## SYNOPSIS
Exports a module-defined PowerShell class irrespective of how the module is being imported.

## SYNTAX

```
Export-PSFModuleClass [-ClassType] <Type[]> [<CommonParameters>]
```

## DESCRIPTION
Exports a module-defined PowerShell class irrespective of how the module is being imported.
This avoids having to worry about how the module is being imported.

Please beware the risk of class-name-collisions however.

## EXAMPLES

### EXAMPLE 1
```
Export-PSFModuleClass -ClassType ([MyModule_MyClass])
```

Publishes the class MyModule_MyClass, making it available outside of your module.

## PARAMETERS

### -ClassType
The types to publish.

```yaml
Type: Type[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
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

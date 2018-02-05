---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Register-PSFParameterClassMapping

## SYNOPSIS
Registers types to a parameter classes input interpretation.

## SYNTAX

```
Register-PSFParameterClassMapping [-ParameterClass] <ParameterClasses> [-TypeName] <String>
 [-Properties] <String[]> [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
The parameter classes shipped in PSFramework can be extended to support input of an unknown object type.
In order to accomplish that, it is necessary to register the name of that type (and the properties to use) using this command.

On input interpretation, it will check the TypeNames property on the PSObject for evaluation.
This means you can also specify custom PSObjects by giving them a dedicated name.

## EXAMPLES

### BEISPIEL 1
```
Register-PSFParameterClassMapping -ParameterClass 'Computer' -TypeName 'microsoft.activedirectory.management.adcomputer' -Properties 'DNSHostName', 'Name'
```

This extends the computer parameter class by ...
- having it accept the type 'microsoft.activedirectory.management.adcomputer'
- having it use the 'DNSHostName' property if available, falling back to 'Name' if necessary

## PARAMETERS

### -ParameterClass
The parameter class to extend.

```yaml
Type: ParameterClasses
Parameter Sets: (All)
Aliases:
Accepted values: Computer

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TypeName
The name of the type to register.

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

### -Properties
The properties to check.
When processing an object of this type, it will try to access the properties in this order, trying to make something fit the intended result.
The first property that is a fit for the parameter class is chosen, other ones are ignored.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableException
This parameters disables user-friendly warnings and enables the throwing of exceptions.
This is less user friendly, but allows catching exceptions in calling scripts.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

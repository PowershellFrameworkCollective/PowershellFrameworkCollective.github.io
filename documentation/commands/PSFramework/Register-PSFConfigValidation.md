---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Register-PSFConfigValidation

## SYNOPSIS
Registers a validation scriptblock for use with the configuration system.

## SYNTAX

```
Register-PSFConfigValidation [-Name] <String> [-ScriptBlock] <ScriptBlock> [<CommonParameters>]
```

## DESCRIPTION
Registers a validation scriptblock for use with the configuration system.

The scriptblock must be designed according to a few guidelines:
- It must not throw exceptions
- It must accept a single parameter (the value to be tested)
- It must return an object with two properties: 'Message', 'Value' and 'Success'.
The Success property should be boolean and indicate whether the value is valid.
The Value property contains the validated input.
The scriptblock may legally convert the input (For example from string to int in case of integer validation)
The message contains a string that will be passed along to an exception in case the input is NOT valid.

## EXAMPLES

### EXAMPLE 1
```
Register-PSFConfigValidation -Name IntPositive -ScriptBlock $scriptblock
```

Registers the scriptblock stored in $scriptblock as validation with the name IntPositive

## PARAMETERS

### -Name
The name under which to register the validation scriptblock

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

### -ScriptBlock
The scriptblock to register

```yaml
Type: ScriptBlock
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

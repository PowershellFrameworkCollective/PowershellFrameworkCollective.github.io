---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Register-PSFMessageTransform

## SYNOPSIS
Registers a scriptblock that can transform message content.

## SYNTAX

### Target
```
Register-PSFMessageTransform -TargetType <String> -ScriptBlock <ScriptBlock> [<CommonParameters>]
```

### Exception
```
Register-PSFMessageTransform -ExceptionType <String> -ScriptBlock <ScriptBlock> [<CommonParameters>]
```

### TargetFilter
```
Register-PSFMessageTransform -ScriptBlock <ScriptBlock> -TargetTypeFilter <String>
 [-FunctionNameFilter <Object>] [-ModuleNameFilter <Object>] [<CommonParameters>]
```

### ExceptionFilter
```
Register-PSFMessageTransform -ScriptBlock <ScriptBlock> -ExceptionTypeFilter <String>
 [-FunctionNameFilter <Object>] [-ModuleNameFilter <Object>] [<CommonParameters>]
```

## DESCRIPTION
Registers a scriptblock that can transform message content.
This can be used to convert some kinds of input.
Specifically:

Target:
When specifying a target, this target may require some conversion.
For example, an object containing a live connection may need to have a static copy stored instead,
as otherwise its export on a different runspace may cause access violations.

Exceptions:
Some exceptions may need transforming.
For example some APIs might wrap the actual exception into a common wrapper.
In this scenario you may want the actual exception in order to provide more specific information.

In all instances, the scriptblock will be called, receiving only the relevant object as its sole input.

Note: This transformation is performed synchronously on the active runspace.
Complex scriptblocks may delay execution times when a matching object is passed.

## EXAMPLES

### EXAMPLE 1
```
Register-PSFMessageTransform -TargetType 'mymodule.category.classname' -ScriptBlock $ScriptBlock
```

Whenever a target object of type 'mymodule.category.classname' is specified, invoke $ScriptBlock (with the object as sole argument) and store the result as target instead.

### EXAMPLE 2
```
Register-PSFMessageTransform -ExceptionType 'mymodule.category.exceptionname' -ScriptBlock $ScriptBlock
```

Whenever an exception or error record of type 'mymodule.category.classname' is specified, invoke $ScriptBlock (with the object as sole argument) and store the result as exception instead.
If the full error record is specified, only the updated exception will be inserted

### EXAMPLE 3
```
Register-PSFMessageTransform -TargetTypeFilter 'mymodule.category.*' -ScriptBlock $ScriptBlock
```

Adds a transform for all target objects that are of a type whose full name starts with 'mymodule.category.'
All target objects matching that typename will be run through the specified scriptblock, which in return generates the new target object.

## PARAMETERS

### -TargetType
The full typename of the target object to apply the scriptblock to.
All objects of that typename will be processed through that scriptblock.

```yaml
Type: String
Parameter Sets: Target
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExceptionType
The full typename of the exception object to apply the scriptblock to.
All objects of that typename will be processed through that scriptblock.
Note: In case of error records, the type of the Exception Property is inspected.
The error record as a whole will not be touched, except for having its exception exchanged.

```yaml
Type: String
Parameter Sets: Exception
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ScriptBlock
The scriptblock that performs the transformation.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TargetTypeFilter
A filter for the typename of the target object to transform.
Supports wildcards, but not regex.
WARNING: Adding too many filter-type transforms may impact overall performance, try to avoid using them!

```yaml
Type: String
Parameter Sets: TargetFilter
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExceptionTypeFilter
A filter for the typename of the exception object to transform.
Supports wildcards, but not regex.
WARNING: Adding too many filter-type transforms may impact overall performance, try to avoid using them!

```yaml
Type: String
Parameter Sets: ExceptionFilter
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FunctionNameFilter
Default: "*"
Allows filtering by function name, in order to consider whether the function is affected.
Supports wildcards, but not regex.
WARNING: Adding too many filter-type transforms may impact overall performance, try to avoid using them!

```yaml
Type: Object
Parameter Sets: TargetFilter, ExceptionFilter
Aliases:

Required: False
Position: Named
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -ModuleNameFilter
Default: "*"
Allows filtering by module name, in order to consider whether the function is affected.
Supports wildcards, but not regex.
WARNING: Adding too many filter-type transforms may impact overall performance, try to avoid using them!

```yaml
Type: Object
Parameter Sets: TargetFilter, ExceptionFilter
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

## NOTES

## RELATED LINKS

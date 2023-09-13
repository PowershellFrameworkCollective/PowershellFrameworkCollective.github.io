# ScriptTransformation

[Back to utility](http://psframework.org/documentation/documents/psframework/utility.html)

## Synopsis

The ScriptTransformation Argument Transformation Attribute enables you to simply provide the conversion logic used in script.

## Description

There are two things needed to make this work:

+ Register the scriptblock that converts input
+ Assign it as attribute in your command's param block

An example:

```powershell
# Register the scriptblock
Register-PSFArgumentTransformationScriptblock -Name 'MyModule.Answer' -Scriptblock {
    if ('Answer' -eq $_) { 42 }
    # Can be as long as needed, only the first output object will be used
}

# Apply to function
function Get-Number {
    [CmdletBinding()]
    param (
        [PSFramework.Utility.ScriptTransformation('MyModule.Answer', [int])]
        [int]
        $Number
    )
    $Number
}

# Test
Get-Number -Number 23 # 23
Get-Number -Number '42' # 42
Get-Number -Number 'Answer' # 42
Get-Number -Number 'Foo' # Error
```

## Notes

+ If the conversion scriptblock fails, it will still try to convert using PowerShell Typeconversion
+ Scriptblock conversion takes precedence
+ The attribute expects two arguments: The name of the scriptblock and the target type.
+ The scriptblock is executed in the global scope of the current runspace, retaining its original trust level/language mode.

[Back to utility](http://psframework.org/documentation/documents/psframework/utility.html)
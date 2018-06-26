---
title: Tab Completion: Reacting to the Current Parameter
---
# Reacting to the Current Parameter
## Synopsis

Tab completion can react to the name of the parameter completed for.

## Description

In the PSFramework Tab Completion system, developers can use the [$parameterName](special-variables.html) variable to access the name of the parameter it is currently completing for.
This is rarely needed, as it is unusual to have parameters of different names have sufficiently similar content to merit sharing a scriptblock while still needing differentiation.

Nevertheless, in instances where it _is_ required, it's available:

```powershell
Register-PSFTeppScriptBlock -Name MyModule.ServiceGroups -ScriptBlock {
    $common = 'General', 'Services', 'HR'
    switch ($parameterName) {
        'HRGroup' { $common += 'HR_Internal' }
        'ITGroup' { $common += 'IT', 'Windows', 'Network' }
        'CGroup' { $common += 'Compliance', 'Strategy' }
    }
    $common
}
```

> In many such instances it is better to reconsider the parameter design. In the example above, you could have parameter for category (HR, IT or C), with its own tab completion. Then have a single parameter named Group, and working with $fakeBoundParameters instead.

## Notes
[Back to Tab Expansion](https://psframework.org/documentation/documents/psframework/tab-completion.html)

| Version | 1.0 |
| Written on: | 2018-06-18 |
| Updated on: | 2018-06-26 |
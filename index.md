The PowerShell Framework project strives to provide tools and infrastructure for PowerShell developers.
Main Goals:

 - Reduce development time needed
 - Improve Manageability of developed code
 - Enhance scalability of code
 - Enhance uniformity of user experience


# The project's modules

## PSFramework

```powershell
Install-Module PSFramework
```

The PSFramework module is designed as a large toolkit, enabling simple integration of advanced features, manageability of code & scripts, as well as enhancements to the individual user's experience.

Prominent features:

 - Advanced message & logging functionality
 - Manage scripts & modules using DSC
 - Simple Tab Completion
 - Runspace-safe development
 - PowerShell Scheduled tasks

## PSModuleDevelopment

```powershell
Install-Module PSModuleDevelopment
```

The PSModuleDevelopment module provides tools for the developer, for interactive use or as part of build actions.

Prominent features:

 - Speed up test cycles
 - Speed up debugging
 - Refactoring tools
 - Assembly/Typesystem tools
 - Multilingual Help testing

## PSUtil

```powershell
Install-Module PSUtil
```

The PSUtil module is designed for improving the efficiency of _anybody_ using an interactive console. It includes useful utilities, helpers and other gadgets that make everyday console use just that little bit faster and more convenient.

Prominent features:

 - Keybindings for frequently needed functionalities
 - Simple directory navigation to often needed folders
 - String manipulation on the pipeline (`trim`|`replace`|`split`|`join`|`format`|...)
 - Short aliases for commonly used commands (`grep` --> `Select-String`)
 - Lots of other utilities ...

## PSDemo (upcoming)

True expertise lies in teaching others. When it's ready, PSDemo will help you present PowerShell to other people.
Specifically, it will allow recording a PowerShell console and allows presenting simulated (or real) PowerShell execution using a regular presenter tool, without having to stay behind a keyboard during presentation.

No ETA yet, sorry :(
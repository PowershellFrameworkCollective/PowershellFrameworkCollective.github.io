---
title: Tab Completion: Reacting to the Calling Command
---
# Reacting to the Calling Command
## Synopsis

Shows how to react to the command, the parameter of which you try to complete for.

## Description

Scriptblocks defined in PSFramework Tab Completion can be assigned to multiple commands or paramters.
Generally that is all well, but sometimes it may be useful to have slight differences in how the code handles, depending on what command it triggered on.

One way to cause different behavior would be to implement separate scriptblocks, however that would lead to both scriptblocks requiring maintenance.
If the code is mostly identical, that is not really efficient.

Instead you can use the [$CommandName](special-variables.html) variable to change scriptblock execution based upon this.
For example the following snippet changes the search scope, based on whether the command contain the `-Client` string:

```powershell
Register-PSFTeppScriptBlock -Name MyModule.ComputerName -ScriptBlock {
    if ($commandName -like "*-Client*") { 
        (Get-ADComputer -Filter "*" -SearchBase "OU=Clients,DC=Domain,DC=Com").Name | Sort-Object
    }
    else { (Get-ADComputer -Filter "*").Name | Sort-Object }
}
```

> Note: While it is possible to hard-code static information like the searchbase string, it is recommended to use the PSFramework configuration system to set this path instead. This makes it a lot easier to react to changes in your infrastructure, without having to search and update code that has already been deployed. For more details on how to implement this, see the documentation on the PSFramework Configuration System.

## Notes
[Back to Tab Expansion](https://psframework.org/documentation/documents/psframework/tab-completion.html)

| Version | 1.0 |
| Written on: | 2018-06-18 |
| Updated on: | 2018-06-25 |
---
title: Tab Completion: Special Variables
---
# Special Variables
## Synopsis

Describes the special variables available in PSFramework TabCompletion.

## Description

When writing custom tab completion scriptblocks, you have access to five variables that relate to the current command you are trying to complete for:

### fakeBoundParameter

The `$fakeBoundParameter` variable allows you to access the values of what was already bound to the command.
Similar to the automatic `$PSBoundParameters` automatic variable within functions.

```powershell
Register-PSFTeppScriptblock -Name Alcohol.MugSize -ScriptBlock {
    switch ($fakeBoundParameter.Type)
    {
        'Mead' { 'Mug', 'Horn', 'Barrel' }
        'Wine' { 'Glas', 'Bottle' }
        'Beer' { 'Halbes Maß', 'Maß' }
        default { 'Glas', 'Pitcher' }
    }
}
```

### wordToComplete

The `$wordToComplete` variable contains what the user already typed before hitting the `TAB` key.
Generally, you do not need to use it, because the system will automatically filter for this!

However you can use this to prefilter remote queries, in order to optimize performance.

```powershell
Register-PSFTeppScriptBlock -Name MyModule.ComputerName -ScriptBlock {
    (Get-ADComputer -Filter "name -eq '$wordToComplete*'").Name | Sort-Object
}
```

### commandName

The `$commandName` variable contains the name of the command the user was trying to complete a parametervalue for.
For example, if the scriptblock was assigned to the `Invoke-Command` command's `-ComputerName` parameter, it would contain the value `"Invoke-Command"` when completing for that command.

This allows you to control behavior by command, in case you assign the same tabcompletion scriptblock to multiple commands.

```powershell
Register-PSFTeppScriptBlock -Name MyModule.ComputerName -ScriptBlock {
    if ($commandName -like "*-Client*") { 
        (Get-ADComputer -Filter "name -eq '$wordToComplete*'" -SearchBase "OU=Clients,DC=Domain,DC=Com").Name | Sort-Object
    }
    else { (Get-ADComputer -Filter "name -eq '$wordToComplete*'").Name | Sort-Object }
}
```

### parameterName

Similar to `$commandName`, `$parameterName` contains the name of the actual parameter you are trying to complete for. Using the previous example of `Invoke-Command -ComputerName <TAB>`, this variable would contain the value of `"ComputerName"`.

Again, this can be used to control behavior by that property, but in practice it has seen little use.

### commandAst

The `$commandAst` variable contains the full PowerShell Ast of the entire pipeline.
This would allow access to previous or upcoming commands.

For example, this could be used to check the output type of the preceding command in order to customize tab completion based on what the command will likely receive.

## Notes
[Back to Tab Expansion](https://psframework.org/documentation/documents/psframework/tab-completion.html)

| Version | 1.0 |
| Written on: | 2018-06-18 |
| Updated on: | 2018-06-21 |
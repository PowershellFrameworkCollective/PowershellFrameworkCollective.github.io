# Getting started with Tab Completion

Tab Completion is what happens in PowerShell when you hit the `TAB` key:

 - If you are typing a command name, it will be completed
 - If you are writing a parameter name, it will be completed
 - If you are about to provide input for a parameter, it will offer you what to insert.

This third option isn't always so simple, because PowerShell needs to know what to offer and it is not always able to do so. When it can't, it generally offers files and folders in the current folder.

Instead, you _can_ tell PowerShell what to do.

# Command to complete

First of all, we need a command PowerShell can complete for:

```powershell
function Get-Alcohol
{
    [CmdletBinding()]
    Param (
        [string]
        $Type,

        [string]
        $Unit = "Pitcher"
    )

    Write-Host "Drinking a $Unit of $Type"
}
```

Now let's add tab completion for it!

# Completing a parameter

In Step one, we create a scriptblock that creates strings and register it under a name:

```powershell
# Create scriptblock that collects information and name it
Register-PSFTeppScriptblock -Name "alcohol" -ScriptBlock { 'Beer','Mead','Whiskey','Wine','Vodka','Rum (3y)', 'Rum (5y)', 'Rum (7y)' }
```

This allows us to assign that scriptblock to a command and parameter:

```powershell
# Assign scriptblock to function
Register-PSFTeppArgumentCompleter -Command Get-Alcohol -Parameter Type -Name alcohol
```

Try it out:

```powershell
Get-Alcohol -Type <TAB>
```

# Additional Information

 - It is possible to 'see' already bound parameters in that scriptblock
 - It is possible to 'see' the command name, the parameter name or the entire input line in that scriptblock

# Further reading

```
Content pending
```
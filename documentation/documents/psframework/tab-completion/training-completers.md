---
title: Tab Completion: Training Completers
---
# Training Completers

[Back to Tab Expansion](https://psframework.org/documentation/documents/psframework/tab-completion.html)

## Synopsis

Dynamic tab completion is great, but sometimes you just cannot determine legal values reliably, all by yourself.
This is where the ability to "train" your completers comes in - that is, to either manually add values, or automagically learn from the user's input!

## Description

There are fundamentally two ways to train your completers:

+ Automatically, based on the input a command receives. This is designed for convenient use and can happen _after_ validating the input (to prevent learning undesirable values).
+ Manually, by adding them with the `Add-PSFTeppCompletion` command.

No matter which way they are added, they can be combined with dynamic completion.
Learned values can also be unlearned (see below).

## Automatic Training

To enable automatic training of completers, three steps must be taken:

+ The Completer must be configured for Auto-Training
+ The Completer must be assigned via Attribute, _not_ via command!
+ The code must call `Update-PSFTeppCompletion` when it wants to train input

Logically, Automatic Training _cannot_ be combined with `[PsfValidateSet(...)]`, as the validation would happen before the training, preventing new values from being accepted.

> Example

```powershell
Register-PSFTeppScriptblock -Name "alcohol.type" -ScriptBlock {
    @{ Text = 'Beer'; ToolTip = 'Elixir of the gods'}
    @{ Text = 'Mead'; ToolTip = 'Elixir of the angry gods' }
    @{ Text = 'Whiskey'; ToolTip = 'Unleash the Irishman in you!' }
    @{ Text = 'Wine'; ToolTip = 'For the discriminating somelier' }
    @{ Text = 'Vodka'; ToolTip = 'Beware, before it is too late' }
    @{ Text = 'Rum (3y)'; ToolTip = 'Barkeepers Delight' }
    @{ Text = 'Rum (5y)'; ToolTip = 'Well aged, combines well' }
    @{ Text = 'Rum (7y)'; ToolTip = 'Oldtimer, use for cocktails that need some character' }
} -AutoTraining

function Get-Alcohol {
    [CmdletBinding()]
    Param (
        [PsfArgumentCompleter('alcohol.type')]
        [string]
        $Type,

        [string]
        $Unit = "Pitcher"
    )
    if ($Type -eq 'Kölsch') { throw "Would go bad before serving!" }
    Update-PSFTeppCompletion

    Write-Host "Drinking a $Unit of $Type"
}
```

With this, the command comes with a few pre-defined beverages it can complete:

```powershell
Get-Alcohol -Type <TAB>
```

But now when we provide a new value:

```powershell
Get-Alcohol -Type Mojito
```

It will now also offer the new value (however without a friendly tooltip):

```powershell
Get-Alcohol -Type <TAB>
```

## Manual Training

Manual Training requires no particular configuration and allows assignment via command _or_ attribute.
It also allows adding tooltips to your completion.
Finally, it can be applied to _any_ completer defined, including those configured for Automatic Training.

> Example

```powershell
Register-PSFTeppScriptblock -Name "alcohol.type" -ScriptBlock {
    @{ Text = 'Beer'; ToolTip = 'Elixir of the gods'}
    @{ Text = 'Mead'; ToolTip = 'Elixir of the angry gods' }
    @{ Text = 'Whiskey'; ToolTip = 'Unleash the Irishman in you!' }
    @{ Text = 'Wine'; ToolTip = 'For the discriminating somelier' }
    @{ Text = 'Vodka'; ToolTip = 'Beware, before it is too late' }
    @{ Text = 'Rum (3y)'; ToolTip = 'Barkeepers Delight' }
    @{ Text = 'Rum (5y)'; ToolTip = 'Well aged, combines well' }
    @{ Text = 'Rum (7y)'; ToolTip = 'Oldtimer, use for cocktails that need some character' }
}

function Get-Alcohol {
    [CmdletBinding()]
    Param (
        [string]
        $Type,

        [string]
        $Unit = "Pitcher"
    )
    if ($Type -eq 'Kölsch') { throw "Would go bad before serving!" }

    Add-PSFTeppCompletion -Name alcohol.type -Options $Type

    Write-Host "Drinking a $Unit of $Type"
}

# Add some completion
Add-PSFTeppCompletion -Name alcohol.type -Options @{ Text = 'Margarita'; Tooltip = 'A proper Mexican' }

# Actually assign the completion to the command
Register-PSFTeppArgumentCompleter -Command Get-Alcohol -Parameter Type -Name 'alcohol.type'
```

With this, we can now complete the alcohol types with the ones calculated by the scriptblock, plus the one we predefined:

```powershell
Get-Alcohol -Type <TAB>
```

But now when we provide a new value:

```powershell
Get-Alcohol -Type Mojito
```

It will now also offer the new value (however without a friendly tooltip):

```powershell
Get-Alcohol -Type <TAB>
```

## Managing Learned Values

There are two commands that can be used to interact with the learned values:

+ `Get-PSFTeppCompletion` to see what has been learned
+ `Remove-PSFTeppCompletion` to remove an undesired value from the list of trained values.

> Example

```powershell
# List Currently trained values
Get-PSFTeppCompletion -Name alcohol.type
```

```text
Completion   Text
----------   ----
alcohol.type Mojito
alcohol.type Margarita
```

```powershell
# Remove all currently trained values
Get-PSFTeppCompletion -Name alcohol.type | Remove-PSFTeppCompletion
```

## Persisting learned completions across sessions

PSFramework Tab Completion does _not_ offer a direct feature to persist the trained completions across sessions.
This can be implemented on your own however, using a combination of `Get-PSFTeppCompletion`, `Export-PSFClixml`, `Import-PSFClixml` and `Add-PSFTeppCompletion`.

If you wish to implement this, be sure to do so responsibly in regards to secrets or sensitive data.
Also consider aging entries.

[Back to Tab Expansion](https://psframework.org/documentation/documents/psframework/tab-completion.html)
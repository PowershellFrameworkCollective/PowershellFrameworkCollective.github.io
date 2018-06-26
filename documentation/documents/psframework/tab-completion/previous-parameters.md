---
title: Tab Completion: Reacting to Previous Parameters
---
# Reacting to Previous Parameters
## Synopsis

Shows how you can implement tab completion that is aware of already specified parameters.

## Description

One of the advanced features of tab completion is the ability to know, what was already bound to other parameters.
This allows to prefilter offered values or to pick from different sets of values, depending.

This makes use of the [$fakeBoundParameter variable](special-variables.html) that is available to your scriptblock.

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

## Full Example

Here's a full implementation that allows you to play with it in the console:

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

# Create scriptblock that collects information and name it
Register-PSFTeppScriptblock -Name 'alcohol.type' -ScriptBlock { 'Beer','Mead','Whiskey','Wine','Vodka','Rum (3y)', 'Rum (5y)', 'Rum (7y)' }

# Assign scriptblock to function
Register-PSFTeppArgumentCompleter -Command Get-Alcohol -Parameter Type -Name 'alcohol.type'

# Create scriptblock that checks what was bound to '-Type' so far and name it
Register-PSFTeppScriptblock -Name 'alcohol.unit' -ScriptBlock {
    switch ($fakeBoundParameter.Type)
    {
        'Mead' { 'Mug', 'Horn', 'Barrel' }
        'Wine' { 'Glas', 'Bottle' }
        'Beer' { 'Halbes Maß', 'Maß' }
        default { 'Glas', 'Pitcher' }
    }
}

# Assign scriptblock to function
Register-PSFTeppArgumentCompleter -Command Get-Alcohol -Parameter Unit -Name 'alcohol.unit'
```

This allows you to tab complete for the `-Type` parameter and receive a list of beverage types.
Then you can complete for the `-Unit` parameter, it will offer differnt options if you specified Mead, Wine or Beer!

## Notes
[Back to Tab Expansion](https://psframework.org/documentation/documents/psframework/tab-completion.html)

| Version | 1.0 |
| Written on: | 2018-06-18 |
| Updated on: | 2018-06-21 |
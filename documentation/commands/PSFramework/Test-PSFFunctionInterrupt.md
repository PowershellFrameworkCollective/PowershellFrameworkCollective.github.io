---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Test-PSFFunctionInterrupt

## SYNOPSIS
Tests whether the calling function should be interrupted.

## SYNTAX

```
Test-PSFFunctionInterrupt [<CommonParameters>]
```

## DESCRIPTION
This helper function is designed to work in tandem with Stop-PSFFunction.
When gracefully terminating a function, there is a major issue:
"Return" will only stop the current one of the three blocks (Begin, Process, End).
All other statements have side effects or produce lots of red text.

So, Stop-PSFFunction writes a variable into the parent scope, that signals the function should cease.
This function then checks for that very variable and returns true if it is set.

This avoids having to handle odd variables in the parent function and causes the least impact on contributors.

For a more detailed explanation - including commented full-scale implementation examples - see the associated help article:
Get-Help about_psf_flowcontrol

## EXAMPLES

### EXAMPLE 1
```
if (Test-PSFFunctionInterrupt) { return }
```

The calling function will stop if this function returns true.

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Boolean
## NOTES

## RELATED LINKS

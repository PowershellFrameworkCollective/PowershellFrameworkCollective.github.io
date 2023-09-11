---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Disable-PSFConsoleInterrupt

## SYNOPSIS
Prevents the use of CTRL+C from interrupting the console.

## SYNTAX

```
Disable-PSFConsoleInterrupt [<CommonParameters>]
```

## DESCRIPTION
Prevents the use of CTRL+C from interrupting the console.

Use this to prevent manual interruption of critical tasks, but do not forget to re-enable it as soon as possible.
Usually, ctrl+C is a critical part of the user experience, enabling the user to interrupt the console
and avoid a hang from locking the console.

## EXAMPLES

### EXAMPLE 1
```
Disable-PSFConsoleInterrupt
```

Prevents the use of CTRL+C from interrupting the console.

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

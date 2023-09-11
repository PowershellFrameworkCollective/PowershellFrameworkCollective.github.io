---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Get-PSFLoggingError

## SYNOPSIS
Retrieve errors that happened when trying to log messages.

## SYNTAX

```
Get-PSFLoggingError [<CommonParameters>]
```

## DESCRIPTION
Retrieve errors that happened when trying to log messages.
This command is used to troubleshoot issues with the logging system itself.

It can only return errors that happened during the current process.
Only logging instances that are currently enabled are considered, does not work for Legacy Logging Providers.

## EXAMPLES

### EXAMPLE 1
```
Get-PSFLoggingError
```

Returns all errors any currently enabled logging providers had.

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

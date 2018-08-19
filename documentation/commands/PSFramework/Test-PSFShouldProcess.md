---
external help file: PSFramework.dll-Help.xml
Module Name: PSFramework
online version: https://psframework.org/documentation/commands/PSFramework/Test-PSFShouldProcess.html
schema: 2.0.0
---

# Test-PSFShouldProcess

## SYNOPSIS
Implements the shouldprocess question.

## SYNTAX

```
Test-PSFShouldProcess -PSCmdlet <PSCmdlet> -Target <String> -Action <String> [<CommonParameters>]
```

## DESCRIPTION
This command can be used in other commands to implement the ShouldProcess question asked if using the command requires confirmation.
This replaces / wraps the traditional ShouldProcess call, makes it easier to read in script and allows mocking it.

## EXAMPLES

### Example 1: Basic Usage
```
if (Test-PSFShouldProcess -PSCmdlet $PSCmdlet -Target $item -Action "Performing some arbitrary action") {

}
```

This will test whether the user should be prompted for confirmation, will do so if necessary and report back the results.

## PARAMETERS

### -PSCmdlet
The $PSCmdlet variable of the calling function.
Used to ensure the actual prompt logic as intended is being used.

```yaml
Type: PSCmdlet
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Target
The target that is being processed.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Action
The action that will be performed on the target

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[Online Documentation](https://psframework.org/documentation/commands/PSFramework/Test-PSFShouldProcess.html)


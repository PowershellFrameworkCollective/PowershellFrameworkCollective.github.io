---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Test-PSFParameterBinding

## SYNOPSIS
Helper function that tests, whether a parameter was bound.

## SYNTAX

```
Test-PSFParameterBinding [-ParameterName] <String[]> [-Not] [-And] [-Mode <String>] [-BoundParameters <Object>]
 [<CommonParameters>]
```

## DESCRIPTION
Helper function that tests, whether a parameter was bound.

## EXAMPLES

### EXAMPLE 1
```
if (Test-PSFParameterBinding "Day")
```

{
    
}

Snippet as part of a function.
Will check whether the parameter "Day" was bound.
If yes, whatever logic is in the conditional will be executed.

### EXAMPLE 2
```
Test-PSFParameterBinding -Not 'Login', 'Spid', 'ExcludeSpid', 'Host', 'Program', 'Database'
```

Returns whether none of the parameters above were specified.

### EXAMPLE 3
```
Test-PSFParameterBinding -And 'Login', 'Spid', 'ExcludeSpid', 'Host', 'Program', 'Database'
```

Returns whether any of the specified parameters was not bound

## PARAMETERS

### -ParameterName
The name(s) of the parameter that is tested for being bound.
By default, the check is true when AT LEAST one was bound.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Not
Reverses the result.
Returns true if NOT bound and false if bound.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: Reverse

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -And
All specified parameters must be present, rather than at least one of them.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Mode
Parameters can be explicitly bound or as scriptblocks to be invoked for each item piped to the command.
The mode determines, which will be tested for.
Supported Modes: Any, Explicit, PipeScript.
By default, any will do.
Whether a parameter was bound as PipeScript is only detectable during the begin block.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Any
Accept pipeline input: False
Accept wildcard characters: False
```

### -BoundParameters
The hashtable of bound parameters.
Is automatically inherited from the calling function via default value.
Needs not be bound explicitly.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: (Get-PSCallStack)[0].InvocationInfo.BoundParameters
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

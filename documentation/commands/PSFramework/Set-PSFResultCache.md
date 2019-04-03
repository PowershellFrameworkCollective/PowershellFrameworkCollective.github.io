---
external help file: PSFramework-help.xml
Module Name: PSFramework
online version:
schema: 2.0.0
---

# Set-PSFResultCache

## SYNOPSIS
Stores a result in the result cache

## SYNTAX

```
Set-PSFResultCache [-InputObject] <Object> [-DisableCache <Boolean>] [-PassThru] [-CommandName <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Stores a result in the result cache.
This function is designed for use in other functions, a user should never have cause to use it directly himself.

## EXAMPLES

### EXAMPLE 1
```
Set-PSFResultCache -InputObject $Results -DisableCache $NoRes
```

Stores the contents of $Results in the result cache, but does nothing if $NoRes is $true (the default Switch-name for disabling the result cache)

### EXAMPLE 2
```
Get-ChildItem $path | Get-Acl | Set-PSFResultCache -DisableCache $NoRes -PassThru
```

Gets all items in $Path, then retrieves each of their Acl, finally it stores those in the result cache (if it isn't disabled via $NoRes) and finally passes each Acl through for the user to see.
This will return all objects, even if $NoRes is set to $True.

## PARAMETERS

### -InputObject
The value to store in the result cache.

```yaml
Type: Object
Parameter Sets: (All)
Aliases: Value

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -DisableCache
Allows you to control, whether the function actually writes to the cache.
Useful when used in combination with -PassThru.
Does not suppress output via -PassThru.
However in combination, these two parameters make caching within a pipeline practical.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -PassThru
The objects that are being cached are passed through this function.
By default, Set-PSFResultCache doesn't have any output.

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

### -CommandName
Default: (Get-PSCallStack)\[0\].Command
The name of the command that called Set-PSFResultCache.
Is automatically detected and usually doesn't need to be changed.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: (Get-PSCallStack)[0].Command
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

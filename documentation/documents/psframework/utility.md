---
title: PSFramework: Utility
---
# Utility

[Back to PSFramework](https://psframework.org/documentation/documents/psframework.html)

## Synopsis

Utility is the catch-all category for individual commands and features that do not fit into any more specific category or would be a category ontu themselves.

## Commands

### Select-PSFObject

`Select-PSFObject` completely replaces `Select-Object`, offering all of its functionality, but offering greater input comfort and more readable code by avoiding hashtables for simple operations. It also adds the ability to extend an object, rather than building a new object, fully replacing `Add-Member`.

+ [Select-PSFObject](utility/select-psfobject.html)

### ConvertFrom-PSFArray

`ConvertFrom-PSFArray` converts properties on objects that are collections into a single string.
This helps with exporting as flat data, e.g. when exporting as csv.

+ [ConvertFrom-PSFArray](utility/convertfrom-psfarray.html)

### Argument Transformation Attributes

Sometimes we need to convert the input we receive into the format we want.
[Parameter Classes](parameter-classes.html) are a way to go about that, but they require quite a bit of effort to implement, if the ones provided by the PSFramework are not enough.

This is where Argument Transformation Attributes can shine:

+ [ScriptTransformation](utility/ScriptTransformation.html): Implement your own conversion logic in script.

### PSFramework Hashtables

Hashtables are awesome!
But they could be even better.
Introducing the PSFramework Hashtables, extending hashtables to include default values, passing through unknown key or even dynamically calculating the result of an unexpected key!

+ [PSFramework Hashtables](utility/psfhashtables.html)

## Notes

[Back to PSFramework](https://psframework.org/documentation/documents/psframework.html)

---
title: Utility: ConvertFrom-PSFArray
---
# ConvertFrom-PSFArray
## Synopsis

Ever wanted to export to csv, but some properties only showed some `System.Object[]` value?
If so, then this command might be for you, as it makes salvaging this situation trivial.

## Description

Whenever you need to force a non-flat object into a flat data structure - a csv export being the most common scenario - you tend to lose some information.

In PowerShell, the most common scenario being it exporting it as its typename, rather than the more useful values inside (this tends to be especially annoying, when the property is a list of very few items that display well on the console).

An example to reproduce the issue:

```powershell
$object = [PSCustomObject]@{
    Name = "Foo"
    Value = 1,2,3
}
$object | ConvertTo-Csv -NoTypeInformation
```

This will result in:

```text
"Name","Value"
"Foo","System.Object[]"
```

Note how the numbers got converted to `System.Object[]`? Yeah.
Let's fix that:

```powershell
$object = [PSCustomObject]@{
    Name = "Foo"
    Value = 1,2,3
}
$object | ConvertFrom-PSFArray | ConvertTo-Csv -NoTypeInformation
```

and voila:

```text
"Name","Value"
"Foo","1, 2, 3"
```

Want to pick the characters it joins the values by?

```powershell
$object = [PSCustomObject]@{
    Name = "Foo"
    Value = 1,2,3
}
$object | ConvertFrom-PSFArray -JoinBy ":" | ConvertTo-Csv -NoTypeInformation
```

```text
"Name","Value"
"Foo","1:2:3"
```

## Notes

[Back to Utility](https://psframework.org/documentation/documents/psframework/utility.html)

| Version | 1.0 |
| Written on: | 2019-11-07 |
| Updated on: | 2019-11-07 |
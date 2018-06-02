# Getting started with Parameter Classes

Parameter Classes enable developers to be more permissive in what input they accept and does all the input interpretation for the developer.

# Implementing Parameter Classes

Parameter classes define new types as input types.
In many instances, implementing them is as simple replacing the expected type on the parameter definition:

```powershell
[CmdletBinding()]
param (
    [string]
    $ComputerName
)
```
would become
```powershell
[CmdletBinding()]
param (
    [PSFComputer]
    $ComputerName
)
```

With this your command will correctly understand dns resolution objects, the output of Get-ADComputer, connection strings or any of a dozen other legal input types.

# Additional Information

 - It is possible to extend the list of legal input types.
 - It is possible to teach it to understand PSCustomObjects, no need to code in C#.

# Further reading

 - [The Computer Parameter Class](https://psframework.org/documentation/documents/psframework/parameter-classes/computer-parameter.html)
 - [The DateTime Parameter Class](https://psframework.org/documentation/documents/psframework/parameter-classes/datetime-parameter.html)
 - [The TimeSpan Parameter Class](https://psframework.org/documentation/documents/psframework/parameter-classes/timespan-parameter.html)
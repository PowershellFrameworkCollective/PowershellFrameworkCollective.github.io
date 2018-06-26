---
title: Tab Completion: Working with the Ast
---
# Working with the Ast
## Synopsis

Shows how to react to the entire pipeline.

## Description

For some seriously advanced tab completion, you can parse the current pipeline and react to commands before and after the command for which you want to complete a parameter's value.
For this you have access to the full Ast via the [$commandAst](special-variables.html) variable.

An non-hardened example that picks up on the properties of the output type of the preceding command:

```powershell
Register-PSFTeppScriptBlock -Name MyModule.IncomingProperties -ScriptBlock {
    $command = $commandAst.Parent.Parent.Statements.PipelineElements[-2].CommandElements | Where-Object { $_ -is [System.Management.Automation.Language.StringConstantExpressionAst] } | Select-Object -First 1 -ExpandProperty Value
    $cmd = Get-Command $command
    if ($cmd.CommandType -eq "Alias") { $cmd = $cmd.ResolvedCommand }
    $cmd.OutputType.Type | ForEach-Object { $_.GetProperties() } | Select-Object -ExpandProperty Name -unique | Sort-Object
}
```

> Note: The above is not robust to many scenarios and may fail (though it will do no harm when it does). This is meant purely as a Proof of Concept.

## Notes
[Back to Tab Expansion](https://psframework.org/documentation/documents/psframework/tab-completion.html)

| Version | 1.0 |
| Written on: | 2018-06-18 |
| Updated on: | 2018-06-26 |
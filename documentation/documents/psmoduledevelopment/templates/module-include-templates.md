---
title: Templates: Modules including own templates
---
# Modules including own templates
## Synopsis

Modules that introduce new file types (for example configuration files) can ship their own templates that are automatically available once imported.

## Description

When a module requires a new file type, those might be convenient to ship as template.

But those files now are in the module folder, how does the PSModuleDevelopment templating system know where to find them?

This is where [Template Stores](template-stores.html) come in:

```powershell
Set-PSFConfig -Module 'PSModuleDevelopment' -Name 'Template.Store.MyModule' -Value "$PSModuleRoot\internal\templates" -Initialize -Validation "string" -Description "Path to the MyModule template store"
```

With this setting applied, PSModuleDevelopment will pick up the path, detect the store and list the templates.


### Notes on dependencies

Setting this configuration requires the `PSFramework` in order to not error out (since the configuration system is part of that module, `PSModuleDevelopment` depends on it as well).

It does _not_ enforce a `PSModuleDevelopment` dependency! The templates and this setting are simply ignored _unless_ the `PSModuleDevelopment` module is present.

This offers an additional convenience without adding an additional burden on users or systems that do not need it.

## Notes
[Back to Templates](http://psframework.org/documentation/documents/psmoduledevelopment/templates.html)

| Version | 1.0 |
| Written on: | 2018-03-08 |
| Updated on: | 2018-03-08 |
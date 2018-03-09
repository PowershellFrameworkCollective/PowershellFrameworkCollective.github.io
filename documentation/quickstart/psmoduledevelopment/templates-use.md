---
title: Getting Started with Using Templates
---
# Getting Started with Using Templates

You can create a new file from a template by running the `Invoke-PSMDTemplate` command and specifying the name of the template to initialize:

```powershell
Invoke-PSMDTemplate -TemplateName function
```

If you want to store it somewhere else, specify the output path:

```powershell
Invoke-PSMDTemplate -TemplateName module -OutPath "C:\temp"
```

Do not specify file or project name in the outpath - those are all covered within the template.

# Additional information

 - It is possible to specify template parameters as hashtable, in order to avoid interactive prompts.
 - It is possible to first use `Get-PSMDTemplate` to select just what template to create from (handy in case of multiple versions)
 - It is possible to set up default parameters, in order to always set the same value on the same template parameter prompt

# Further reading

 - [Template Types](http://psframework.org/documentation/documents/psmoduledevelopment/templates/template-types.html)
 - [Creating a new file template](http://psframework.org/documentation/documents/psmoduledevelopment/templates/creating-a-new-file-template.html)
 - [Creating a new project template](http://psframework.org/documentation/documents/psmoduledevelopment/templates/creating-a-new-project-template.html)
 - The [Project Reference File](http://psframework.org/documentation/documents/psmoduledevelopment/templates/project-reference-file.html)
 - [Template Versions](http://psframework.org/documentation/documents/psmoduledevelopment/templates/template-versions.html)
 - [Overwriting default templates](http://psframework.org/documentation/documents/psmoduledevelopment/templates/overwriting-default-templates.html)
 - [Working with ScriptBlocks](http://psframework.org/documentation/documents/psmoduledevelopment/templates/working-with-scriptblocks.html)
 - [Template Stores](http://psframework.org/documentation/documents/psmoduledevelopment/templates/template-stores.html)
 - [Default template parameters](http://psframework.org/documentation/documents/psmoduledevelopment/templates/default-template-parameters.html)

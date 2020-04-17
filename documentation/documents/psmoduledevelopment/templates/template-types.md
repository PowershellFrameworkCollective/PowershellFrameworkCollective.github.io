---
title: Templates: Template Types
---
# Template Types
## Synopsis

There are two kinds of templates: File & Project. But what's the difference?

## Description

There is little technical difference, the main one being that only projects support a [Project Reference File](project-reference-file.html).

If you use `New-PSMDTemplate` with the `-FilePath` parameter, you create a file template, if you use the `-ReferencePath` parameter, it will be a project.

The difference is mostly academic right now, but the design goal is to differentiate between them, due to the fundamental difference in purpose. Future features may differentiate more heavily between the two.

## Notes
[Back to Templates](https://psframework.org/documentation/documents/psmoduledevelopment/templates.html)

| Version | 1.0 |
| Written on: | 2018-03-08 |
| Updated on: | 2018-03-08 |

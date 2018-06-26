---
title: PSFramework: Tab Completion
---

# Tab Completion

## Synopsis

PSFramework Tab Completion makes deploying custom tab expansion / completion a painless and fast experience.

## Key Features

 - Simple design for tab completion
 - Transparent system for assigning tab completion
 - Use both PS5+ native feature as well as Tab Expansion Plus Plus if available
 - Fails silently when prerequisites do not exist

## Description

Custom tab completion has been around for some years now.
Originally introduced by Jason Shirk in his module `Tab Expansion Plus Plus`, it allows assigning a scriptblock to a parameter, so it will be executed when the user tries to tab-complete an argument for a command's parameter.

This has massively changed the way user experience can be optimized, flexibly offering user just the options that matter to him.
This reduces typing and the amount of typos and frustration.

However the previous implementations were _not_ optimized for _developer_ experience.
They require quite a bit of learning ... and look scary enough that many didn't bother to make the effort.
Add to that that it is quite cumbersome to manage and reuse scriptblocks for this, as well as having to handle scenarios where the prerequisites are not available ... it has seen too little use.

This has to change.

The PSFramework Tab Completion component removes most overhead, makes it easy to deploy and manage and offers flexibility in how to place the related resources in your module.

## Quick Start Guides

 - [Getting Started with Tab Completion](https://psframework.org/documentation/quickstart/psframework/tabcompletion.html)

## Documentation

 - [Basics](tab-completion/basics.html)
 - [Special Variables](tab-completion/special-variables.html)
 - [Working with the Word to Complete](tab-completion/typed-so-far.html)
 - [Accessing already bound parameters](tab-completion/previous-parameters.html)
 - [Accessing the parameter bound to](tab-completion/called-parameter.html)
 - [Accessing the called command](tab-completion/calling-command.html)
 - [Accessing the Ast](tab-completion/accessing-the-ast.html)

## Notes

[Back to PSFramework](https://psframework.org/documentation/documents/psframework.html)

| Version | 1.0 |
| Written on: | 2018-06-18 |
| Updated on: | 2018-06-26 |
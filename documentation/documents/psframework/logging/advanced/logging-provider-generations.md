# Logging Provider: Generations

## Synopsis

The logging system has evolved over time.
However, due to the [PSFramework Reliability Promise](https://github.com/PowershellFrameworkCollective/psframework/blob/development/PSFramework/The%20PSFramework%20Reliability%20Promise.md) backwards compatibility needed to be retained.

This lead to multiple generations of Logging Providers, with different sets of capabilities and behaviors.
Generally, the greater the version number, the newer, the better and more shiny.

All documentation other than this one file refers to the latest version of Logging Providers, all new Logging Providers should be developed as the latest available generation.

## Generation 1

The original logging provider system.
It has several significant caveats and handicaps.
Most notably: All generation 1 logging providers share the same scope - all variables, all functions are shared.
This makes it absolutely important to properly namespace variables and commands to avoid conflicts.

## Generation 2

> As of this time the latest version

With the second generation logging provider system, significant new capabilities were added:

+ Support for multiple instances of the same provider
+ Full resource isolation
+ Improved debugging capabilities
+ Easier to implement

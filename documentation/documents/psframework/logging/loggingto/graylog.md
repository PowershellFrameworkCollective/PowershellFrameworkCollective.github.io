# Logging to: Graylog

> [Back to: Logging](../../logging.html)

## Setting up logging

> Installation

This logging provider requires an installation step:
It uses/depends upon the [PowerShell module PSGELF](https://github.com/jeremymcgee73/PSGELF).

To provide this module, you can run the following line:

```powershell
Install-PSFLoggingProvider -Name gelf
```

> Setting up logging

To register the Graylog server as a logging target, run:

```powershell
$paramSetPSFLoggingProvider = @{
    Name         = 'gelf'
    InstanceName = 'MyTask'
    GelfServer   = 'hostname'
    Port         = 443
    Enabled      = $true
    Wait         = $true
}
Set-PSFLoggingProvider @paramSetPSFLoggingProvider
```

(replacing the values for GelfServer and port accordingly)

## Generating Messages

You can write messages using the `Write-PSFMessage` cmdlet, which functionally replaces Write-Verbose, Write-Host, Write-Warning, Write-Debug or Write-Log:

```powershell
# Verbose
Write-PSFMessage -Message "Test Message"

# Host
Write-PSFMessage -Level Host -Message "Message visible to the user"

# Debug
Write-PSFMessage -Level Debug -Message "Very well hidden message"

# Warning
Write-PSFMessage -Level Warning -Message "Warning Message"
```

You can also add tags for better filtering:

```powershell
Write-PSFMessage -Message "Tagged Message" -Tag special, custom, whatever
```

Specify the target you are working against to better track actions relating to that specific target:

```powershell
Write-PSFMessage -Message "Doing something" -Target $ComputerName
```

For more details on how to generate messages, [see the dedicated documentation page](../basics/writing-messages.html)

## Logging Provider Documentation

For more detailed docs, [see the full documentation for the GELF logging provider](../providers/gelf.html)

> [Back to: Logging](../../logging.html)

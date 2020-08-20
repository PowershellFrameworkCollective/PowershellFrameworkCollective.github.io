> [Back to: Logging](../../logging.html)

## Setting up logging

For logging to Splunk, you first need to [create an http listener](https://ntsystems.it/post/sending-events-to-splunks-http-event-collector-with-powershell).

Once that has been taken care of, you can register the logging thus:

```powershell
$paramSetPSFLoggingProvider = @{
    Name         = 'splunk'
    InstanceName = 'MyTask'
    Url          = 'https://servername:8088/services/collector'
    Token        = '<Token>'
    Enabled      = $true
}
Set-PSFLoggingProvider @paramSetPSFLoggingProvider
```

> Splunk Cloud service

Logging to the cloud version of Splunk works exactly the same way - configure the listener, then register it with the hostname of your cloud instance: `'https://instance-hostname:8088/services/collector'`

> The SSL Thing

On default Splunk instances, you can - and probably should - use https, not the unencrypted http.
However, default installations - including the cloud service - do not contain a trusted certificate.
If you cannot make it trusted, you can have the logging provider ignore it thus:

```powershell
$paramSetPSFLoggingProvider = @{
    Name         = 'splunk'
    InstanceName = 'MyTask'
    Url          = 'https://servername:8088/services/collector'
    Token        = '<Token>'
    IgnoreCert   = $true
    Enabled      = $true
}
Set-PSFLoggingProvider @paramSetPSFLoggingProvider
```

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

For more detailed docs, [see the full documentation for the splunk logging provider](../providers/splunk.html)

> [Back to: Logging](../../logging.html)

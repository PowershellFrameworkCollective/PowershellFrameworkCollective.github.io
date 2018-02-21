Write-Host " - "
Write-Host "###############################################################"
Write-Host " - "
Write-Host "Installing PSFramework master"
Invoke-WebRequest "https://raw.githubusercontent.com/PowershellFrameworkCollective/psframework/master/install.ps1" -UseBasicParsing | Invoke-Expression

Write-Host " - "
Write-Host "###############################################################"
Write-Host " - "
Write-Host "Installing PSModuleDevelopment master"
Invoke-WebRequest "https://raw.githubusercontent.com/PowershellFrameworkCollective/PSModuleDevelopment/master/install.ps1" -UseBasicParsing | Invoke-Expression

Write-Host " - "
Write-Host "###############################################################"
Write-Host " - "
Write-Host "Installing PSUtil master"
Invoke-WebRequest "https://raw.githubusercontent.com/PowershellFrameworkCollective/PSUtil/master/install.ps1" -UseBasicParsing | Invoke-Expression

Write-Host " - "
Write-Host "###############################################################"
Write-Host " - "
Write-Host "Installing platyPS from gallery"
Install-Module platyPS -ErrorAction Stop -Force
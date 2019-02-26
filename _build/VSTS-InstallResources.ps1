Write-Host " - "
Write-Host "###############################################################"
Write-Host " - "
Write-Host "Installing PSFramework"
Install-Module PSFramework -ErrorAction Stop -Force

Write-Host " - "
Write-Host "###############################################################"
Write-Host " - "
Write-Host "Installing PSModuleDevelopment"
Install-Module PSModuleDevelopment -ErrorAction Stop -Force

Write-Host " - "
Write-Host "###############################################################"
Write-Host " - "
Write-Host "Installing PSUtil"
Install-Module PSUtil -ErrorAction Stop -Force

Write-Host " - "
Write-Host "###############################################################"
Write-Host " - "
Write-Host "Installing MailDaemon"
Install-Module MailDaemon -ErrorAction Stop -Force

Write-Host " - "
Write-Host "###############################################################"
Write-Host " - "
Write-Host "Installing platyPS"
Install-Module platyPS -ErrorAction Stop -Force
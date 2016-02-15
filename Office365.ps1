
--Connect to MSOL Online --

Set-ExecutionPolicy RemoteSigned

$credential = Get-Credential

Import-Module MsOnline

Connect-MsolService -Credential $credential

--Remove User from Recycle Bin --

Get-MsolUser -ReturnDeletedUsers | Remove-MsolUser -RemoveFromRecycleBin -Force


-- Connect to Exchange Online --

Set-ExecutionPolicy RemoteSigned

$credential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session

-- Remove all Non-Licensed Users from O365 --
Get-MsolUser -all | Where-Object {$_.isLicensed -ne "true"}| Remove-MsolUser -Force

-- Troubleshooting Commands --
Get-Migrationconfig | fl > c:\Get-Migrationconfig.txt
Get-Migrationendpoint | fl > c:\Get-Migrationconfig2.txt
Get-MigrationBatch -Diagnostic -IncludeReport -Verbose | fl > c:\Get-MigrationBatch-Diagnostic.txt
Get-MigrationStatistics | fl > c:\Get-MigrationStatistics.txt
Get-OrganizationConfig | fl > c:\Get-OrganizationConfig.txt
Get-Migrationuser -Identity user@domain.com | fl > c:\Get-Migrationuser.txt
Get-MigrationUserStatistics -id user@domain.com  -diagnostic | fl > c:\Get-MigrationUserStatisticsdiagnostic.txt
Get-MigrationUserStatistics -id user@domain.com  -includereport | fl > c:\Get-MigrationUserStatisticsincludereport.txt
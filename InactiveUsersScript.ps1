<#The sample scripts are provided AS IS without warranty
of any kind. The entire risk arising out of the use or performance of the sample scripts and documentation remains with you. In no
event, its authors, or anyone else involved in the creation, production, or delivery of the scripts be liable for any damages whatsoever
(including, without limitation, damages for loss of business profits, business interruption, loss of business information, or other pecuniary
loss) arising out of the use of or inability to use the sample scripts or documentation#>

Import-Module ExchangeOnlineManagement
Import-Module AzureAD

Connect-AzureAD
Connect-ExchangeOnline

$startDate = (Get-Date).AddDays(-90).ToString('MM/dd/yyyy')
$endDate = (Get-Date).ToString('MM/dd/yyyy')

$allUsers = @()
$allUsers = Get-AzureADUser  -Filter "AccountEnabled eq true"  | Select UserPrincipalName

$loggedOnUsers = @()
$loggedOnUsers = Search-UnifiedAuditLog -StartDate $startDate -EndDate $endDate -Operations UserLoggedIn, PasswordLogonInitialAuthUsingPassword, UserLoginFailed -ResultSize 5000

$inactiveInLastThreeMonthsUsers = @()
$inactiveInLastThreeMonthsUsers = $allUsers.UserPrincipalName | where {$loggedOnUsers.UserIds -NotContains $_}



Out-File InactiveUsers.txt

Write-Host "Inactive users report is saved under " $pwd.Path "\inactiveUsers.txt" -ForegroundColor Green -NoNewline;


Write-Host " "

Write-Host "The following users have no logged in for the last 90 days:" -ForegroundColor "Yellow"

Write-Output $inactiveInLastThreeMonthsUsers

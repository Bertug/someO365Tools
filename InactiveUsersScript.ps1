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
Set-Location "C:\Users\user\Documents\Scripts"
#define path here

Connect-AzureAD

$Date = Get-Date -Format d
$Header = "<h1> Office 365 Report for $Date</h1>"
$Licenses = Get-AzureADSubscribedSku | Select-Object -Property SkuPartNumber, ConsumedUnites -ExpandProperty PrepaidUnits | ConvertTo-Html -Fragment -PreContent "<h1>License Information</h1>"
$Users = Get-AzureADUser | Where-Object {$_.UserType -eq "Member"} | Select-Object -Property UserPrincipalName, DisplayName, Country, Department | ConvertTo-Html -Fragment -PreContent "<h1>Office 365 Users</h1>"
$Guest = Get-AzureADUser | Where-Object {$_.UserType -eq "Guest"} | Select-Object -Property UserPrincipalName, Mail, DisplayName | ConvertTo-Html -Fragment -PreContent "<h1>Office 365 Guest Users</h1>"

ConvertTo-Html -Body "$Header $Licenses $Users $Guest"  -CssUri "C:\Users\beyemen\Documents\Scripts\styles.css"  -Title "O365 Report"  | Out-File -encoding ASCII Licenses3.html

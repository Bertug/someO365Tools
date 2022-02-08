Import-Module ExchangeOnlineManagement

Connect-IPPSSession

New-ActivityAlert -Name "Break Glass Login Alert" -Description "Trigger the alert when there is a login for the break glass account" -Operation UserLoggedIn -NotifyUser "admin@domain.onmicrosoft.com" -UserId "meganB@Mdomain.onmicrosoft.com" -Severity High 
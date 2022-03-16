<#The sample scripts are provided AS IS without warranty
of any kind. The entire risk arising out of the use or performance of the sample scripts and documentation remains with you. In no
event, its authors, or anyone else involved in the creation, production, or delivery of the scripts be liable for any damages whatsoever
(including, without limitation, damages for loss of business profits, business interruption, loss of business information, or other pecuniary
loss) arising out of the use of or inability to use the sample scripts or documentation#>

Import-Module ExchangeOnlineManagement

Connect-IPPSSession

New-ActivityAlert -Name "Break Glass Login Alert" -Description "Trigger the alert when there is a login for the break glass account" -Operation UserLoggedIn -NotifyUser "admin@domain.onmicrosoft.com" -UserId "meganB@Mdomain.onmicrosoft.com" -Severity High 

 Import-Module ExchangeOnlineManagement

 Connect-ExchangeOnline 
 
## $endDate = (get-date).ToString("MM/dd/yyy")

 $recipientAddress = ###Provide recipient address 

 $date=get-date
 
 $startDate = $date.AddDays(-7).ToString("MM/dd/yyy")

 $endDate = $date.AddDays(+1).ToString("MM/dd/yyy")


 $file = $date.ToString("MMddyyy") + "DL1" + ".txt"

 $fileName = ".\" + $file

 $output = Get-MessageTrace -RecipientAddress $recipientAddress -StartDate $startDate -EndDate $endDate | where-object{$_.subject -like "Unsubscribe From DL*"}  | ft *Sender* -HideTableHeaders

 ##MODIFY Subject "Unsubscribe From DL*"
 
 ## $output | Out-File $fileName

 $output | Out-File $fileName
 
 

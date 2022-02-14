Import-Module ExchangeOnlineManagement
Import-Module MSOnline
Connect-IPPSSession
Connect-MsolService

$idGroup= Read-Host "Type the ID of the security group"
#To hardcode the group remove the above line and place the below one with the group ID
#$idGroup= Read-Host "Type the ID of the security group"


$eDiscoveryAdmins = Get-eDiscoveryCaseAdmin
$Members = Get-MsolGroupMember -GroupObjectId $idGroup

foreach ($admin in $eDiscoveryAdmins){
    
    if ($admin.Name -in $Members.DisplayName) {Write-Host $admin.Name ",eDiscovery admin is already in the group." -ForegroundColor Yellow}
    else{
    
    Add-MsolGroupMember -GroupMemberObjectId $admin.Guid -GroupObjectId "4535ff6c-2ac7-43ae-810e-64d9e72fdd36"
    Write-Host $admin.Name "added to the group." -ForegroundColor Green
    }
    
}

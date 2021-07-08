# Install-Module -Name MicrosoftTeams -Force -AllowClobber
# Import-Module MicrosoftTeams

$credential = Get-Credential
Connect-MicrosoftTeams -Credential $credential

$teams = Get-Team -Visibility Public
foreach($team in $teams){Set-Team -GroupId $team.GroupId -Visibility Private}
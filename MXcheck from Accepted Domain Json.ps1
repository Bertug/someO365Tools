$file = Get-Content -Path AcceptedDomains.json | ConvertFrom-Json

$acceptedDomains = $file | select name

forEach($x in $acceptedDomains)
{
    Resolve-DnsName -name $x.name -Type MX >> Coutput.txt
}


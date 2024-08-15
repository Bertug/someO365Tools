$WorkspaceName = Read-Host "Please enter your Workspace Name"

#Construct the URI using string concatenation
$uri = "https://$WorkspaceName" + "sensorapi.atp.azure.com/tri/sensor/api/ping"
$domain = "$WorkspaceName" + "sensorapi.atp.azure.com"

# Invoke the web request using the constructed URI
$response = Invoke-WebRequest -Uri $uri

#$response.StatusCode

if ($response.StatusCode -eq 200) {
    Write-Host "Connection to ${WorkspaceName}sensorapi.atp.azure.com " -NoNewline
    Write-Host "OK" -ForegroundColor Green
} else {
    Write-Host "Connection failed with status code:" -NoNewline 
    Write-Host "$response.StatusCode" -ForegroundColor Red
}


# Define the domain and port
#$domain = "m365x07749586sensorapi.atp.azure.com"
$port = 443

# Test connectivity to the domain and port
$TestNetConnectionResult = Test-NetConnection -ComputerName $domain -Port $port

if ($TestNetConnectionResult.TcpTestSucceeded -eq "True") {
    Write-Host "Connection to ${WorkspaceName}sensorapi.atp.azure.com " -NoNewline
    Write-Host "OK" -ForegroundColor Green -NoNewline
    Write-Host " Over TCP 443."
} else{
    Write-Host "Connection failed with status code:" -NoNewline 
    Write-Host "$TestNetConnectionResult.TcpTestSucceeded" -ForegroundColor Red
}
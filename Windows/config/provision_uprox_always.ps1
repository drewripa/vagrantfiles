#Setup default gateway
$NIC = Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Computername . |
        Where-Object {$_.IPAddress -like "192.168.0.2"}
$NIC.SetGateways("192.168.0.1")

#Start services
Get-Service -DisplayName "SQL Server (SQLEXPRESS)" | Start-Service
Get-Service -DisplayName "U-Prox IP Hardware Service" | Start-Service

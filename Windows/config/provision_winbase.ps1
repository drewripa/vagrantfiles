$NIC = Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Computername . |
        Where-Object {$_.IPAddress - like "192.168.0.2"}
$NIC.SetGateway("192.168.0.1")

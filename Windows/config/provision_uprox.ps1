#Stop SQL Service first
Get-Service -DisplayName "SQL Server (SQLEXPRESS)" | Stop-Service -Force

#Copy DB files from Vagrant host Location
$SOURCE = "\\tsclient\C\Users\Drew\Documents\MEGA\DB\uprox\latest\*"
$DESTINATION = "C:\Program Files (x86)\A2SoftIn\UProxIP"
Copy-Item -Path $SOURCE -Destination $DESTINATION

#Start SQL Service finally
Get-Service -DisplayName "SQL Server (SQLEXPRESS)" | Start-Service

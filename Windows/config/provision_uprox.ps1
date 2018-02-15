#Global Path section
$SOURCE = "\\tsclient\C\Users\Drew\Documents\MEGA\DB\uprox\latest\*"
$DESTINATION = "C:\Program Files (x86)\A2SoftIn\UProxIP"
$BKPSOURCE = "C:\Program Files (x86)\A2SoftIn\UProxIP\UProxIP*.*df"
$BKPDESTINATION = "\\tsclient\C\Users\Drew\Documents\MEGA\DB\uprox\bkp"
$BKPLATEST = "\\tsclient\C\Users\Drew\Documents\MEGA\DB\uprox\latest"


#Stop Service first
Get-Service -DisplayName "U-Prox IP Hardware Service" | Stop-Service -Force
Get-Service -DisplayName "SQL Server (SQLEXPRESS)" | Stop-Service -Force

#Copy DB files from Vagrant host Location
Copy-Item -Path $SOURCE -Destination $DESTINATION

#Start SQL Service finally
Get-Service -DisplayName "SQL Server (SQLEXPRESS)" | Start-Service
Get-Service -DisplayName "U-Prox IP Hardware Service" | Start-Service

#Backup script for 'Desktop' folder
$Stream = [System.IO.StreamWriter] "c:\Users\vagrant\Desktop\Backup.ps1"
$Stream.Write(
  "`$Date = Date -Format `"dd-MM-yyyy`"
   mkdir -Force `"$BKPDESTINATION`$Date`"

   Get-Service -DisplayName `"U-Prox IP Hardware Service`" | Stop-Service -Force
   Get-Service -DisplayName `"SQL Server (SQLEXPRESS)`" | Stop-Service -Force
   Copy-Item -Path `"$BKPSOURCE`" -Destination `"$BKPDESTINATION\`$Date`"
   Copy-Item -Path `"$BKPSOURCE`" -Destination `"$BKPLATEST`"
   Get-Service -DisplayName `"SQL Server (SQLEXPRESS)`" | Start-Service
   Get-Service -DisplayName `"U-Prox IP Hardware Service`" | Start-Service
  ")
$Stream.close()

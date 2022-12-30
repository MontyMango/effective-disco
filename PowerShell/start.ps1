$NAME=(Read-HostRead-Host)
Write-Output "hello $NAME! Uhh, let me check the time"

$TZ=(Get-TimeZone)
Write-Output $TZ

Get-Host 
Set-Date -Date 12/23/2022 
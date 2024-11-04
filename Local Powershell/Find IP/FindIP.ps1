$Net = Get-NetIPAddress -addressfamily ipv4
$Net|Where-Object IPAddress -notlike "169.254.*"|Where-Object IPAddress -notmatch "127.0.0.1"|ft ipaddress,interfacealias

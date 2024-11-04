$Net = Get-NetIPAddress -addressfamily ipv4|Where-Object IPAddress -notlike "169.254.*"|Where-Object IPAddress -notmatch "127.0.0.1"

if($Net.IPAddress -like "10.0.*"){
    write-host "On local network"
}else {
    write-host "Not on local network"
}

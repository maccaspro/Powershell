if((Get-NetAdapterBinding -name "*" -ComponentID ms_tcpip6).Enabled -eq $true){
    Write-Warning "Not Compliant"
    Exit 1
}
else{
    Write-Output "Compliant"
    Exit 0
}

$Key = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power"
$Dword = "HiberbootEnabled"
$Value = 0

Try {
    $Reg = Get-ItemProperty -path $Key -name $Dword |Select-Object -ExpandProperty $Dword

    if($Reg -eq $Value){
        Write-Output "Disabled"
        Exit 0
    }
    Write-Warning "Enabled"
    Exit 1
}
Catch {
    Write-Warning "Enabled"
    Exit 1
}

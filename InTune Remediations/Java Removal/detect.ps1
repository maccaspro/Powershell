$path = "C:\Program Files (x86)\Java"
$path2 = "C:\Program Files\Java"

if((Test-Path $path) -or (Test-Path $path2)){
    Write-Warning "Not Compliant"
    Exit 1
}
else{
    Write-Host "Compliant"
    Exit 0
}

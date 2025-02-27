$path = "C:\Program Files (x86)\Java"

if(Test-Path -path $path){
    Write-Warning "Not Compliant"
    Exit 1
}
else{
    Write-Host "Compliant"
    Exit 0
}

$path = 'C:\windows\system32\GroupPolicy\machine\Registry.pol'

if(Test-Path -Path $path){
    write-warning "Not Compliant"
    Exit 1
}
else{
    Write-Output "Compliant"
    Exit 0
}

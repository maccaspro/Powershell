$path = "C:\Program Files (x86)\Java"
$path2 = "C:\Program Files\Java"

gwmi win32_product -filter "name like 'Java%' AND vendor like 'Oracle%'" | % {$_.Uninstall() }

if(Test-Path $path){
    Remove-Item -Path $path -Recurse -Force
}
if(Test-Path $path2){
    Remove-Item -Path $path2 -Recurse -Force
}

Import-Module ActiveDirectory
$ou = "OU=SomeOU,dc=domain,dc=com"
$ScriptPath = "storagelocation\loginscript.bat"

Get-ADUser -filter * -SearchBase $ou -Properties ScriptPath 
ForEach-Object {
    Set-ADUser $_.samaccountname -ScriptPath $ScriptPath
}

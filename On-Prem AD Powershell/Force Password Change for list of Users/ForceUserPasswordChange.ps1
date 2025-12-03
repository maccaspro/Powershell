$users = Import-Csv -Path "c:\scripts\PW Reset\PasswordResetList.csv"

$users |ForEach-Object{ 
        $aduser = Get-ADUser -filter "DisplayName -like '$($_.Name)'"
if ($aduser) {
        Write-Output "Setting Change Password at next logon flag for user $($aduser.SamAccountName)"
        Set-ADUser -identity $aduser -ChangePasswordAtLogon:$true
}
else {
        Write-Warning "Could not find user in AD with display name $($_.Name)"
}
}

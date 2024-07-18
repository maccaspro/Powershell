import-module activedirectory
$groupname = 'Group Name'
$users = import-csv "c:\temp\DisplayNames.csv"
import-csv -path "c:\temp\Displaynames.csv" |ForEach-Object{ 
        $aduser = Get-ADUser -filter "DisplayName -like '$($_.Name)'"
if ($aduser) {
        Write-Output "Adding user $($aduser.SamAccountName) to $Groupname"
        Add-adgroupmember -Identity $GroupName -members $aduser
}
else {
        Write-Warning "Could not find user in AD with display name $($_.Name)"
}
}

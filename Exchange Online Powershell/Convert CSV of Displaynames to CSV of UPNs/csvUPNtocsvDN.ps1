#Displayname CSV should have column titled "User"

$users=@()
$usercsv = import-csv "c:\temppath\displaynames.csv"
foreach($user in $UserCSV){
         $users += Get-AzureADUser -SearchString $user.User | Select UserPrincipalName
}
$users| export-csv "c:\temppath\UPNs.csv" -notypeinformation

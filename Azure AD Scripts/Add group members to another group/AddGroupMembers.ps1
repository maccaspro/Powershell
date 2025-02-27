Import-Module AzureAD
Connect-AzureAD

$GroupNames = @("Group1","Group2","Group3","Group4")
$DestGroup = (Get-AzureADGroup -SearchString "NewGroup1").objectID

foreach($GroupName in $GroupNames){
    $userIDs = Get-AzureADGroupMember -ObjectId (Get-AzureADGroup -SearchString $GroupName -all $true).ObjectID|select -ExpandProperty ObjectID

    ForEach($UserID in $UserIDs){
        Try{
            Add-AzureADGroupMember -ObjectID $DestGroup -RefObjectId $UserID
        }
        Catch{
            Write-Host "User already member"
        }
    }
}

$groups = Get-UnifiedGroup
$groups |ForEach-Object { $groupId = $_.GroupId
>> $GroupName = $_.DisplayName
>> $members = Get-UnifiedGroupLinks -Identity $groupname -LinkType members
>> $members |select-object @{Name="Group";Expression={$groupName}},@{Name="User";Expression={$_.displayname}}
>> } | Export-csv -path "C:\TempPath\CHR Group Members.csv" -NoTypeInformation

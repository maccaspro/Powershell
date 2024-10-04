v# Set path
$FolderPath = Get-ChildItem -Directory -path "\\server\share" -Recurse -Force

$Output = @()

ForEach ($Folder in $FolderPath) {
    $Acl = Get-Acl -Path $Folder.FullName

    
    ForEach ($Access in $Acl.Access) {
        $Properties = [ordered]@{
        "Name" = $Folder.Name
        "Group/User" = $Access.IdentityReference
        "Type" = $Access.AccessControlType
        "Permissions" = $Access.FileSystemRights
        "Inherited" = $Access.IsInherited
        "Inheritance" = $Access.InheritanceFlags
        "Propagation" = $Access.PropagationFlags
        "Location" = $Folder.FullName
        }

$Output += New-Object -TypeName PSObject -Property $Properties            
    }
}

$date = (Get-Date).ToString('yyyy-MM-dd_HH-mm')
$fileName = "ACL-List-" + $date + ".csv"
$DesktopPath = [Environment]::GetFolderPath("Desktop")
$fullPath = $DesktopPath + "\" + $fileName
 
$Output | Export-Csv -Path $fullPath -NoTypeInformation

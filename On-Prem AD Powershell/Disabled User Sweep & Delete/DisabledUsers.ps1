$ADAttribute = 'facsimileTelephoneNumber'
$MaxAge = 31
$DisabledOU = 'OU=Users,OU=Disabled Accounts,DC=mtcedom,DC=multimatic,DC=com'

function Set-DisabledUserTimeStamp {
    param (
        $User,
        $Attribute
    )
    Set-ADUser -Identity $User -Clear $Attribute
    Set-ADUser -Identity $User -Add @{$Attribute="$(Get-Date -f yyyy-MM-dd)"}
}

Search-ADAccount -AccountDisabled | Where {$_.DistinguishedName -notlike $DisabledOU} | Move-ADObject -TargetPath $DisabledOU

$ADUserParams = @{
    Filter = 'Enabled -Ne "true"'
    Properties = $ADAttribute
}

if ($DisabledOU) { $ADUserParams.BaseOU = $DisabledOU }

$DisabledUsers = Get-ADUser @ADUserParams

$UsersWithoutAttributeSet, $UsersWithAttributeSet = $DisabledUsers.Where({[String]::IsNullOrEmpty($_.$ADAttribute)}, 'Split')

$UsersWithoutAttributeSet | ForEach-Object { 
    Write-Verbose "Attribute $ADAttribute is blank, setting timestamp."
    Set-DisabledUserTimeStamp -User $_ -Attribute $ADAttribute 
}

$UsersCanParseDate, $UsersCannotParseDate = $UsersWithAttributeSet.Where({
    try { 
        $isSet = [datetime]$User.$ADAttribute; 
    } finally {
        $isSet -ne $null
    } 
}, 'Split')

$UsersCannotParseDate | ForEach-Object { 
    Write-Verbose "Attribute $ADAttribute exists, but isn't valid date, setting timestamp."
    Set-DisabledUserTimeStamp -User $_ -Attribute $ADAttribute 
}

$UsersCanParseDate | Where-Object {($_.$ADAttribute -lt (Get-Date).AddDays(-$MaxAge))} | ForEach-Object {
    Write-Verbose "User timestamp more than $MaxAge days old, deleting $($User.Name)."
    Remove-ADUser -Identity $User -Confirm:$false  
}

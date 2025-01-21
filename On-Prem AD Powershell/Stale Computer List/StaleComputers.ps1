$path = "c:\temp\inactivecomputers.csv"
$day = (Get-Date).AddDays(-365) #Number of days before today since the last logon, 365 being 1 year or longer since last log on.
$endpoint = Get-ADComputer -Property Name,lastLogonDate -Filter {lastLogonDate -lt $day}| Where {$_.DistinguishedName -notlike "*Disabled*"}

$endpoint |Select-Object -Property Name,lastLogonDate | export-csv -path $path -NoTypeInformation

# If you would like to Disable these computer accounts, uncomment the following line:
# $endpoint |Set-ADComputer -Enabled $false

# If you would like to Remove these computer accounts, uncomment the following line:
# $endpoint |Remove-ADComputer

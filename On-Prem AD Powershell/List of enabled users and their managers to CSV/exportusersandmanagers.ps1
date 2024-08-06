get-aduser -filter * -properties *| where {$_.Enabled -eq $True}|select name,@{n='Manager';e={(Get-ADuser $_.manager).name}}|export-csv "c:\temppath\usermanager.csv" -notypeinformation

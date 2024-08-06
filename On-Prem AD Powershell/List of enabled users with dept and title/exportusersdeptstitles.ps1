get-aduser -filter 'enabled -eq $true' -properties *|select name,department,title |export-csv -path "c:\temppath\Users Dept Title.csv" -notypeinformation

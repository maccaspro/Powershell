get-compliancesearch -identity "name"
#Ensure search has completed

new-compliancesearchaction -searchname "name" -purge -purgetype HardDelete -force
get-compliancesearchaction -identity "name_purge"
#search name is suffixed with _purge for the search action

get-compliancesearchaction -identity "name_purge" |select *
#Once complete this will show the results of what was purged

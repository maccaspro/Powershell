enable-mailbox user@domain.com -autoexpandingarchive
#for enabling on an individual user's mailbox

Set-OrganizationConfig -AutoExpandingArchive
#enables for entire Org

get-mailbox user@domain.com |fl autoexpandingarchiveenabled
#verify Auto Expanding Archive has been enabled on the individual mailbox

Get-OrganizationConfig | FL AutoExpandingArchiveEnabled
#verify it has been enabled for the org

import-csv "c:\temppath\Displaynames.csv"|foreach {Add-MailboxPermission mailbox@domain.com -user $_.Displayname -AccessRights FullAccess}
#Adds read permissions from CSV of displaynames with column titled "displayname"

import-csv "c:\temppath\newcastle homework mailbox.csv"|foreach {Add-RecipientPermission newcastlehomework@vhg.co.uk -AccessRights SendAs -trustee $_.Displayname -confirm:$false}
#Adds SendAs permissoins from CSV of displaynames with column titled "displayname"

import-csv "c:\temppath\Displaynames.csv"|foreach {Add-MailboxPermission mailbox@domain.com -user $_.Displayname -AccessRights FullAccess}
#Adds read permissions from CSV of displaynames with column titled "displayname"

import-csv "c:\temppath\Displaynames.csv"|foreach {Add-RecipientPermission mailbox@domain.com -AccessRights SendAs -trustee $_.Displayname -confirm:$false}
#Adds SendAs permissoins from CSV of displaynames with column titled "displayname"

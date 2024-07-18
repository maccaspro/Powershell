import-csv "c:\temppath\Displaynames.csv"|foreach {Add-MailboxPermission mailbox@domain.com -user $_.Displayname -AccessRights FullAccess}
#CSV should have column titled "DisplayName"

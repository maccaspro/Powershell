Add-mailboxfolderpermission -identity Ayla@contoso.com:\Calendar -user ed@contoso.com -AccessRights Owner
#This gives Ed the owner role on Ayla's calendar

Add-MailboxFolderPermission -identity Ayla@contoso.com:\Calendar -User laura@contoso.com -AccessRights Editor -SharingPermissionFlags Delegate,CanViewPrivateItems
#This adds Laura as a delegate to Ayla's calendar with access to view private items

$oemkey = ((Get-WmiObject -query ‘select * from SoftwareLicensingService’).OA3xOriginalProductKey).ToString()
slmgr /upk
slmgr /ipk $oemkey
slmgr /ato

slmgr /dlv
#this should now show the licence status as licensed.

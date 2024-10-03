net stop wuauserv
net stop bits
net stop cryptsvc
net stop msiserver
rm -r -fo C:\windows\SoftwareDistribution
rm -r -fo C:\windows\System32\catroot2
rm -r -fo C:\windows\System32\appmgmt
net start wuauserv
net start bits
net start cryptsvc
net start msiserver

stop-service wuauserv, bits, cryptsvc, msiserver
rm -r -fo C:\windows\SoftwareDistribution
rm -r -fo C:\windows\System32\catroot2
rm -r -fo C:\windows\System32\appmgmt
start-service wuauserv, bits, cryptsvc, msiserver

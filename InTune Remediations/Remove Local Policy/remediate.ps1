$path = 'C:\windows\system32\GroupPolicy\machine\Registry.pol'
$path2 = 'C:\windows\system32\GroupPolicy\machine\comment.cmtx'

Remove-Item -Path $path -Force
Remove-Item -Path $path2 -Force

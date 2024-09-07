get-childitem -Path "abc\def" -Recurse | 
Where-Object {$_.CreationTime -gt (Get-date).Date} |
move-item -destination "foo\bar"

--------------------------------------------------------------------------------
#move last 1000 items 
Get-ChildItem -Path "abc\def" | Select-Object -Last 1000 |
move-item -destination "foo\bar" -Force

--------------------------------------------------------------------------------
# Delete files older than the $limit.
$limit = (Get-Date).AddDays(-1)
$path = "abc\def"
Get-ChildItem -Path $path -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $limit } | Remove-Item -Force

--------------------------------------------------------------------------------
# Delete files older than the AddDays(x)
Get-ChildItem "abc\def" -Recurse -Force | Where CreationTime -lt (Get-Date).AddDays(-1) | Remove-Item -Force

Get-ChildItem "abc\def" -Recurse -Force | Where CreationTime -lt (Get-Date).AddHours(-10) | Remove-Item -Force

# ✔✔✔✔✔✔✔✔✔✔✔
Get-ChildItem –Path "abc\def" -Recurse | Where-Object {($_.LastWriteTime -lt (Get-Date).AddHours(-10))} | Remove-Item -Force

--------------------------------------------------------------------------------
# Get a process count 
(Get-Process "myprocess").Count

--------------------------------------------------------------------------------
#add prefix to files
Get-ChildItem -Exclude "abc+*" | rename-item -NewName { "abc+" + $_.Name }


--------------------------------------------------------------------------------
#change a service's path executable 
sc.exe config myservice binPath= abc\def\myservice.exe


--------------------------------------------------------------------------------
#Remove all files where filename contains string
$string = "MyString"
get-childitem | where-object {$_.Name -like "*$string*"} | foreach ($_) {remove-item $_.fullname}


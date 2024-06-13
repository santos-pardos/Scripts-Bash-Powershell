Clear-Host
$Path = "C:\Program Files\"
Get-Childitem $Path -recurse -force | Foreach {
If ($_.extension -eq ".txt") {
Write-Host $_.fullname 
     }
}

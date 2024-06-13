
<# Ejemplo 02
param (
 [string]$nombre,
 [string]$saludo
)

$param1=$args[0]
$param2=$args[1]
write-host $param1 $param2
#>
 
param ($param1, $param2)
write-host $param1 $param2

if (-not $nombre -or -not $saludo) {
 Write-Host "Para un uso correcto se debe ejecutar de la 
siguiente manera:"
 Write-Host "`n"
 Write-Host ": .\saludo2.ps1 -nombre ""nombre"" -saludo 
""saludo"""
 Write-Host "`n"
 exit
}

Write-Host "$saludo $nombre"
Write-Host "`n"

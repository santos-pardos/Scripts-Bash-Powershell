
<# Ejemplo 02 #>
param (
 [string]$nombre,
 [string]$saludo
)

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

<# Ejemplo 03 #>

Write-Host "`n"
Write-Host "Introduzca numeros enteros"
Write-Host "`n"

$num1 = Read-Host "Ingrese el primer numero entero"

$num2 = Read-Host "Ingrese el segundo numero entero"
Write-Host "`n"
 

$num1 = [int]$num1
$num2 = [int]$num2

if ($num1 -gt $num2) {
 Write-Host "$num1 es mayor que $num2"
}
elseif ($num1 -lt $num2) {
 Write-Host "$num1 es menor que $num2"
}
else {
 Write-Host "$num1 es igual a $num2"
}



# ABRIR PowerShell (actualizar)
```
Update-Help
```

# CMDLET (verbo nombre)
```
(get set remove new)
(localuser localgrupo netadaptaer partition)
Get-LocalUser
Get-Date
Clear-Host
Get-Location
Get-Children
Get-Localgroup
Get-Netadapter
Get-Command
Get-Command -Noun Localgroup
Get-command *localgroup*
```

# MODULO (conjunto comandos)
```
Get-Module
Get-Module -module Microsoft......
Get-Module -listAvailable
Import-module bitlocker -verbose
Get-Module
Remove-module bitlocker
Get-Module
```

# HELP
```
Update-Help
Get-Help new-localuser
Get-Help new-localuser -examples
New-localuser heidi -Description "Heidi de los alpes" -noPassword
(lo mismo como admin y sin admin)
Get-LocalUser
Remove-LocalUser heidi
```

# ATAJOS
```
Get-LocalGroup (tabulacion)
Cursor arriba abajo
Get-History
Get-Date
Get-History
Invoke-History 10
h
r 10
crtl+f new crtl-cç
Clear-History
h
```

# ALIAS
```
Get-Alias
Get-Alias -Definition Get-ChildItem
clear
ls
echo "hola" >prueba.txt
cat prueba.txt
```

# GESTION ARCHIVOS y CARPETAS
```
Get-Location (pwd)
Get-ChildItem (ls)
Set-Location c:\ (cd)
Set-Location c:\Users\santos
Get-ChildItem (d-r---)
Get-ChildItem c:\ -Attributes hidden
New-Item prueba1 -ItemType Directory
New-Item .\prueba1\texto1.txt
Remove-Item .\prueba1\ -recurse
Get-ChildItem prueba1
Clear
New-Item foto1.jpg foto2.jpg
New-Item fotos -ItemType Directory
Move-Item *.jpg fotos
Get-ChildItem fotos
Rename-Item .\fotos\ recuerdos
Copy-Item .\recuerdos\ copiaRecuerdos -recurse
Get-ChildItem .\copiaRecuerdos\
Get-Date >prueba.txt
Get-Content .\prueba.txt
(Alias: pwd , ls , cd , md ,ni, ren , cp , cat , rm)
```

# TUBERIAS 
```
Get-Command
Get-Command|measure-object
Get-ChildItem -Recurse | Where-Object {$_.Length -gt 10Mb}
Get-ChildItem -Recurse | Where-Object {$_.Length -gt 10Mb}|Sort-Object -Descending -Property Length
Get-NetTCPConnection
Get-NetTCPConnection|ft -a
Get-NetTCPConnection|Where-Object {$_.State -eq 'Established'}
```

# REDIRECCIONAMIENTO
```
Get-ChildItem >informe.txt
Get-Content .\informe.txt
Get-Date >>.\informe.txt
Get-Content .\informe.txt
h
r 10
Get-NetTCPConnection|Where-Object {$_.State -eq 'Established'} >Puertos_Establecidos.txt
cat .\Puertos-establecidos.txt
```

# INTRODUCCION SCRIPTS
```
Niveles seguridad (Restricted, AllSigned, RemoteSigned, Unrestricted)
Get-ExecutionPolicy
Set-ExecutionPolicy RemoteSigned
Get-ExecutionPolicy
Notepad
Clear-Host
Write-Host "Bienvenidos a la PowerShell"
Get-Date
(Ejemplo1.ps1)
.\Ejemplo.ps1
(Lanzar WindowsPowerShell ISE)
Clear-Host
Write-Host "Bienvenidos a la PowerShell"
Get-Date
(Ejemplo2.ps1)
```

# FUNDAMENTOS SCRIPTS
```
(ISE)
COMENTARIOS
#Ejemplo de comentarios
<# Es un ejemplo
de bloque 
de comentarios
#>
Clear-Host
Get-Date  # Muestra de comentarios
```

VARIABLES
```
(ISE)
#Ejemplo de variables
$edad=30
$nombre="Laia"
$edad
$nombre
(guardar variables.ps1 y ejecuta)
$nombre.GetType()
```

CONSTANTES
```
#Ejemplo de constantes
New-Variable -Name C -Value 300000 -option -Constant
$C=0
$C
(guardar constantes.ps1 y ejecutar)
```

TIPOS DE DATOS
```
(int, Double, Char, String, Boolean)
LEER Y ESCRIBIR VARIABLES
(ISE)
#Ejemplo de tipo de datos
Clear-Host
$nombre=Read-Host "Como te llamas?"
$edad=Read-Host "Cuál es tu edad?"
Write-Host "Tu nombre es $nombre y tu edad es $edad"
(salvar y ejecutar)
(Desde CLI)
$nombre.GetType()
$edad.GetType()
(cambiar la linea)
[int]$edad=Read-Host "Cuál es tu edad?"
(Desde CLI)
$edad.GetType()
```

OPERADORES CADENAS
```
#Ejemplo de concatenación
Clear-Host
$nombre="Laia"
$apellido="Gomez"
$nombreCompleto = $nombre + " " + $apellido
Write-Host "Tu nombre completo es: " $nombreCompleto
(salvar y ejecutar)
```

OPERADORES NUMERICOS ( + - * / %)
```
#Operaciones aritméticas
Clear-Host
$x=10
$y=5
$suma= $x+$y
$resto= $x%$y
Write-Host "La suma es $suma"
Write-Host "El resto es $resto"
(salvar y ejecutar)
```

OPERACIONES LOGICOS (-eq -ne -lt -le -gt -ge)
```
#Operadores lógicos
Clear-Host
$x=10
$y=5
$iguales=$x -eq $y
Write-host "Los numeros $x y $y son iguales ? $iguales"
(salvar y ejecutar)
```

#ESTRUCTURAS DE CONTROL

CONDICIONALES
```
crtl+j (if)
crtl+j (if else)
crtl+j (switch)
#Conexión con el servidor
Clear-Host
Write-Host "Conectividad"
$ip=Read-Host "Introduce la IP del servidor"
If(Test-Connection $ip -count 1 -Quiet) {
Write-Host "$ip Conexión establecida"}
else {
Write-Host "$ip Error de conexión"}
(salvar y ejecutar)
```

REPETITIVAS
```
crtl+j (while) (do while) (for) (foreach)
notepad servidores.txt
192.168.1.1
192.168.2.1
8.8.8.8
Get-Content .\servidores.txt
```
```
#Conexión con el servidor
Clear-Host
Write-Host "Conectividad"
$datos=Get-Content c:\users\santos\servidores.txt
Foreach ($i in $datos){
$respuestas= Test-Connection $ip -count 1 -Quiet
if ($respuesta -eq "true"){
Write-Host "$i Conexion establecidad"
} else {Write-Host "$i Error de conexión"}
}
(salvar y ejecutar)
```

FUNCIONES
```
(ISE)
#Conexión con el servidor
#Definición de funciones
Function Conectividad ($datos){
Foreach ($i in $datos){
$respuestas= Test-Connection $i -count 1 -Quiet
if ($respuesta -eq "true"){
Write-Host "$i Conexion establecidad"
} else {Write-Host "$i Error de conexión"}
}
}
#Inicio del programa
Clear-Host
Write-Host "Conectividad"
$datos=Get-Content c:\Users\Administrator\servidores.txt
Conectividad $datos
```

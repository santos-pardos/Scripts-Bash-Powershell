# PowerShell para Administradores

USUARIOS
```
#Creación de un usuario
Clear
$usuario=Read-Host "Introduce nombre de usuario"
$contra=Read-Host "Introduce contraseña" -AsSecureString
New-LocalUser $usuario -Password $contra
Add-LocalGroupMember usuarios -Member $usuario
```
```
#Eliminación de usuarios de forma masiva
$usuarios= Import-Csv -Path C:\material\usuarios.csv
foreach ($i in $usuarios){
Remove-LocalUser $i.nombre
}
```
```
#Creación de usuarios de forma masiva
$usuarios= Import-Csv -Path C:\material\usuarios.csv
foreach ($i in $usuarios){

$clave= ConvertTo-SecureString $i.contra -AsPlainText -Force
New-LocalUser $i.nombre -Password $clave -AccountNeverExpires -PasswordNeverExpires
Add-LocalGroupMember -Group usuarios -Member $i.nombre
}
```

CARPETAS
```
New-smbshare -Name pruebas -Path c:\pruebas -FullAccess Administrator
```

DISCOS
```
Get-Volume
Mount-DiskImage -ImagePath "C:\VM\demo.vhdx"
```

RED
```
#Conexión con los servidores
# Cabecera
Clear-Host
Write-Host " ----- Conectividad -----"
#Importamos los datos
$datos= Import-Csv -Path C:\material\servidores.csv
#Recorremos los datos
    foreach ($i in $datos) {
    $respuesta=Test-Connection $i.ip -Count 1 -quiet
    if ($respuesta -eq "true") {
        Write-Host "$i Conexión establecida"
        }else {Write-Host "$i Error de conexión"}
    }
```

PROCESOS
```
Get-Process
Stop-Process
```
TAREAS
```
Get-ScheduledTask
```
IMPRESORAS
```
Get-Printer
```
EVENTOS
```
Get-WinEvent
```
WMI/CIM
```
¿Qué es CIM?**:
CIM (Common Information Model). Es un estándar abierto que establece  (define) 
como intercambiar información entre sistemas, redes, aplicaciones y servicios.
¿Qué es WMI?**:
WMI (Windows Management Instrumentation). Es la implementación de Microsoft del CIM.
Podemos decir que WMI/CIM funciona como una base de datos ofreciendo una gran variedad de información.
WMI/CIM está compuesta por clases, que representa los distintos elementos.
Utilizaremos PowerShell para comunicarnos con WMI/CIM.
Búsqueda de información
Utilizaremos los cmdlets: Get-WmiObject y Get-CimInstance
**Clases WMI/CIM**
BIOS: win32_Bios
CPU: win32_processor 
DISCOS: Win32_DiskDrive
PLACA BASE: Win32_Baseboard
ADAPTADOR DE RED: Win32_NetworkAdapter
MEMORIA: Win32_PhysicalMemory
SISTEMA OPERATIVO: Win32_OperatingSystem
RECURSOS COMPARTIDOS: Win32_Share
EQUIPO(Windows): win32_computersystem 
EQUIPO (Producto): win32_ComputerSystemProduct 
```

# Links
```
https://techexpert.tips/es/powershell-es/
```

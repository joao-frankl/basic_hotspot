# Basic scripts to creat a hotspot net from your laptop/desktop for other devices

### Script Powershell
```powershell
# Defina o nome e a senha do hotspot
$SSID = "jaonet"
$Password = "123456789"

# Verifique se o adaptador suporta a criação de um hotspot
$hostedNetworkSupported = netsh wlan show drivers | Select-String "Hosted network supported" | Select-String "Yes"
if (-not $hostedNetworkSupported) {
    Write-Host "Seu adaptador de rede não suporta a criação de um hotspot."
    exit
}

# Configure o hotspot
try {
    netsh wlan set hostednetwork mode=allow ssid=$SSID key=$Password
    Write-Host "Hotspot configurado com sucesso."
} catch {
    Write-Host "Falha ao configurar o hotspot."
    exit
}

# Inicie o hotspot
try {
    netsh wlan start hostednetwork
    Write-Host "Hotspot iniciado com sucesso."
} catch {
    Write-Host "Falha ao iniciar o hotspot."
    exit
}

Write-Host "Hotspot criado com sucesso!"
```
### Script CMD
```bat
@echo off
setlocal

REM Configurar nome e senha do hotspot
set SSID=jaonet
set PASSWORD=123456789

REM Verificar se o adaptador suporta a criação de hotspot
netsh wlan show drivers | findstr /C:"Hosted network supported" | findstr /C:"Yes"
if %errorlevel% neq 0 (
    echo Seu adaptador de rede não suporta a criação de um hotspot.
    pause
    exit /b
)

REM Configurar o hotspot
netsh wlan set hostednetwork mode=allow ssid=%SSID% key=%PASSWORD%
if %errorlevel% neq 0 (
    echo Falha ao configurar o hotspot.
    pause
    exit /b
)

REM Iniciar o hotspot
netsh wlan start hostednetwork
if %errorlevel% neq 0 (
    echo Falha ao iniciar o hotspot.
    pause
    exit /b
)

echo Hotspot criado com sucesso!
pause
```

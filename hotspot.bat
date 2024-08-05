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


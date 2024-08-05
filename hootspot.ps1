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


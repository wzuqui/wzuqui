#!/bin/bash
echo "Monitoramento de VPN - Entrypoint"

target_ip="10.0.0.2"  # IP que você deseja verificar
script_to_execute="./ativar_vpn.sh"  # Caminho para o script a ser executado

while true; do
  if ping -c 1 -W 1 "$target_ip" >/dev/null; then
    echo "[$(date -u '+%Y-%m-%d %H:%M:%S UTC')] Acesso ao IP $target_ip foi bem-sucedido."
  else
    echo "[$(date -u '+%Y-%m-%d %H:%M:%S UTC')] Acesso ao IP $target_ip falhou. Executando o script."
    sh "$script_to_execute"
  fi
  sleep 60  # Aguarda 1 minuto antes da próxima verificação
done

# bash <(curl -s https://raw.githubusercontent.com/wzuqui/wzuqui/main/monitorar_vpn.sh)

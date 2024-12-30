#!/bin/bash

set -e  # Interrompe o script em caso de erros

# Função para instalar Node.js em sistemas baseados no Debian
debianInstaller() {
  echo "Detectado sistema baseado no Debian."
  
  echo "Atualizando lista de pacotes..."
  sudo apt update

  curl -fsSL https://raw.githubusercontent.com/daniellichotti/linuxConfigs/refs/heads/main/scripts/debianConfigInstaller.sh | bash

  echo "Configuração concluída! Reinicie o terminal para aplicar as mudanças."
}

# Função para instalar Node.js em sistemas baseados no Arch
archInstaller() {
  echo "Detectado sistema baseado no Arch."
  
  echo "Atualizando lista de pacotes..."
  sudo pacman -Syu --noconfirm
  
  curl -fsSL https://raw.githubusercontent.com/daniellichotti/linuxConfigs/refs/heads/main/scripts/archConfigInstaller.sh | bash
}

# Detectar a base do sistema operacional
if grep -q "debian" /etc/os-release || grep -q "Ubuntu" /etc/os-release; then
  debianInstaller
elif grep -q "arch" /etc/os-release || grep -q "Manjaro" /etc/os-release; then
  archInstaller
else
  echo "Sistema operacional não suportado neste script."
  exit 1
fi

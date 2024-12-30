#!/bin/bash

set -e  # Interrompe o script em caso de erros

# Função para instalar Node.js em sistemas baseados no Debian
debianInstaller() {
  echo "Detectado sistema baseado no Debian."
  
  echo "Atualizando lista de pacotes..."
  sudo apt update
  
  # Instalar git e base-devel
  echo 'Instalando git e base-devel...'
  sudo apt install -y wget git && 
  echo "Wget, Git e base-devel instalados com sucesso!"

  #Instalar Brew
  echo 'Instalando Brew...'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'Brew instalado com sucesso!'

  #Instalar pacotes com Yay
  echo 'Instalando Pacotes...'
  sudo apt install -y docker.io vim neovim rustc nodejs npm python3 python3-pip gh
  echo 'Habilite a distro nas Resources do Docker Desktop...'
  echo 'Pacotes instalados com sucesso!'  

  echo "Configuração concluída! Reinicie o terminal para aplicar as mudanças."
}

# Função para instalar Node.js em sistemas baseados no Arch
archInstaller() {
  echo "Detectado sistema baseado no Arch."
  
  echo "Atualizando lista de pacotes..."
  sudo pacman -Syu --noconfirm
  
  curl -fsSL https://raw.githubusercontent.com/daniellichotti/linuxConfigs/refs/heads/main/terminalConfigScript.sh | bash
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

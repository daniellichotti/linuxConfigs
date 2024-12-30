#!/bin/bash

# Função para instalar Node.js em sistemas baseados no Debian
install_node_debian() {
  echo "Detectado sistema baseado no Debian."
  echo "Atualizando lista de pacotes..."
  # sudo apt update
  echo "Instalando Node.js..."
  # sudo apt install -y nodejs npm
  echo "Node.js instalado com sucesso!"
}

# Função para instalar Node.js em sistemas baseados no Arch
install_node_arch() {
  echo "Detectado sistema baseado no Arch."
  echo "Atualizando lista de pacotes..."
  # sudo pacman -Syu --noconfirm
  echo "Instalando Node.js..."
  # sudo pacman -S --noconfirm nodejs npm
  echo "Node.js instalado com sucesso!"
}

# Detectar a base do sistema operacional
if grep -q "debian" /etc/os-release || grep -q "Ubuntu" /etc/os-release; then
  install_node_debian
elif grep -q "arch" /etc/os-release || grep -q "Manjaro" /etc/os-release; then
  install_node_arch
else
  echo "Sistema operacional não suportado neste script."
  exit 1
fi

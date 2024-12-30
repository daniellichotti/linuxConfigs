#!/bin/bash

set -e  # Interrompe o script em caso de erros

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

#!/bin/bash

set -e  # Interrompe o script em caso de erros

# Instalar git e base-devel
echo 'Instalando Pacotes...'
sudo apt install -y wget git docker.io vim neovim rustc nodejs npm python3 python3-pip gh zsh tmux zoxide figlet lolcat bat fzf man-db fd-find ffmpeg p7zip jq poppler-utils ripgrep imagemagick fortune-mod neofetch cmatrix htop btop khal ddgr thefuck && 
echo "Pacotes instalados com sucesso! Habilite a distro nas resources do Docker!"

#Instalar Brew
echo 'Instalando Brew...'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'Brew instalado com sucesso!'

#Astrovim
echo 'Instalando Astrovim...'
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim && rm -rf ~/.config/nvim/.git

# Instalar OhMyZsh
echo 'Instalando OhMyZsh...'
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && echo "OhMyZsh instalado com sucesso!"

# Alterar shell padrão para Zsh
sudo chsh -s /bin/zsh $(whoami) && echo "Shell padrão alterado para Zsh."

# Instalar Starship (com 'yes' para confirmar automaticamente)
echo 'Instalando Starship...'
mkdir -p ~/.config
curl -sS https://starship.rs/install.sh | sh -s -- -y && echo "Starship instalado com sucesso!"

# Instalar Zsh autosuggestions
echo 'Instalando Zsh autosuggestions...'
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && echo "zsh-autosuggestions instalado com sucesso!"

# Instalar Zsh Syntax Highlighting
echo 'Instalando Zsh Syntax Highlighting...'
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && echo "zsh-syntax-highlighting instalado com sucesso!"

# Instalar Atuin
echo 'Instalando Atuin...'
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh && echo "Atuin instalado com sucesso!"

# Baixando arquivos de configuração
echo 'Baixando arquivos de configuração...'
curl -o ~/.zshrc https://raw.githubusercontent.com/daniellichotti/linuxConfigs/main/configs/zshrc
curl -o ~/.config/starship.toml https://raw.githubusercontent.com/daniellichotti/linuxConfigs/main/configs/starship
curl -o ~/.tmux.conf https://raw.githubusercontent.com/daniellichotti/linuxConfigs/main/configs/tmux.conf

echo "Configuração concluída! Reinicie o terminal para aplicar as mudanças."
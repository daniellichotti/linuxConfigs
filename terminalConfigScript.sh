#!/bin/bash

set -e  # Interrompe o script em caso de erros

# Instalar git e base-devel
echo 'Instalando git e base-devel...'
sudo pacman -S --needed --noconfirm wget git base-devel && echo "Wget, Git e base-devel instalados com sucesso!"

# Instalar Yay
echo 'Instalando Yay...'
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay && echo "Yay instalado com sucesso!"

echo 'Instalando Docker...'
#Instalar pacotes com Yay
yay -S --noconfirm docker
echo 'Habilite a distro nas Resources do Docker Desktop...'

#Instalar ferramentas dev
yay -S --noconfirm vim neovim rust nodejs npm python python-pip github-cli

#Astrovim
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim && rm -rf ~/.config/nvim/.git

# Instalar pacotes úteis
echo 'Instalando pacotes úteis...'
sudo pacman -S --noconfirm zsh tmux zoxide exa figlet lolcat bat fzf man-pages man-db fd yazi ffmpegthumbnailer ffmpeg p7zip jq poppler ripgrep imagemagick fortune-mod neofetch
echo "Pacotes instalados com sucesso!"

# Instalar OhMyZsh
echo 'Instalando OhMyZsh...'
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && echo "OhMyZsh instalado com sucesso!"

# Mudar o shell para zsh
echo 'Alterando o shell para zsh...'
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
curl -o ~/.zshrc https://raw.githubusercontent.com/daniellichotti/linuxConfigs/main/zshrc
curl -o ~/.config/starship.toml https://raw.githubusercontent.com/daniellichotti/linuxConfigs/main/starship
curl -o ~/.tmux.conf https://raw.githubusercontent.com/daniellichotti/linuxConfigs/main/tmux.conf

echo "Configuração concluída! Reinicie o terminal para aplicar as mudanças."

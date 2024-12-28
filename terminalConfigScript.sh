#!/bin/bash

set -e  # Interrompe o script em caso de erros

echo 'Instalando git e base-devel...'
sudo pacman -S --needed --noconfirm git base-devel && echo "Git e base-devel instalados com sucesso!"

echo 'Instalando Yay...'
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay && echo "Yay instalado com sucesso!"

echo 'Instalando pacotes úteis...'
sudo pacman -S --noconfirm zsh tmux zoxide exa figlet lolcat nnn bat fzf man-pages man-db fd yazi ffmpegthumbnailer ffmpeg p7zip jq poppler ripgrep imagemagick && echo "Pacotes instalados com sucesso!"

echo 'Instalando OhMyZsh...'
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && echo "OhMyZsh instalado com sucesso!"
sudo chsh -s /bin/zsh $(whoami) && echo "Shell padrão alterado para Zsh."

echo 'Instalando Starship...'
mkdir -p ~/.config
curl -sS https://starship.rs/install.sh | sh && echo "Starship instalado com sucesso!"

echo 'Instalando Zsh autosuggestions...'
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && echo "zsh-autosuggestions instalado com sucesso!"

echo 'Instalando Zsh Syntax Highlighting...'
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && echo "zsh-syntax-highlighting instalado com sucesso!"

echo 'Instalando Atuin...'
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh && echo "Atuin instalado com sucesso!"

echo 'Baixando arquivos de configuração...'
curl -o ~/.zshrc https://raw.githubusercontent.com/daniellichotti/linuxConfigs/main/zshrc
curl -o ~/.config/starship.toml https://raw.githubusercontent.com/daniellichotti/linuxConfigs/main/starship
curl -o ~/.tmux.conf https://raw.githubusercontent.com/daniellichotti/linuxConfigs/main/tmux.conf

# Perguntar se o usuário deseja instalar o Node.js
while true; do
    echo 'Você deseja instalar o Node.js?'
    echo '1 - Sim'
    echo '2 - Não'
    read -p "Escolha uma opção [1/2]: " node_choice

    if [ "$node_choice" == "1" ]; then
        echo 'Instalando Node.js e npm...'
        sudo pacman -S --noconfirm nodejs npm && echo "Node.js e npm instalados com sucesso!"
        break
    elif [ "$node_choice" == "2" ]; then
        echo 'Node.js não será instalado.'
        break
    else
        echo 'Opção inválida. Por favor, escolha 1 ou 2.'
    fi
done

echo "Configuração concluída! Reinicie o terminal para aplicar as mudanças."

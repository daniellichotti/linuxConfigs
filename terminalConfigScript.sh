#!/bin/bash

echo 'Instalando git e base-devel...'
sudo pacman -S --needed git base-devel && echo "Git e base-devel instalados com sucesso!" || { echo "Erro ao instalar Git e base-devel."; exit 1; }

echo 'Instalando zsh, tmux, zoxide, exa, figlet, lolcat, nnn, bat, fzf, man-pages, man-db, fd, yazi e outros pacotes...'
sudo pacman -S --noconfirm zsh tmux zoxide exa figlet lolcat nnn bat fzf man-pages man-db fd yazi ffmpegthumbnailer ffmpeg p7zip jq poppler ripgrep imagemagick && echo "Pacotes instalados com sucesso!" || { echo "Erro ao instalar os pacotes."; exit 1; }

# Remover o export do SHELL com &&
export SHELL=/bin/bash

echo 'Instalando Starship...'
yes | curl -sS https://starship.rs/install.sh | sh && echo "Starship instalado com sucesso!" || { echo "Erro ao instalar Starship."; exit 1; }

echo 'Instalando Zsh autosugestions...'
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && echo "zsh-autosuggestions instalado com sucesso!" || { echo "Erro ao instalar zsh-autosuggestions."; exit 1; }

echo 'Instalando Zsh Syntax Highlighting...'
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && echo "zsh-syntax-highlighting instalado com sucesso!" || { echo "Erro ao instalar zsh-syntax-highlighting."; exit 1; }

echo 'Instalando Atuin...'
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh && echo "Atuin instalado com sucesso!" || { echo "Erro ao instalar Atuin."; exit 1; }

echo 'Lembre-se de sincronizar!'
echo 'Copiando meus arquivos .zshrc, starship.toml e tmux.conf...'

# Usando && somente quando necessário para garantir que os downloads sejam feitos em sequência
curl -o ~/.zshrc https://raw.githubusercontent.com/daniellichotti/linuxConfigs/main/zshrc && \
curl -o ~/.config/starship.toml https://raw.githubusercontent.com/daniellichotti/linuxConfigs/main/starship && \
curl -o ~/.tmux.conf https://raw.githubusercontent.com/daniellichotti/linuxConfigs/main/tmux.conf

echo 'Instalando OhMyZsh...'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --keep-zshrc && echo "OhMyZsh instalado com sucesso!" || { echo "Erro ao instalar OhMyZsh."; exit 1; }

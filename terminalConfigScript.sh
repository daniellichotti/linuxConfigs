#!/bin/bash

echo 'Instaling git e base-devel...'
sudo pacman -S --needed git base-devel && echo "Git instalado com sucesso!" || { echo "Erro ao instalar Git."; exit 1; } &&

echo 'Instaling zsh, tmux, zoxide, exa, figlet, lolcat, nnn, bat, fzf, man-pages, man-db, fd and yazi...'
sudo pacman -S --noconfirm zsh tmux zoxide exa figlet lolcat nnn bat fzf man-pages man-db fd yazi ffmpegthumbnailer ffmpeg p7zip jq poppler ripgrep imagemagick && echo "Pacotes instalados com sucesso!" || { echo "Erro ao instalar os pacotes."; exit 1; } &&

echo 'Instaling OhMyZsh...'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended && echo "OhMyZsh instalado com sucesso!" || { echo "Erro ao instalar OhMyZsh."; exit 1; } &&

export SHELL=/bin/bash &&

echo 'Instaling Starship...'
curl -sS https://starship.rs/install.sh | sh && echo Starship instalado com sucesso!" || { echo "Erro ao instalar Starship."; exit 1; } &&

echo 'Instaling Zsh autosugestions...'
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && echo "zsh-autosuggestions instalado com sucesso!" || { echo "Erro ao instalar zsh-autosuggestions."; exit 1; } &&

echo 'Instaling Zsh Syntax Highlighting'
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && echo "zsh-syntax-highlighting instalado com sucesso!" || { echo "Erro ao instalar zsh-syntax-highlighting."; exit 1; } &&

echo 'Instaling Atuin...'
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh && echo "Atuin instalado com sucesso!" || { echo "Erro ao instalar Atuin."; exit 1; } &&
echo 'Remember to sync!'

echo 'Copying my .zshrc, starship.toml and tmux configs...' &&
curl -o ~/.zshrc https://raw.githubusercontent.com/daniellichotti/linuxConfigs/main/zshrc &&
curl -o ~/.config/starship.toml https://raw.githubusercontent.com/daniellichotti/linuxConfigs/main/starship &&
curl -o ~/.tmux.conf https://raw.githubusercontent.com/daniellichotti/linuxConfigs/main/tmux.conf

exec zsh
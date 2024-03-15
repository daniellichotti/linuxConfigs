#! /usr/bin/bash

sudo pacman -S zsh tmux rclone zerotier-one &&
sudo pacman -S --needed git base-devel &&

pamac install zoxide exa figlet lolcat nodejs npm &&

#instalar o  vscode
git clone https://aur.archlinux.org/visual-studio-code-bin.git &&
cd visual-studio-code-bin &&
makepkg -si &&

#instalar o ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&

#instalar o Starship
curl -sS https://starship.rs/install.sh | sh &&

#puxar o .zshrc
curl -o ~/.zshrc https://raw.githubusercontent.com/daniellichotti/linuxConfigs/main/zshrc &&


#colocar starshop.toml em ~/.config/
curl -o ~/.config/starship.toml https://raw.githubusercontent.com/daniellichotti/linuxConfigs/main/starship%20pc &&


#baixar o arquivo de conf do tmux
curl -o ~/.tmux.conf https://raw.githubusercontent.com/daniellichotti/linuxConfigs/main/tmux.conf &&

# zsh autosugestions e highlight
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &&





echo '

Para configurar o zerotier-one:
sudo zerotier-one
sudo zerotier-cli join <NETWORK_ID>

Para configurar o rclone e sincronizar uma pasta do drive para uma local:
rclone config
rclone sync google-drive:/<Pasta Drive> ~/<Pasta Local>'  &&

echo 'Fim!'

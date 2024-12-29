#! /usr/bin/bash

sudo pacman -S rclone zerotier-one &&

#!/bin/bash

if grep -qi microsoft /proc/version; then
  echo "Este script está rodando no WSL."
else
  echo "Este script NÃO está rodando no WSL."
  #instalar o  vscode
  git clone https://aur.archlinux.org/visual-studio-code-bin.git &&
  cd visual-studio-code-bin &&
  makepkg -si &&

fi

echo '
Para configurar o zerotier-one:
sudo zerotier-one
sudo zerotier-cli join <NETWORK_ID>

Para configurar o rclone e sincronizar uma pasta do drive para uma local:
rclone config
rclone sync google-drive:/<Pasta Drive> ~/<Pasta Local>'  &&

echo 'Fim!'

# O grim é uma ferramenta leve e popular para capturar screenshots em ambientes Wayland, incluindo o Hyprland.
# Para tirar um print de toda a tela: grim ~/screenshot.png
# Para tirar um print de uma área selecionada: Combine com **slurp** (uma ferramenta para selecionar áreas): sudo pacman -S slurp grim -g "$(slurp)" ~/screenshot.png
# Se você quiser editar as capturas antes de salvar, o **swappy** é uma ótima opção.
# Capture uma área da tela e edite com o Swappy: grim -g "$(slurp)" - | swappy -f -
# Para gravar a tela inteira: wf-recorder -f ~/screen-recording.mp4
# Para gravar uma área específica: wf-recorder -g "$(slurp)" -f ~/screen-recording.mp4
sudo pacman -S --no-confirm grim swappy wf-recorder && hyprctl reload

# instalar o hyprpicker para color picker
yay -S --no-confirm hyprpicker

# Instalando o mpvpaper para livewallpaper
# exemplo de comando: mpvpaper -o "--loop no-audio --keepaspect=yes --panscan=1.0 --video-unscaled=yes" '*' "caminho/do/video.mp4"
git clone --single-branch https://github.com/GhostNaN/mpvpaper && cd mpvpaper && meson setup build --prefix=/usr/local && ninja -C build && sudo ninja -C build install && cd .. && rm -rf mpvpaper







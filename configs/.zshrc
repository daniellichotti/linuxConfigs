# Paths

# Pasta padrao Imagens
export XDG_PICTURES_DIR="$HOME/Pictures"

#Exportar pnpm
export PATH="$HOME/.local/share/pnpm:$PATH"

# Scripts paths
export PATH="$HOME/.config/hypr/Scripts:$PATH"

# Homebrew paths
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/Cellar/pipes-sh/1.3.0/bin:$PATH"

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Cargo (Rust)
export PATH="$HOME/.cargo/bin:$PATH"

# NVM (Node Version Manager)
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Android Studio paths
export ANDROID_HOME="/home/dnl/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools"

# Console Ninja
export PATH="$HOME/.console-ninja/.bin:$PATH"

# Java (OpenJDK 11)
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"
export PATH="$JAVA_HOME/bin:$PATH"

# Turso
export PATH="$HOME/.turso:$PATH"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# PNPM
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;; 
  *) export PATH="$PNPM_HOME:$PATH" ;; 
esac

# Atuin
. "$HOME/.atuin/bin/env"

# FZF configuration
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"
export FZF_TMUX_OPTS=" -p90%,70% "


#artups
#figlet -f smshadow.flf WASSUP | lolcat
curl -sL git.io/unix
#ascii-image-converter Downloads/a.png -c -b -d 60,30 --dither
#curl -s wttr.in | head -n 5
#fortune
#(cowsay "$(fortune)")

# Formatting variables
COLOR_P='\033[1;36m'
COLOR_S='\033[0;36m'
RESET='\033[0m'

# Print time-based personalized message, using figlet & lolcat if availible
function welcome_greeting () {
  h=$(date +%H)
  h=$((10#$h))
  if [ $h -lt 4 ] || [ $h -gt 22 ];
    then greeting="Good Night"
  elif [ $h -lt 12 ];
    then greeting="Good morning"
  elif [ $h -lt 18 ];
    then greeting="Good afternoon"
  elif [ $h -lt 22 ];
    then greeting="Good evening"
  else
    greeting="Hello"
  fi
  WELCOME_MSG="$greeting $USER!"
  if hash lolcat 2>/dev/null && hash figlet 2>/dev/null; then
    echo "${WELCOME_MSG}" | figlet | lolcat
  else
    echo -e "$COLOR_P${WELCOME_MSG}${RESET}\n"
  fi
}


# Print system information with neofetch, if it's installed
function welcome_sysinfo () {
  if hash neofetch 2>/dev/null; then
    neofetch --shell_version off \
      --disable kernel distro shell resolution de wm wm_theme theme icons term packages \
      --backend off \
      --colors 4 8 4 4 8 6 \
      --color_blocks off \
      --memory_display info
  fi
}

# Print todays info: Date, IP, weather, etc
function welcome_today () {
  timeout=0.5
  echo -e "\033[1;34mToday\n------"

  # Print last login in the format: "Last Login: Day Month Date HH:MM on tty"
  last_login=$(last | grep "^$USER " | head -1 | awk '{print "Last Login: "$4" "$5" "$6" "$7" on "$2}')
  echo -e "${COLOR_S}${last_login}"

  # Print date time
  echo -e "$COLOR_S$(date '+%A, %B %d, %Y at %H:%M')"

  # Print local weather
  curl -s -m $timeout "https://wttr.in?format=%cWeather:+%C+%t,+%p+%w"
  echo -e "${RESET}"

  # Print IP address
  if hash ip 2>/dev/null; then
    ip_address=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')
    ip_interface=$(ip route get 8.8.8.8 | awk -F"dev " 'NR==1{split($2,a," ");print a[1]}')
    echo -e "${COLOR_S}🌐 IP: $(curl -s -m $timeout 'https://ipinfo.io/ip') (${ip_address} on ${ip_interface})"
    echo -e "${RESET}\n"
  fi
}

# Putting it all together
function welcome() {
  #welcome_greeting
  #welcome_sysinfo
  #welcome_today
}

welcome $@


# Themes, to know which specific one was loaded, run: echo $RANDOM_THEME
# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes for more
ZSH_THEME="robbyrussell"
#ZSH_THEME="random"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Plugins
plugins=( 
    # other plugins...
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
# Personal Aliases
source = $HOME/.config/hypr/.aliases

#Others
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"
eval "$(fzf --zsh)"



eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

eval $(thefuck --alias)

PATH=~/.console-ninja/.bin:$PATH

# pnpm
export PNPM_HOME="/home/dnl/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/usr/bin"
export STARSHIP_CONFIG=~/.config/starship.toml
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


figlet -f smshadow.flf WASSUP | lolcat
curl -s wttr.in | head -n 5
#fortune
#(cowsay "$(fortune)")

# Themes, to know which specific one was loaded, run: echo $RANDOM_THEME
# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes for more
ZSH_THEME="robbyrussell"
#ZSH_THEME="random"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Plugins
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

plugins=( 
    # other plugins...
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Personal Aliases

alias aliashelp="curl -s https://gist.githubusercontent.com/daniellichotti/3afd55844135af7c2daf1ab0d336f86e/raw/7f4919033c9bb7b33682942466ded83e819363fb/aliases.txt | zsh" # Mostra os aliases

# general
alias ..="cd .." # Volta uma pasta
alias ...="cd ../.." # Volta duas pastas
alias rm="rm -i"  # Pergunta antes de excluir
alias rmdir="rmdir -i"  # Pergunta antes de excluir diretórios vazios
alias rmf="rm -rf"  # Cuidado com o uso
alias cp="cp -i" # copia com confirmacao
alias mv="mv -i" # move com confirmacao
alias cls="clear" # limpar a tela
alias htop="htop --tree" # htop com uma visao mais amigavel

#tmux aliases
alias th="curl -s https://gist.githubusercontent.com/daniellichotti/289a71b9b7368853bc8f3d68be377db3/raw/9f5f024cf6b5905359bc5cc38836c24c09acc287/gistfile1.txt | zsh" # Mostra um cheatsheet dos atalhos
alias tm="tmux" # Abre o tmux com o comando padrão: tm
alias tn="tmux new -s" # Cria uma nova sessão com um nome específico: tn minha_sessao
alias ta="tmux attach -t" # Reconecta-se a uma sessão existente: ta minha_sessao
alias tk="tmux kill-session -t" # Encerra uma sessão pelo nome: tk minha_sessao
alias tls="tmux list-sessions" # Lista todas as sessões do tmux: tls
alias tr="tmux rename-window" # Renomeia a janela atual: tr novo_nome
alias tcode="tmux new-session -d nvim \; split-window -h \; attach-session -t 0"

#exa aliases
alias ll="exa -l -g --icons --git"
alias llt="exa -1 --icons --tree --git-ignore"

#nnn aliases
alias 3n="nnn" # fazer um alias para mostrar os atalhos

#alias git
alias gswc="git switch -c feature/branch"
alias gsw="git switch feature/branch"
alias gst="git status"
alias gaa="git add ."
alias gcmsg="git commit -m"
alias ggp="git push origin feature/branch"
#alias github-cli
gcreate() {
    gh repo create "$1" --public --gitignore "$2" --add-readme --clone && 
    cd "$1" && 
    gaa && 
    gcmsg 'first commit' && 
    git push --set-upstream origin master && 
    #if [ -z "$2" ]; then
    #    :
    if [ "$3" -eq 1 ]; then
        gh browse
    else
        :
    fi
}
#criar repositorio no github e enviar o codigo que voce criou para o repositorio
gCreateAdd() { 
    repo_name=$(basename "$(pwd)")
    
    rm -rf .git &&
    gh repo create "$repo_name" --public &&
    git init &&
    git add . &&
    git commit -m "first commit" &&
    git branch -M main &&
    git remote add origin "git@github.com:daniellichotti/${repo_name}.git" &&
    git push -u origin main &&
    gh browse
}

criarProjeto() {
        echo "Escolha uma opção:"
        echo "1. Projeto React JS com Vite"
        echo "2. Projeto React Native com Expo"
        echo "3. Projeto Python com Flask"
        echo "4. Projeto Python com Django"
        echo "0. Sair"
        # Ler entrada do usuário com compatibilidade para Zsh
        vared -p "Digite o número da opção: " -c opcao
        case "$opcao" in
            1)
                npm create vite@latest
                opcao=''
                ;;
            2)
                npx create-expo-app --template
                opcao=''
                ;;
            3)
                vared -p "Digite o nome do projeto: " -c nomeProjeto
                mkdir "$nomeProjeto"
                cd "$nomeProjeto"
                python -m venv venv
                source venv/bin/activate
                pip install flask
                # Criar o arquivo app.py e adicionar o conteúdo
                touch app.py
                echo "from flask import Flask" > app.py
                echo "" >> app.py
                echo "app = Flask(__name__)" >> app.py
                echo "" >> app.py
                echo "@app.route('/')" >> app.py
                echo "def home():" >> app.py
                echo "    return 'Olá, Flask!'" >> app.py
                echo "" >> app.py
                echo "if __name__ == '__main__':" >> app.py
                echo "    app.run(debug=True)" >> app.py
                echo "Para iniciar o server: python app.py"
                echo "Para sair do venv: deactivate"
                opcao=''
                nomeProjeto=''
                ;;
            4)
                vared -p "Digite o nome do projeto: " -c nomeProjeto
                mkdir "$nomeProjeto"
                cd "$nomeProjeto"
                python -m venv venv
                source venv/bin/activate
                pip install django
                django-admin startproject "$nomeProjeto" .
                echo "Para iniciar o server: python manage.py runserver"
                opcao=''
                ;;
            0)
                echo "Saindo..."
                opcao=''
                break
                ;;
            *)
                echo "Opção inválida!"
                opcao=''
                break
                ;;
        esac
        echo
}




# alias open="xdg-open"
alias open="gthumb"
alias weather="curl wttr.in"
alias spotify="ncspot"
alias maps="telnet mapscii.me"

alias rclonepull="rclone sync google-drive:/Obsidian ~/gdrive"
alias rclonepush="rclone sync ~/gdrive google-drive:/Obsidian"

#Others

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# NOTE: FZF
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"

# Setup fzf previews
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"

# fzf preview for tmux
export FZF_TMUX_OPTS=" -p90%,70% "

# opens documentation through fzf (eg: git,zsh etc.)
alias fman="compgen -c | fzf | xargs man"

# Turso
export PATH="/home/daniel/.turso:$PATH"

# bun completions
[ -s "/home/daniel/.bun/_bun" ] && source "/home/daniel/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# pnpm
export PNPM_HOME="/home/daniel/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"

PATH=~/.console-ninja/.bin:$PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
export PATH=$JAVA_HOME/bin:$PATH

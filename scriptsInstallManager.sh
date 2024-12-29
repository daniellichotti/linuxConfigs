#!/bin/bash
# curl -fsSL https://raw.githubusercontent.com/daniellichotti/linuxConfigs/refs/heads/main/scriptsInstallManager.sh | zsh -s 1 2 3...

# Verifica se argumentos foram passados
if [ $# -gt 0 ]; then
  echo "Argumentos passados: $@"
  # Verifica o valor do primeiro argumento
  if [ "$1" == "1" ]; then
    echo "Executando opção 1: "
    curl -fsSL https://raw.githubusercontent.com/daniellichotti/linuxConfigs/refs/heads/main/terminalConfigScript.sh | bash
    # Coloque o código para executar a ação para 'argumento1' aqui
  elif [ "$1" == "2" ]; then
    echo "Executando opção 2: "
    # Coloque o código para executar a ação para 'argumento2' aqui
  elif [ "$1" == "3" ]; then
    echo "Executando opção 3: "
    # Coloque o código para executar a ação para 'argumento2' aqui
  else
    echo "Opção desconhecida: $1"
  fi
else
  echo "Adicione ao fim: "
  echo "1 para instalar aplicações necessárias e customizar o terminal"
  echo "2 para dev"
  echo "3 para outra coisa"
  # Código para configuração padrão
fi

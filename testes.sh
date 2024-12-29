#!/bin/bash
# curl -fsSL https://raw.githubusercontent.com/daniellichotti/linuxConfigs/refs/heads/main/testes.sh | zsh -s argumento1 argumento2

# Verifica se argumentos foram passados
if [ $# -gt 0 ]; then
  echo "Argumentos passados: $@"
  # Verifica o valor do primeiro argumento
  if [ "$1" == "argumento1" ]; then
    echo "Executando ação para argumento1"
    # Coloque o código para executar a ação para 'argumento1' aqui
  elif [ "$1" == "argumento2" ]; then
    echo "Executando ação para argumento2"
    # Coloque o código para executar a ação para 'argumento2' aqui
  else
    echo "Opção desconhecida: $1"
  fi
else
  echo "Nenhum argumento passado. Executando configuração padrão."
  # Código para configuração padrão
fi

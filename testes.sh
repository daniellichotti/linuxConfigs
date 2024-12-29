#!/bin/bash
# curl -fsSL https://raw.githubusercontent.com/daniellichotti/linuxConfigs/refs/heads/main/testes.sh | zsh -s argumento1 argumento2
# Verifica o número de argumentos
if [ $# -gt 0 ]; then
  echo "Argumentos passados: $@"
  # Verifica o valor do primeiro argumento
  if [ "$1" == "opcao1" ]; then
    echo "Executando ação para opção 1"
    # Coloque o código para executar a ação para 'opcao1' aqui
  elif [ "$1" == "opcao2" ]; then
    echo "Executando ação para opção 2"
    # Coloque o código para executar a ação para 'opcao2' aqui
  else
    echo "Opção desconhecida: $1"
  fi
else
  echo "Nenhum argumento passado. Executando configuração padrão."
  # Código para configuração padrão
fi

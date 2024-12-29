#!/bin/zsh

echo "Escolha uma opção:"
echo "1. Projeto React JS com Vite"
echo "2. Projeto React Native com Expo"
echo "3. Projeto Python com Flask"
echo "4. Projeto Python com Django"
echo "0. Sair"

# Substituir read -p por um echo seguido de read
echo -n "Digite o número da opção: "
read opcao

case "$opcao" in
    1)
        echo "Criando Projeto React JS com Vite..."
        npm create vite@latest
        ;;
    2)
        echo "Criando Projeto React Native com Expo..."
        npx create-expo-app --template
        ;;
    0)
        echo "Saindo..."
        ;;
    *)
        echo "Opção inválida!"
        ;;
esac

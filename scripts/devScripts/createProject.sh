#!/bin/zsh

echo "Escolha uma opção:"
echo "1. Projeto React JS com Vite"
echo "2. Projeto React Native com Expo"
echo "3. Projeto NodeJs"
echo "4. Projeto Python com Flask"
echo "5. Projeto Python com Django"
echo "0. Sair"

# Substituir read -p por um echo seguido de read
echo -n "Digite o número da opção: "
read opcao

case "$opcao" in
    1)
        echo "Criando projeto React JS com Vite..."
        npm create vite@latest
        ;;
    2)
        echo "Criando projeto React Native com Expo..."
        npx create-expo-app --template
        ;;
    3)
        echo "Criando projeto NodeJs..."
        wget https://raw.githubusercontent.com/daniellichotti/linuxConfigs/refs/heads/main/scripts/devScripts/createNodeProject.sh && chmod +x createNodeProject.sh && ./createNodeProject.sh && rm createNodeProject.sh
        ;;
    4)
        echo "Criando projeto Python com Flask..."
        wget https://raw.githubusercontent.com/daniellichotti/linuxConfigs/refs/heads/main/scripts/devScripts/createFlaskProject.sh && chmod +x createFlaskProject.sh && ./createFlaskProject.sh && rm createFlaskProject.sh
        ;;
    5)
        echo "Criando projeto Python com Django..."
        wget https://raw.githubusercontent.com/daniellichotti/linuxConfigs/refs/heads/main/scripts/devScripts/createDjangoProject.sh && chmod +x createDjangoProject.sh && ./createDjangoProject.sh && rm createDjangoProject.sh
        ;;
    0)
        echo "Saindo..."
        ;;
    *)
        echo "Opção inválida!"
        ;;
esac

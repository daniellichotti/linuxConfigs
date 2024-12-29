#!/bin/bash

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
            echo "Criando Projeto React JS com Vite..."
            npm create vite@latest
            opcao=''
            ;;
        2)
            echo "Criando Projeto React Native com Expo..."
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

criarProjeto

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
    3)
        echo -n "Digite o nome do projeto: "
        read nomeProjeto
        mkdir "$nomeProjeto"
        cd "$nomeProjeto"
        python -m venv venv
        source venv/bin/activate
        pip install flask
        # Criar o arquivo app.py e adicionar o conteúdo
        cat <<EOL > app.py
        from flask import Flask
        
        app = Flask(__name__)
        
        @app.route('/')
        def home():
            return 'Olá, Flask!'
        
        if __name__ == '__main__':
            app.run(debug=True)
        EOL
        echo "Para iniciar o server: python app.py"
        echo "Para sair do venv: deactivate"
        ;;
    4)
        echo -n "Digite o nome do projeto: "
        read nomeProjeto
        mkdir "$nomeProjeto"
        cd "$nomeProjeto"
        python -m venv venv
        source venv/bin/activate
        pip install django
        django-admin startproject "$nomeProjeto" .
        echo "Para iniciar o server: python manage.py runserver"
        ;;
    0)
        echo "Saindo..."
        ;;
    *)
        echo "Opção inválida!"
        ;;
esac

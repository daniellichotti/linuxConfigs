#!/bin/zsh

echo -n "Digite o nome do projeto: "
read nomeProjeto
mkdir "$nomeProjeto"
cd "$nomeProjeto"
python -m venv venv && source venv/bin/activate && pip install flask

# Criar o arquivo app.py e adicionar o conteúdo com indentação correta
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

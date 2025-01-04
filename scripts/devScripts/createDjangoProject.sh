#!/bin/zsh

echo -n "Digite o nome do projeto: "
read nomeProjeto
mkdir "$nomeProjeto"
cd "$nomeProjeto"
python -m venv venv && 
source venv/bin/activate && 
pip install django
django-admin startproject "$nomeProjeto" .
echo "Para iniciar o server: python manage.py runserver"

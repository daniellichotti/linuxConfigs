#!/bin/bash

# Diretório onde os projetos serão criados
projects_directory=~/dev

# Verifica se o diretório 'dev' existe e cria se não existir
if [ ! -d "$projects_directory" ]; then
  mkdir -p "$projects_directory"
fi

cd $projects_directory &&

#read -p "Digite o nome do projeto: " name_project &&
name_project=''
while [ -z "$name_project" ]; do
  read -p "Digite o nome do projeto: " name_project
done
sleep 1 &&

pnpm create vite $name_project --template react-ts &&

# Aguarde 5 segundos para garantir que a estrutura do projeto seja totalmente criada
#sleep 5 &&

cd "$name_project" &&


# Agora podemos criar o arquivo 'src/App.tsx'
echo 'export function App() {
    return <h1>hello world</h1>;
}' > src/App.tsx

echo 'import React from "react";
import ReactDOM from "react-dom/client";
import { App } from "./App";

ReactDOM.createRoot(document.getElementById("root")!).render(
    <React.StrictMode>
        <App />
    </React.StrictMode>
);
' > src/main.tsx &&

rm -rf README.md .eslintrc.cjs src/App.css src/index.css public/vite.svg src/assets &&

sed -i '/"eslint/d' package.json &&
sed -i '/<link rel="icon"/d' index.html &&
sed -i 's|<title>Vite + React + TS</title>|<title>'$name_project'</title>|' index.html



echo "Digite a URL do repositório Git, se existir; caso não exista, deixe vazia:"
read input

if [ -z "$input" ]; then
    echo "Projeto nao adicionado ao github."
else
    echo name_project >> README.md &&
    git init &&
    git add . &&
    git commit -m "first commit" &&
    git branch -M main &&
    git remote add origin "$input" &&
    git push -u origin main
fi

pnpm i &&
code .

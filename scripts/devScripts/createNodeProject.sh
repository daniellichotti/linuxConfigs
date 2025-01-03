#!/bin/bash

# Solicita a entrada do usuário
read -p "Digite o nome do projeto: " file_name

# cria a pasta do projeto e entra nela
mkdir $file_name && cd $file_name

# cria o projeto node
npm init -y

# cria a estrutura de pastas e arquivos
mkdir src && touch src/server.ts && echo "node_modules build env" > .gitignore && echo "save-exact=true" > .npmrc
npm i typescript @types/node tsx tsup vitest vite-tsconfig-paths eslint @rocketseat/eslint-config -D
npx tsc --init
sed -i 's|^ *//"baseUrl": "./"|    "baseUrl": "./"|g' tsconfig.json && sed -i 's|^ *//"paths": {}|    "paths": {"@/*": ["./src/*"]}|g' tsconfig.json
npm i fastify dotenv zod
touch src/app.ts
sed -i 's|^ *//"baseUrl": "./"|    "baseUrl": "./"|g' tsconfig.json
# adicionar os scripts em package.json
# !TOFIX sed -i 's|"scripts": {"test": "echo \"Error: no test specified\" && exit 1"},|"scripts": {\n  \"dev\": \"tsx watch src/server.ts\",\n  \"start\": \"node build/server.js\",\n  \"lint\": \"eslint src --ext .ts --fix\",\n  \"build\": \"tsup src --out-dir build\"\n}|g' package.json


echo "NODE_ENV=dev" > .env 
cp .env .env.example
mkdir src/env/
touch src/env/index.ts
echo '{ "extends": ["@rocketseat/eslint-config/node"] }' > .eslintrc.json
echo 'node_modules build' > .eslintignore


echo "Projeto criado com sucesso!"

#Exame Quality Entregas

1. Teste de Lógica: As respostas do teste de lógica estão no arquivo (Avaliação Técnica - Dev.Full-Stack - Sérgio - Respondido), neste repositório.
2. Banco de Dados: As consultas de banco de dados estão no arquivo (Parte II - Banco de Dados), neste repositório.
3. Lógica de Programação: O projeto está nesse repositório e as instruções estão a seguir:

Um sistema completo para gerenciamento de clientes, desenvolvido com Node.js e Vue.js. Este projeto permite criar, ler, atualizar e excluir informações de clientes de maneira eficiente, oferecendo uma interface de usuário intuitiva e uma API robusta.

🚀 ##Começando
Essas instruções permitirão que você obtenha uma cópia do projeto em operação na sua máquina local para fins de desenvolvimento e teste.

Consulte Implantação para saber como implantar o projeto.

📋 ##Pré-requisitos
Para instalar e executar este projeto, você precisa das seguintes ferramentas:

Node.js: v14 ou superior
MySQL ou MariaDB
Certifique-se de que essas ferramentas estão instaladas em sua máquina. Caso contrário, siga os links para obter instruções de instalação.

🔧 ##Instalação
Siga os passos abaixo para configurar o projeto:

Clone o repositório:

```
git clone https://github.com/SEU_USUARIO/projeto-quality-entregas.git
```

Navegue até o diretório do projeto:

```
cd projeto-quality-entregas
```

Instale as dependências do backend:
Navegue até o diretório src e execute:

```
bash
cd src
npm install
```

Instale as dependências do frontend:
Em um terminal separado, navegue até o diretório frontend e execute:

```
cd front-client-app
npm install
Configure o banco de dados:
```

Crie um banco de dados MySQL conforme o nome especificado no arquivo .env.
Atualize o arquivo .env com suas credenciais do banco de dados.
Exemplo de .env para o backend:

```
DB_NAME=CLIENTES
DB_USER=root
DB_PASSWORD=Password
DB_HOST=127.0.0.1
```

Crie o arquivo .env para o frontend:
Navegue até o diretório frontend e crie um arquivo .env com o seguinte conteúdo:

```
VUE_APP_API_URL=http://localhost:3000/api
```

Startando o backend:

```
node src/index.js
```

Startando o frontend:

```
npm run serve
```

🛠️ Construído com

Node.js - O runtime JavaScript
Express - Framework para Node.js
Sequelize - ORM para Node.js
Vue.js - Framework JavaScript para frontend
SweetAlert2 - Biblioteca para alertas

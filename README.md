# sei5-infra

Este repositório contém a configuração necessária para executar o **SEI5** utilizando **Docker** e **Docker Compose**.

## Requisitos

Antes de iniciar a instalação, certifique-se de ter os seguintes requisitos atendidos:

- **Docker** instalado
- **Docker Compose** instalado

## Como subir o ambiente SEI5

### 1 **Clonar o repositório**
```sh
git https://github.com/tre-pa/sei5-infra.git
cd sei5-infra
```


### 2 Build da imagem SEI5

O build da imagem deve ser feito a partir da raiz do projeto. O Dockerfile está localizado na pasta sei5, então execute:

```sh
docker build -t sei5-alpine:1.0.0 ./sei5
```

### 3 Baixar a imagem do Memcached

O Memcached é um serviço obtido diretamente do Docker Hub, portanto, não é necessário construir uma imagem. Para garantir que ele esteja disponível, execute:

```sh
docker pull memcached:1.6.36-alpine
```

### 4 Build da imagem do solr


```sh
docker build -t solr:8.2.0 ./solr
```

### 5 Build da imagem do JodConverter


```sh
docker build -t jodconverter-tomcat:2.2.2 ./jod
```

### 6 **Build da imagem do PostgreSQL**

O build da imagem deve ser feito a partir da raiz do projeto. O Dockerfile está localizado na pasta `postgres`, então execute:

```sh
docker build -t sei5-postgres:1.0.0 -f postgres/Dockerfile .
```

## **Executando o Container**

Para iniciar o container do PostgreSQL com as configurações necessárias, execute o comando abaixo. Esse comando define a senha do banco de dados, expõe a porta padrão do PostgreSQL e carrega automaticamente scripts de inicialização.

```sh
docker run -d --name sei5-postgres \
  -p 5432:5432 \
  -e POSTGRES_PASSWORD=postgres \
  -v ./init:/docker-entrypoint-initdb.d \
  sei5-postgres:1.0.0
```

## Configuração do Banco de Dados

Abaixo estão as principais variáveis de ambiente utilizadas para configurar o banco de dados.

| Variável           | Descrição                                      | Valor Padrão            | Observação                           |
|--------------------|----------------------------------------------|-------------------------|--------------------------------------|
| `DB_TIPO`         | Tipo do banco de dados                       | `PostgreSql`            | Opções: `Oracle`, `PostgreSql` |
| `DB_HOST`         | Nome do container Docker do banco            | `postgres-14-13-sei-5`  | Nome do serviço no Docker Compose  |
| `DB_PORTA`        | Porta utilizada pelo banco                   | `5432`                  | `5432` para PostgreSQL, `1521` para Oracle |
| `DB_SEI_BASE`     | Nome do banco de dados do SEI                | `sei`                   | - |
| `DB_SEI_USERNAME` | Usuário do banco de dados do SEI             | `sei`                   | - |
| `DB_SEI_PASSWORD` | Senha do banco de dados do SEI               | `sei`                   | - |
| `DB_SIP_BASE`     | Nome do banco de dados do SIP                | `sip`                   | - |
| `DB_SIP_USERNAME` | Usuário do banco de dados do SIP             | `sip`                   | - |
| `DB_SIP_PASSWORD` | Senha do banco de dados do SIP               | `sip`                   | - |

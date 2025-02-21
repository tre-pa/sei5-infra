# sei5-infra

Este repositório contém a configuração necessária para executar o **SEI5** utilizando **Docker** e **Docker Compose**.

## Requisitos

Antes de iniciar a instalação, certifique-se de ter os seguintes requisitos atendidos:

- **Docker** instalado
- **Docker Compose** instalado
- **Código fonte** do SEI (sei, sip, infra)
- **Arquivos de dump** do PostgreSQL

## 1. Construir as imagens Docker usando Docker Compose

Execute o seguinte comando para construir as imagens:

```bash
docker compose build
```

**Nota:** Em algumas distribuições, o comando pode ser diferente. Use o seguinte, se necessário:

```sh
docker-compose build
```

## 2. Configuração do Banco de Dados

O acesso ao banco de dados pode ser configurado no arquivo env.ini, localizado na raiz do projeto. Abaixo, seguem as variáveis disponíveis:


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


## 3. Inserir o código fonte do SEI

Inserir o código fonte do sei no diretório **docker/config/src**

```sh
docker/src/
├── sei/
├── sip/
└── infra/
```

**Importante:** O código fonte deve ser copiado com encoding **ISO-8859-1** para garantir a compatibilidade de caracteres especiais e evitar problemas de codificação durante a execução.

## 4. Inserir o SQL dump do postgres no diretório **docker/config/init-db**

```sh
ddocker/init-db/
├── docker/init-db/sei_5_0_0.sql
└── docker/init-db/sip_3_2_0.sql
```

## 5. Como executar os containers com Docker Compose

Para executar os containers definidos no arquivo `docker-compose.yml`, use o comando:

```bash
docker compose up -d
```

ou

```bash
docker-compose up -d
```

Após inicialização dos serviços, você poderá acessar (usuário/senha: teste/teste):

 - localhost:8000/sei
 - localhost:8000/sip

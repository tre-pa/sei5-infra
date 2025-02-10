# PostgreSQL Docker Image

Esta imagem Docker é baseada no **PostgreSQL 14.13** e já inclui configurações para execução do **Sei-5**


---

## **Como Usar**


### **Executar o Container**
Para iniciar o container do PostgreSQL com as configurações necessárias, execute o comando abaixo. Esse comando define a senha do banco de dados, expõe a porta padrão do PostgreSQL e carrega automaticamente scripts de inicialização.

```sh
docker run -d --name sei5-postgres \
  -p 5432:5432 \
  -e POSTGRES_PASSWORD=postgres \
  -v ./init:/docker-entrypoint-initdb.d \
  sei5-postgres:1.0.0
```

### **Acessar o Banco de Dados**
Você pode acessar o banco de dados de dentro do container com:

```sh
docker exec -it postgres psql -U postgres -d sei
```

Ou conectar de fora usando um cliente SQL:
- **Host**: `localhost`
- **Porta**: `5432`
- **Usuário**: `postgres`
- **Senha**: (definida na variável `POSTGRES_PASSWORD`)
- **Banco**: `sei` ou `sip`


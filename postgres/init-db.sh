#!/bin/sh
set -e

# Espera o PostgreSQL iniciar
echo "Aguardando o PostgreSQL iniciar..."
until pg_isready -U "$POSTGRES_USER"; do
  sleep 2
done

echo "Alterando o datestyle para 'ISO, DMY'..."
psql -U "$POSTGRES_USER" -c "ALTER SYSTEM SET datestyle = 'ISO, DMY';"
psql -U "$POSTGRES_USER" -c "SELECT pg_reload_conf();"

echo "Criando usuários..."
psql -U "$POSTGRES_USER" -c "CREATE USER sei WITH PASSWORD 'sei';"
psql -U "$POSTGRES_USER" -c "CREATE USER sip WITH PASSWORD 'sip';"

echo "Criando bancos de dados..."
psql -U "$POSTGRES_USER" -c "CREATE DATABASE sei WITH OWNER = postgres ENCODING = 'LATIN1' LC_COLLATE = 'C' LC_CTYPE = 'C' TEMPLATE=template0 CONNECTION LIMIT = -1;"
psql -U "$POSTGRES_USER" -c "CREATE DATABASE sip WITH OWNER = postgres ENCODING = 'LATIN1' LC_COLLATE = 'C' LC_CTYPE = 'C' TEMPLATE=template0 CONNECTION LIMIT = -1;"

echo "Importando dados para o banco sei..."
psql -U "$POSTGRES_USER" -d sei -f /sql/sei_5_0_0.sql

echo "Importando dados para o banco sip..."
psql -U "$POSTGRES_USER" -d sip -f /sql/sip_3_2_0.sql

echo "Concedendo permissões para o usuário sei no banco sei..."
psql -U "$POSTGRES_USER" -d sei -c "GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO sei;"
psql -U "$POSTGRES_USER" -d sei -c "GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO sei;"

echo "Concedendo permissões para o usuário sip no banco sip..."
psql -U "$POSTGRES_USER" -d sip -c "GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO sip;"
psql -U "$POSTGRES_USER" -d sip -c "GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO sip;"

echo "Inicialização concluída com sucesso!"

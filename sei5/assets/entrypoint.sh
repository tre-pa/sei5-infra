#!/bin/sh

mkdir -p /opt/sei/temp
mkdir -p /opt/sip/temp
chmod 777 /opt/sei/temp
chmod 777 /opt/sip/temp
chown -R apache:apache /var/sei/arquivos

# Atualização do endereço de host da aplicação
#!/bin/sh
set -e

# Defina o caminho que espera ser montado
VOLUME_PATH="/opt"

# Verifica se o diretório está vazio (não montado)
if [ ! -d "$VOLUME_PATH" ] || [ -z "$(ls -A $VOLUME_PATH)" ]; then
  echo "Erro: O volume em '$VOLUME_PATH' não foi montado corretamente."
  echo "Use: docker run -v /caminho/src:/opt <imagem>"
  exit 1
fi

php -r "
    require_once '/opt/sip/web/Sip.php';

    \$conexao = BancoSip::getInstance();
    \$conexao->abrirConexao();

    \$appOrgao = getenv('APP_ORGAO');
    \$appOrgaoDescricao = getenv('APP_ORGAO_DESCRICAO');
    \$appProtocolo = getenv('APP_PROTOCOLO');
    \$appHost = getenv('APP_HOST');

    \$dbSeiUser = getenv('DB_SEI_USERNAME');
    \$dbSeiPass = getenv('DB_SEI_PASSWORD');
    \$dbSipUser = getenv('DB_SIP_USERNAME');
    \$dbSipPass = getenv('DB_SIP_PASSWORD');
    \$dbHost = getenv('DB_HOST');

    \$conexao->executarSql(\"UPDATE orgao SET sigla='\$appOrgao', descricao='\$appOrgaoDescricao'\");

    \$conexao->executarSql(\"UPDATE orgao SET sigla='\$appOrgao', descricao='\$appOrgaoDescricao'\");

    \$conexao->executarSql(\"UPDATE sistema SET pagina_inicial='\$appProtocolo://\$appHost/sip' WHERE sigla='SIP'\");

    \$conexao->executarSql(\"UPDATE sistema SET pagina_inicial='\$appProtocolo://\$appHost/sei/inicializar.php', web_service='\$appProtocolo://\$appHost/sei/controlador_ws.php?servico=sip' WHERE sigla='SEI'\");
" || exit 1

exec "$@"


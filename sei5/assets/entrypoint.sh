#!/bin/sh

mkdir -p /opt/sei/temp
mkdir -p /opt/sip/temp
chmod 777 /opt/sei/temp
chmod 777 /opt/sip/temp
chown -R apache:apache /var/sei/arquivos

# Atualização do endereço de host da aplicação
#!/bin/sh
set -e

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
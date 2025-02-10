<?

class ConfiguracaoSip extends InfraConfiguracao
{

  private static $instance = null;

  public static function getInstance(): ConfiguracaoSip
  {
    if (ConfiguracaoSip::$instance == null) {
      ConfiguracaoSip::$instance = new ConfiguracaoSip();
    }
    return ConfiguracaoSip::$instance;
  }

  public function getArrConfiguracoes(): array
  {
    return array(
      'Sip' => array(
        'URL' => getenv('APP_PROTOCOLO').'://'.getenv('APP_HOST').'/sip',
        'Producao' => getenv('APP_PRODUCAO'),
      ),

      'PaginaSip' => array('NomeSistema' => 'SIP'),

      'SessaoSip' => array(
        'SiglaOrgaoSistema' => getenv('APP_ORGAO'),
        'SiglaSistema' => 'SIP',
        'PaginaLogin' => getenv('APP_PROTOCOLO').'://'.getenv('APP_HOST').'/sip/login.php',
        'SipWsdl' => getenv('APP_PROTOCOLO') . '://' . getenv('APP_HOST') . '/sip/controlador_ws.php?servico=sip',
        'ChaveAcesso' => getenv('SIP_CHAVE_ACESSO'),
          'https' => (getenv('APP_PROTOCOLO') == 'https' ? true : false)
      ),

      'BancoSip' => array(
        'Servidor' => getenv('DB_HOST'),
        'Porta' => getenv('DB_PORTA'),
        'Banco' => getenv('DB_SIP_BASE'),
        'Usuario' => getenv('DB_SIP_USERNAME'),
        'Senha' => getenv('DB_SIP_PASSWORD'),
        'Tipo' => getenv('DB_TIPO'),

      ), //MySql, SqlServer, Oracle ou PostgreSql

      
      'BancoAuditoriaSip'  => array(
        'Servidor' => getenv('DB_HOST'),
        'Porta' => getenv('DB_PORTA'),
        'Banco' => getenv('DB_SIP_BASE'),
        'Usuario' => getenv('DB_SIP_USERNAME'),
        'Senha' => getenv('DB_SIP_PASSWORD'),
        'Tipo' => getenv('DB_TIPO'),
      ),  //MySql, SqlServer, Oracle ou PostgreSql
      

      'CacheSip' => array(
        'Servidor' => getenv('MEMCACHED_HOST'),
        'Porta' => '11211'
      ),

      'hCaptcha' => array(
        'ChaveSecreta' => '',
        'ChaveSite' => ''
      ),

      'ReCaptchaV2' => array(
        'ChaveSecreta' => '',
        'ChaveSite' => ''
      ),

      'ReCaptchaV3' => array(
        'ChaveSecreta' => '',
        'ChaveSite' => '',
        'Score' => 0.5
      ),

      'Cloudflare' => array(
        'ChaveSecreta' => '',
        'ChaveSite' => ''
      ),

      'InfraMail' => array(
        'Tipo' => getenv('MAIL_TIPO'), //1 = sendmail (neste caso no  necessrio configurar os atributos abaixo), 2 = SMTP
        'Servidor' => getenv('MAIL_SERVIDOR'),
        'Porta' => getenv('MAIL_PORTA'),
        'Codificacao' => getenv('MAIL_CODIFICACAO'),  //8bit, 7bit, binary, base64, quoted-printable
        'MaxDestinatarios' => getenv('MAIL_MAXDESTINATARIOS'), //numero maximo de destinatarios por mensagem
        'MaxTamAnexosMb' => getenv('MAIL_MAXTAMANHOANEXOSMB'), //tamanho maximo dos anexos em Mb por mensagem
        'Seguranca' => getenv('MAIL_SEGURANCA'), //TLS, SSL ou vazio
        'Autenticar' => getenv('MAIL_AUTENTICAR'), //se true ento informar Usuario e Senha
        'Usuario' => getenv('MAIL_USUARIO'),
        'Senha' => getenv('MAIL_SENHA'),
        'Protegido' => getenv('MAIL_PROTEGIDO') //campo usado em desenvolvimento, se tiver um email preenchido entao todos os emails enviados terao o destinatario ignorado e substitudo por este valor (evita envio incorreto de email)
      )
    );
  }
}

?>
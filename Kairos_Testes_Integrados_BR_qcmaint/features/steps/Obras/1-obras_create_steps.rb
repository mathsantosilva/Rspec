
Dado('que acesso a tela de obras') do
    # Realiza login
    @login.logon_br
    # Acessando a empresa pela navegacao de telas
    @common.nav_mod('Obras')
    # Carrega as variaveis utilizadas nas spec
    @complements.varcommon
    @complements.varcadastro
  end
  
  Quando('inicio o cadastro de uma nova obra') do
    @cadastros.looping_obras
    
  end
  
  Então('ela deverá apresentar a mensagem {string}') do |message_success|
    expect(find('div[id=Summary-Field-Index]')).to have_content message_success
  end
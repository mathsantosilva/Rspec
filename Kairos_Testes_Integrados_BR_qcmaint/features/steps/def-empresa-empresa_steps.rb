Dado('que acesso a tela de empresas') do
    # Realiza login
    @components.logon_br
    # Acessando a empresa pela navegacao de telas
    @components.nav('Empresa', 'div[id="MenuEmpresas"]')
    # Carrega as variaveis utilizadas nas spec
end
  
  Quando('preencho os dados e uso cnpj') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Quando('aperto no botão salvar') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então('devo receber uma mensagem {string}') do |string|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Quando('preencho os dados e uso cpf') do
    pending # Write code here that turns the phrase above into concrete actions
  end
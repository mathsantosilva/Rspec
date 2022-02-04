Dado('Acesso a tela de filiais') do

  #logando
  @login.logon_br

  #Acessando o cadastro da empresa filial pela navegação de telas
  @common.nav('Empresa','div[id="MenuFiliais"')

end

Quando('Cadastrando uma nova filial') do

  @cadastros.cadas_emp_filial()

end

Quando('Apertando no botão salvar') do

  drop = find("input[type=submit][value='Salvar']", match: :first)
  drop.click

end

Então('Aguardo uma mensagem de confirmação {string}') do |message_sucess|
  
  expect(find('div[class=validation-summary-ok]')).to have_content message_sucess

end
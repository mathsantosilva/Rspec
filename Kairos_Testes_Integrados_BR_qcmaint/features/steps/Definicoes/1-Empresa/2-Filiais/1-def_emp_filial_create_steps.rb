Dado('Acesso a tela de filiais para cadastrar') do

  #logando
  @login.logon_br

  sleep 1

  #Acessando o cadastro da empresa filial pela navegação de telas
  @common.nav('Empresa','div[id="MenuFiliais"')

end

Quando('Cadastrando uma nova filial') do

  #Cadastrando a empresa filial
  @cadastros.cadas_emp_filial()

end

Quando('Apertando no botão salvar') do

  #Clicando no botão para salvar a filial
  drop = find("input[type=submit][value='Salvar']", match: :first)
  drop.click

end

Então('Aguardo uma mensagem de confirmação {string}') do |message_sucess|

  #Mensagem de confirmação de cadastro de filial
  expect(find('div[id=Summary-Field-Index]')).to have_content message_sucess
    
end
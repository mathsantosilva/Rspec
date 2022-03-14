Dado('Acesso a tela de filiais e clico para alterar') do

  #Logando
  @login.logon_br

  sleep 1
  
  #Acessando o cadastro da empresa filial pela navegação de telas
  @common.nav_def('Empresa','div[id="MenuFiliais"')

  #Removendo o chat
  @common.remove_chat()

  sleep 1

end


Quando('Realizo a alteração da filial') do

  #Selecionando o botão alterar
  @common.select_button('body > div.ZonaConteudo > div.Conteudo > table > tbody > tr:nth-child(1) > td:nth-child(1)','img[class="pointer icons editIcon"]')
  
  #Alterando as informações da filial
  @cadastros.alter_emp_filial()

end
    
Quando('Aperto no botão salvar') do

  #Clicando no botão para salvar a alteração da filial
  @common.botaosalvar
  sleep 2
    
end

Então('Aguardo uma mensagem de alteração {string}') do |message_sucess|

  #Mensagem de que filial foi alterada com sucesso
  expect(find('div[id=Summary-Field-Index]')).to have_content message_sucess
    
end
Dado("Acesso a tela de filiais e clico para alterar") do

  #Logando
  @login.logon_br
  
  #Acessando o cadastro da empresa filial pela navegação de telas
  @common.nav('Empresa','div[id="MenuFiliais"')

  #Removendo o chat
  @common.remove_chat()

  sleep 3

end


Quando('Realizo a alteração da filial') do

  #Selecionando o botão alterar
  @common.select_button('table[class="ContentTable"]','tbody/tr/td/td','Halvorson LLC 2021-12-02 11:33:45 -0300','img[class="pointer icons editIcon"]')
  
  @cadastros.alter_emp_filial()

end
    
Quando("Aperto no botão salvar") do

  drop = find("input[type=submit][value='Salvar']", match: :first)
  drop.click
  sleep 2
    
end

Então('Aguardo uma mensagem de confirmação {string}') do |message_sucess|

  expect(find('div[class=validation-summary-ok]')).to have_content message_sucess
    
end
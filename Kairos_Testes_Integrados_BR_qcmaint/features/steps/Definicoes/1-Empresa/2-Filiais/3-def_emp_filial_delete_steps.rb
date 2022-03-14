Dado('Acesso a tela de filiais para deletar') do
  
  #logando
  @login.logon_br

  sleep 1
  
  # Acessando a empresa filial pela navegação de telas
  @common.nav_def('Empresa','div[id="MenuFiliais"')

  #removendo o chat
  @common.remove_chat

end

Quando('Clico para remover a filial') do

  #Selecionando e clicando no botão remover
  @common.select_button('body > div.ZonaConteudo > div.Conteudo > table > tbody > tr:nth-child(1) > td:nth-child(1)','img[class="pointer icons deleteIcon"]')

end

Quando('Confirmo a remoção da filial') do

  #Clicando para confirmar a remoção da filial
  @common.confir_remover

end

Então('Aguardo uma mensagem de remoção {string}') do |message_sucess|

  #Mensagem de sucesso na remoção
  expect(find('div[id=Summary-Field-Index]')).to have_content message_sucess
    
end
Dado 'Logo no sistema' do

    #Faço o login no sistema
    @login.logon_br

end

Quando 'Acesso a tela de filiais e clico em nova filial' do

    #Acessando o cadastro da empresa filial pela navegação de telas
    @common.nav_def('Empresa','div[id="MenuFiliais"')

    #Clico em nova filial
    find('label[class="pointer"]').click

end

Quando 'Clico no botão para salvar' do

    #clicando para salvar
    @common.botaosalvar

end


Então 'Verifico os campos obrigatorios para cadastro' do

    @obrigatorio.camp_obrig_filiais()

end



Quando 'Navego até a tela de filiais' do

    #Acessando o cadastro da empresa filial pela navegação de telas
    @common.nav_def('Empresa','div[id="MenuFiliais"')

end

Quando 'Preencho os campos com o maximo de caracteres permitidos e clico para salvar' do

    @cadastros.cadas_emp_filial_val_limites()

end

Então 'Clico para alterar e verifico se foi cadastrada a quantidade correta de caracteres' do

    @common.select_button('body > div.ZonaConteudo > div.Conteudo > table > tbody > tr:nth-child(1) > td:nth-child(1)','img[class="pointer icons editIcon"]')

    @obrigatorio.verificacao_campos_filiais()

end



Quando 'Vou até a tela de filiais' do

    #Acessando o cadastro da empresa filial pela navegação de telas
    @common.nav_def('Empresa','div[id="MenuFiliais"')

end

Quando 'Preencho os campos com caracteres especiais , aguardo mensagens de erro e preencho os campos corretamente' do

    @cadastros.cadas_emp_filial_especiais()

end

Então 'Espero uma mensagem de confirmação {string}' do |message_sucess|

  #Mensagem de confirmação de cadastro de filial
  expect(find('div[id=Summary-Field-Index]')).to have_content message_sucess

end
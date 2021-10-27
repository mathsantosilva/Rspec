describe 'formatos de exportacao', :folha_pagamento do
  before(:each) do
    visit '/'

    #Aceitando os cookies
    find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click

    #Informações de login
    fill_in 'LogOnModel_UserName', with: $user_br
    fill_in 'LogOnModel_Password', with: $senha
    click_button 'Entrar'

    # Acessando o cadastro de Formato de exportação de folha de pagamento pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 2
    find('div[class="pointer DropDownHeaderElement"]', text: 'Exportação').click
    find('span[id="TabFolha"]' , text: 'Folha de Pagamento').click
  end

  it 'CT021 inserir campos na exportacao folha de pagamento', :ct021_folha do

    find('label[class="pointer"]' , text:'Adicionar' ).click
    fill_in 'Codigo', with: '123'
    fill_in 'Descricao', with: 'abccd'
    drop = find("input[type=button][value='Dia Inicio Fechamento']", match: :first)
    drop.click
    sleep 6

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[class="validation-summary-ok"]')).to have_content 'O Formato de folha foi adicionado com sucesso'
  end
end

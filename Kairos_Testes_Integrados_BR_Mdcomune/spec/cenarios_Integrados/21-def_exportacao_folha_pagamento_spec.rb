describe 'formatos de exportacao', :folha_pagamento do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'migracaomd15042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    
    visit '/admin/FormatosExportacao'
    visit '/admin/FormatosExportacao/EditFolhaPagamentos'
  end

  it 'CT021 inserir campos na exportacao folha de pagamento', :ct021_folha do
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

describe 'formatos de exportacao', :folha_pagamento do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'migracaopt16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    
    visit '/admin/FormatosExportacao'
    visit '/admin/FormatosExportacao/EditFolhaPagamentos'
  end

  it 'CT021 inserir campos na exportacao folha de pagamento', :ct021_folha do
    fill_in 'Codigo', with: '123'
    fill_in 'Descricao', with: 'abc'
    drop = find("input[type=button][value='Dia Inicio Fecho']", match: :first)
    drop.click
    sleep 3

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id="Summary-Field-Index"]')).to have_content 'O Formato de programa de salário foi criado com sucesso'
  end
end

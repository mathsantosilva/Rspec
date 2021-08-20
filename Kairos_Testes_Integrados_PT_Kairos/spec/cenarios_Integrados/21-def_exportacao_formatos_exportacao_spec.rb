describe 'formatos de exportacao', :folha_pagamento do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'teste24052021@teste.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    
    visit '/admin/FormatosExportacao'
    visit '/admin/FormatosExportacao/EditFolhaPagamentos'
  end

  it 'CT021 inserir campos na exportacao folha de pagamento', :ct021_folha do
    fill_in 'Codigo', with: '1254743'
    fill_in 'Descricao', with: 'a#@$%@#GG#$yi978bc'
    drop = find("input[type=button][value='Dia Inicio Fecho']", match: :first)
    drop.click
  
    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id="Summary-Field-Index"]')).to have_content 'O Formato de programa de salário foi criado com sucesso'
  end
end

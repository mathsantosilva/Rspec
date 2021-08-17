describe 'formatos de exportacao', :folha_pagamento do
    before(:each) do
      visit '/Dimep/Account/LogOn?ReturnUrl=%2F'
  
      fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
      fill_in 'LogOnModel_Password', with: '1'
      click_button 'Entrar'
      visit '/admin/FormatosExportacao'
      visit '/admin/FormatosExportacao/EditFolhaPagamentos'
    end
  
    it 'CT001 inserir campos na exportacao folha de pagamento', :ct001_folha do
    fill_in 'Codigo', with: '12213'
    fill_in 'Descricao', with: 'abeqccd'
    drop = find("input[type=button][value='Dia Inicio Fechamento']", match: :first)
    drop.click

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[class=validation-summary-ok]')).to have_content 'Formato de folha foi adicionado com sucesso'
    end
  
    it 'CT002 validar a insercao dos campos obrigatorios na exportacao folha de pagamento', :ct002_folha do
      fill_in 'Codigo', with: ''
      fill_in 'Descricao', with: ''
      drop = find("input[type=button][value='Salvar']", match: :first)
      drop.click

      expect(find('span[data-valmsg-for=Codigo]')).to have_content 'Por favor adicione um código'
      expect(find('span[data-valmsg-for=Descricao]')).to have_content 'A Descrição não pode estar vazia'
      sleep 5
    end
  end
  
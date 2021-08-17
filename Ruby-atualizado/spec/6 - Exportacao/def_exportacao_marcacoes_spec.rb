describe 'exportacao de marcacoes', :exportacao_marcacoes do
    before(:each) do
      visit '/Dimep/Account/LogOn?ReturnUrl=%2F'
      fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
      fill_in 'LogOnModel_Password', with: '1'
      click_button 'Entrar'
      visit '/admin/FormatosExportacao'
      visit '/admin/FormatosExportacao/EditApontamento'
    end
  
    it 'CT001 inserir campos na exportacao marcacoes', :ct001_exportacao_marcacoes do
    fill_in 'Codigo', with: '12321'
    fill_in 'Descricao', with: 'abc3cd'
    drop = find("input[type=button][value='Nome da Pessoa']", match: :first)

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Formatos de exportação de marcações foi adicionado com sucesso'
    end
  
    it 'CT002 validar a insercao dos campos obrigatorios na exportacao marcacoes', :ct002_exportacao_marcacoes do
      fill_in 'Codigo', with: ''
      fill_in 'Descricao', with: ''
      drop = find("input[type=submit][value='Salvar']", match: :first)
      drop.click

      expect(find('span[for=Codigo]')).to have_content 'Por favor adicione um código'
      expect(find('span[for=Descricao]')).to have_content 'Por favor adicione uma descrição'
      end

    it 'CT003 validar a insercao dos campos obrigatorios existentes', :ct003_exportacao_marcacoes do
      fill_in 'Codigo', with: '12321'
      fill_in 'Descricao', with: 'abccdx'
      drop = find("input[type=submit][value='Salvar']", match: :first)
      drop.click

      expect(find('div .field-validation-error')) .to have_content'Já existe um Formatos de exportação de marcações com o código inserido'
     end
end 

describe 'exportacao de marcacoes', :exportacao do
    before(:each) do
      visit '/Dimep/Account/LogOn?ReturnUrl=%2F'
  
      fill_in 'LogOnModel_UserName', with: 'sprintbr08012021@dimep.com'
      fill_in 'LogOnModel_Password', with: 'dimep123'
      click_button 'Entrar'
      visit '/Dimep/FormatosExportacao'
      visit '/Dimep/FormatosExportacao/EditApontamento'
    end
  
    it 'CT001 inserir campos na exportacao marcacoes', :ct001_exportacao do
    fill_in 'Codigo', with: '12321'
    fill_in 'Descricao', with: 'abccdx'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Formatos de exportação de marcações foi adicionado com sucesso'
    end
  
    it 'CT002 validar a insercao dos campos obrigatorios na exportacao marcacoes', :ct002_exportacao do
      fill_in 'Codigo', with: ''
      fill_in 'Descricao', with: ''
      drop = find("input[type=submit][value='Salvar']", match: :first)
      drop.click

      expect(find('span[for=Codigo]')).to have_content 'Por favor adicione um código'
      expect(find('span[for=Descricao]')).to have_content 'Por favor adicione uma descrição'
      sleep 5
    end

    it 'CT003 validar a insercao dos campos obrigatorios existentes', :ct003_exportacao do
      fill_in 'Codigo', with: '12321'
      fill_in 'Descricao', with: 'abccdx'
      drop = find("input[type=submit][value='Salvar']", match: :first)
      drop.click

      expect(find('div .field-validation-error')) .to have_content'Já existe um Formatos de exportação de marcações com o código inserido'
      sleep 5
  end
end 
 

describe 'escalas de folgas', :folgas do
    before(:each) do
      visit '/Dimep/Account/LogOn?ReturnUrl=%2F'
      fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
      fill_in 'LogOnModel_Password', with: '1'
      click_button 'Entrar'
      visit '/Dimep/EscalasFolgas'
    end
    
    it 'CT001 Inserir uma nova folga', :ct001_folgas do
      fill_in 'userAutocomplete', with: 'Ra'
      fill_in 'select_periodos', with: '10022021'

      drop = find("input[type=button][value='Pesquisar']", match: :first)
      drop.click
  
      drop = find("input[type=submit][value='Pesquisar Escalas de folgas']", match: :first)
      drop.click
    end
  
    it 'CT002 Validar insercao de campos obrigatórios de escalas de folgas', :ct002_escalas do
      fill_in 'select_periodos', with: ''
      fill_in 'select_periodos', with: ''

      drop = find("input[type=button][value='Pesquisar']", match: :first)
      drop.click
  
      drop = find("input[type=button][value='Pesquisar Escalas de Folgas']", match: :first)
      drop.click
  
      expect(find('span[for=Summary-Field-Index]')).to have_content 'Deve selecionar um período'
      expect(find('span[for=Summary-Field-Index]')).to have_content 'Selecione uma pessoa primeiro'
    end
  end
  
describe 'guada a estrutura organizacional', :campos do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr08012021@dimep.com'
    fill_in 'LogOnModel_Password', with: 'dimep123'
    click_button 'Entrar'
       visit '/Usuarios'
    visit '/CamposExtra'
  end

    it 'CT001 Inserir uma nova estrutura organizacional', :ct001_campos do
      fill_in '', with: ''

      drop = find("input[type=button][value='Salvar']", match: :first)
      drop.click
    #não é necessario selecionar item.
    
      expect(find('div[id=Summary-Field-Index]')).to have_content 'Campos extra da estrutura organizacional guardados com sucesso.'
    end   
  end

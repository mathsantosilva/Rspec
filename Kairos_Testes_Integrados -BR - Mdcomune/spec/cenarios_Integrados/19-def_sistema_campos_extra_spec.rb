describe 'guada a estrutura organizacional', :campos do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'
    fill_in 'LogOnModel_UserName', with: 'migracaomd15042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    
    visit '/admin/Usuarios'
    visit '/admin/CamposExtra'
  end

  it 'CT019 Inserir novos campos extras', :ct019_campos do
    fill_in 'LabelCampo1', with: '11'
    fill_in 'LabelCampo2', with: '11'

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click
    # não é necessario selecionar item.

    expect(find('div[id=Summary-Field-Index]')).to have_content 'Campos extra da estrutura organizacional guardados com sucesso.'
  end
end

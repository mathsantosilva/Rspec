describe 'preferências do sistema', :preferencias do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr08012021@dimep.com'
    fill_in 'LogOnModel_Password', with: 'dimep123'
    click_button 'Entrar'
    visit '/Usuarios'
    visit '/Preferencias'
  end

  it 'CT001 Inserir preferencias', :ct001_preferencias do
    fill_in 'TempoRefreshForcaTrabalho', with: '1'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'Preferências editadas com sucesso'
  end

  it 'CT002 Validar insercao de campos obrigatórios em preferencias', :ct002_preferencias do
    fill_in 'Empresa_Codigo', with: ''

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div .field-validation-error')).to have_content 'O intervalo de tempo para atualização de Listagem Controle de Força de Trabalho é de 2 minutos'
  end
end

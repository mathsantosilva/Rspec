describe 'horario calculo', :horario_calculo do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr08012021@dimep.com'
    fill_in 'LogOnModel_Password', with: 'dimep123'
    click_button 'Entrar'

    visit '/admin/HorariosRegras'
    visit '/admin/HorariosRegras/Create'
  end

  it 'CT001 validar os itens do horario calculo', :ct001_horario_calculo do
    drop = find("input[type=button][value='Próximo']", match: :first)
    drop.click
  end

  it 'CT002 validar a inserção horario calculo', :ct002_horario_calculo do
    drop = find("input[type=button][value='Próximo']", match: :first)
    drop.click
    # não concluido
  end
end

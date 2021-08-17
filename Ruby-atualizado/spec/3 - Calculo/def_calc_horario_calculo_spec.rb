describe 'horario calculo', :horario_calculo do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/HorariosRegras'
    visit '/admin/HorariosRegras/Create'
  end

  it 'CT001 validar os itens do horario calculo', :ct001_horario_calculo do
    drop = find("input[type=button][value='Próximo']", match: :first)
    drop.click
    drop = find("input[type=button][value='Próximo']", match: :first)
    drop.click
    page.find(:xpath, '/html/body/div[1]/div[3]/div[6]/div[2]/div[2]/div[1]/div[3]/div').click # seleciona o horario
    page.find(:xpath, '/html/body/div[5]/div[2]/div[10]/span').click # clica em alterar
    drop = find("input[type=button][value='Próximo']", match: :first)
    drop.click
    drop = find("input[type=button][value='Próximo']", match: :first)
    drop.click

    fill_in 'HorarioCodigo', with: '1233'
    fill_in 'HorarioDescricao', with: 'testhorario'

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[class=field-summary-success]')).to have_content 'O Horário foi adicionado com sucesso'
  end

  it 'CT002 validar a inserção horario calculo', :ct002_horario_calculo do
    drop = find("input[type=button][value='Próximo']", match: :first)
    drop.click
    drop = find("input[type=button][value='Próximo']", match: :first)
    drop.click
    drop = find("input[type=button][value='Próximo']", match: :first)
    drop.click
    drop = find("input[type=button][value='Próximo']", match: :first)
    drop.click

    fill_in 'HorarioCodigo', with: ''
    fill_in 'HorarioDescricao', with: ''

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[class=field-validation-error]')).to have_content 'Por favor adicione uma descrição'
  end
end

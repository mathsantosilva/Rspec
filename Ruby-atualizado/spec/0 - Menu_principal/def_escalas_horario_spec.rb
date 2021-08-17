describe 'escalas de horario', :escalas do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    visit '/Dimep/EscalasHorario'
  end
  
  it 'CT001 Inserir uma nova escala', :ct001_escalas do
    fill_in 'userAutocomplete', with: '123'
    fill_in 'select_periodos', with: '10112020 - 15022021'

    drop = find("input[type=submit][value='Pesquisar Escalas de Horário']", match: :first)
    drop.click
  end

  it 'CT002 Validar insercao de campos obrigatórios de escalas de horario', :ct002_escalas do
    fill_in 'userAutocomplete', with: ''
    fill_in 'select_periodos', with: ''

    drop = find("input[type=submit][value='Pesquisar Escalas de Horário']", match: :first)
    drop.click

    expect(find('span[for=Summary-Field-Index]')).to have_content 'Data de Pesquisa Invalida'
  end
end

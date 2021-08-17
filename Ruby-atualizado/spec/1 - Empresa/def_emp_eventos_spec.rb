describe 'eventos', :eventos do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/Eventos'
    visit '/admin/Eventos/Create'
  end

  it 'CT001 Inserir um novo evento', :ct001_eventos do
    fill_in 'Evento_Codigo', with: '11'
    fill_in 'Evento_Descricao', with: 'Feriado'
    fill_in 'Evento_EventoFolha', with: '!#$()'
    fill_in 'Evento_Porcentagem', with: '10'
    select('Interjornada', from: 'Evento_Tipo_Id').select_option
    fill_in 'Evento_IdentificadorExportacao', with: '10'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click
    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Evento foi adicionado com sucesso'
  end

  it 'CT002 validar a existência dos campos', :ct002_eventos do
    fill_in 'Evento_Codigo', with: ''
    fill_in 'Evento_Descricao', with: ''
    fill_in 'Evento_EventoFolha', with: ''

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('span[for=Evento_Codigo]')).to have_content 'Por favor adicione um código'
    expect(find('span[for=Evento_Descricao]')).to have_content 'Por favor adicione uma descrição'
    expect(find('span[for=Evento_EventoFolha]')).to have_content 'Por favor adicione um evento folha'
  end

  it 'CT003 validar a existência do campo código', :ct003_eventos do
    fill_in 'Evento_Codigo', with: '11'
    fill_in 'Evento_Descricao', with: 'Não feriado'
    fill_in 'Evento_EventoFolha', with: 'abcs'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[class=field-validation-error]')).to have_content 'Já existe um Evento com o código inserido'
  end

  it 'CT004 validar a existência do campo descrição', :ct004_eventos do
    fill_in 'Evento_Codigo', with: '12	'
    fill_in 'Evento_Descricao', with: 'Feriado'
    fill_in 'Evento_EventoFolha', with: '$#¨!%'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[class=field-validation-error]')).to have_content 'Já existe um Evento com essa descrição'
  end
  
  it 'CT005 validar a exportação para folha', :ct005_eventos do
    fill_in 'Evento_Codigo', with: '13'
    fill_in 'Evento_Descricao', with: 'Feriado sim'
    fill_in 'Evento_EventoFolha', with: '¨#*&!'
    fill_in 'Evento_Porcentagem', with: '10'
    select('Interjornada', from: 'Evento_Tipo_Id').select_option
    fill_in 'Evento_IdentificadorExportacao', with: '10'
    find('label[for="CbExportarParaSalario"]', visible: false).set(true)

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click
sleep 3
    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Evento foi adicionado com sucesso'
  end
end

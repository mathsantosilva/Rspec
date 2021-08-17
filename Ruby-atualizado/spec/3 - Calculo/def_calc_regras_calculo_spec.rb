describe 'estrutura', :regras_calculo do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/RegrasCalculo'
    visit '/admin/RegrasCalculo/Create'
  end

  it 'CT001 Validar inserção de campos obrigatórios na justificativa', :ct001_regras_calculo do
    fill_in 'Codigo', with: '1273'
    fill_in 'Descricao', with: 'abfdsc'

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[class=field-summary-success]')).to have_content 'A Regra de cálculo foi criada com sucesso'
  end

  it 'CT002 valida a inserção dos campos nas regras de calculo', :ct002_regras_calculo do
    fill_in 'Codigo', with: ''
    fill_in 'Descricao', with: ''

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find("span[class=field-validation-error][data-valmsg-for='Codigo']")).to have_content 'Por favor adicione um código'
    expect(find("span[class=field-validation-error][data-valmsg-for='Descricao']")).to have_content 'Por favor adicione uma descrição'
  end

  it 'CT003 valida a inserção dos campos existente nas regras de calculo', :ct003_regras_calculo do
    fill_in 'Codigo', with: '123373'
    fill_in 'Descricao', with: 'abfdsc'

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div .field-validation-error')).to have_content  'Já existe uma Regra de cálculo com essa descrição'
  end
end

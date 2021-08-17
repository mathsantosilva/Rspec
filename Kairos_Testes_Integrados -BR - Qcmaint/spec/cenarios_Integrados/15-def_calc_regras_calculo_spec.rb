describe 'estrutura', :regras_calculo do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'migracao15042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/RegrasCalculo'
    visit '/admin/RegrasCalculo/Create'
  end

  it 'CT015 Inserir novas regras de calculo', :ct015_regras_calculo do
    fill_in 'Codigo', with: '127763'
    fill_in 'Descricao', with: 'azffsc'

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[class=field-summary-success]')).to have_content 'A Regra de cálculo foi criada com sucesso'
  end
end

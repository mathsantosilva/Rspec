describe 'tipos de afastamento', :tipos_afastamento do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/TiposAfastamento'
    visit '/admin/TiposAfastamento/Create'
  end
  
  it 'CT001 Inserir uma nova estrutura organizacional', :ct001_afastamento do
    fill_in 'TipoAfastamento_Codigo', with: '2397508'
    fill_in 'TipoAfastamento_Descricao', with: 'ih58()&)(¨)'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click
    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Tipo de Afastamento foi adicionado com sucesso'
  end
  
  it 'CT002 Validar inserção dos campos obrigatórios no tipos afastamento da empresa', :ct002_afastamento do
   
    fill_in 'TipoAfastamento_Codigo', with: ''
    fill_in 'TipoAfastamento_Descricao', with: ''

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click
    expect(find("span[class=field-validation-error][data-valmsg-for='TipoAfastamento.Codigo']")).to have_content 'Por favor adicione um código'
    expect(find('span[for=TipoAfastamento_Descricao]')).to have_content 'Por favor adicione uma descrição'
     end

  it 'CT003 Validar a existência de itens nos campos tipos afastamento da empresa', :ct003_afastamento do
   
    fill_in 'TipoAfastamento_Codigo', with: '2397508'
    fill_in 'TipoAfastamento_Descricao', with: 'ih58()&)(¨)'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click
    expect(find("div[class='field-validation-error']")).to have_content 'Já existe um tipo de afastamento com o código inserido'
  end
end

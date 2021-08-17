describe 'tipos de afastamento', :tipos_baixa do
  before(:each) do
    visit '/Dimep/Account/LogOn?timeOutLoginComo=False'

    fill_in 'LogOnModel_UserName', with: 'migracaopt16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/TiposAfastamento'
    visit '/admin/TiposAfastamento/Create'
  end

  it 'CT008 Inserir um novo tipo de afastamento', :ct008_tipos do
    fill_in 'TipoAfastamento_Codigo', with: '123'
    fill_in 'TipoAfastamento_Descricao', with: 'TESTE'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click
    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Tipo de Baixa foi criado com sucesso'
  end
end

describe 'tipos de afastamento', :tipos_afastamento do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'migracao15042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/TiposAfastamento'
    visit '/admin/TiposAfastamento/Create'
  end

  it 'CT008 Inserir um novo tipo de afastamento', :ct008_afastamento do
    fill_in 'TipoAfastamento_Codigo', with: '2397508'
    fill_in 'TipoAfastamento_Descricao', with: 'ih58()&)(¨)'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click
    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Tipo de Afastamento foi adicionado com sucesso'
  end
end

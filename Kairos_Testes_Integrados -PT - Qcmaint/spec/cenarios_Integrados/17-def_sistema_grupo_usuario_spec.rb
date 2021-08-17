describe 'Sistema grupos de usuarios', :usuario do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'migracao15042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/Usuarios'
    visit '/admin/GruposUsuarios'
  end

  it 'CT017 Inserir um novo grupo de usuário', :ct017_usuario do
    fill_in 'Grupo_Codigo', with: '1277453'
    fill_in 'Grupo_Descricao', with: 'abrb@!#543c'

    drop = find('.pointer', text: 'Adicionar', match: :first)
    drop.click
  end
end

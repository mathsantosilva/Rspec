describe 'Sistema grupos de usuarios', :usuario do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'
    
    fill_in 'LogOnModel_UserName', with: 'migracaopt16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/Usuarios'
    visit '/admin/GruposUsuarios'
  end

  it 'CT017 Inserir um novo grupo de usuário', :ct017_usuario do
    fill_in 'Grupo_Codigo', with: '3'
    fill_in 'Grupo_Descricao', with: 'abrb@d!#543c'

    drop = find('.pointer', text: 'Adicionar', match: :first)
    drop.click

        expect(find('div[class=field-summary-success]')).to have_content 'O Grupo foi criado com sucesso'

  end
end

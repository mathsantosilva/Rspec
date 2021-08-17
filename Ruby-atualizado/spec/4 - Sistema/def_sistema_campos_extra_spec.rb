describe 'guarda a estrutura organizacional', :campos do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/Usuarios'
    visit '/admin//Usuarios/Create'
  end

  it 'CT001 Inserir um novo status', :ct001_campos do
    fill_in 'Usuario_Nome', with: 'fdsph'
    select('597oih(&)(&_', from: 'Usuario_Funcionario_Id').select_option
    fill_in 'Usuario_Login', with: 'spriintbr110221@dimep.com'
    fill_in 'Usuario_Senha', with: 'dfn%@Yc'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[class=validation-summary-ok]')).to have_content 'O Usuário foi adicionado com sucesso'
  end
end
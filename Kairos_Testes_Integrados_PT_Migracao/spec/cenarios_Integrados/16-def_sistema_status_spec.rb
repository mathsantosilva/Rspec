describe 'status do usuario', :status do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'migracaopt16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/Usuarios'
    visit '/admin//Usuarios/Create'
  end

  it 'CT016 Inserir um novo status', :ct016_status do
    fill_in 'Usuario_Nome', with: 'TESTE'
    select('597oih(&)(&_', from: 'Usuario_Funcionario_Id').select_option
    fill_in 'Usuario_Login', with: 'teste6749@dimep.com.br'
    fill_in 'Usuario_Senha', with: '1'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Usuário foi criado com sucesso'
  end
end
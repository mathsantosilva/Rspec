describe 'status do usuario', :status do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr08012021@dimep.com'
    fill_in 'LogOnModel_Password', with: 'dimep123'
    click_button 'Entrar'
    visit '/Usuarios'
    visit '/Usuarios/Create'
  end

  it 'CT001 Inserir um novo usuário', :ct001_status do
    fill_in 'Usuario_Senha', with: '123'

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content ''
  end

  it 'CT002 Validar insercao de campos obrigatórios em novo usuário', :ct002_usuario do
    fill_in 'Usuario_Senha', with: '123'
    fill_in 'Usuario_Funcionario_Id', with: ''

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('span[for=Usuario_Senha]')).to have_content 'Por favor adicione uma senha'
    expect(find('span[for=Usuario_Funcionario_Id]')).to have_content 'É necessário selecionar o funcionário.'
  end
end

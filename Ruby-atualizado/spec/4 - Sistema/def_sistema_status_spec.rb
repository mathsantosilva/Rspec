describe 'status do usuario', :status do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    visit '/admin/Usuarios'
    visit '/admin/Usuarios/Create'
  end

  it 'CT001 Inserir um novo usuário', :ct001_status do
    fill_in 'Usuario_Nome', with: 'fsggh'
    select('pro', from: 'Usuario_Perfil_Id').select_option
    select('abfvsfc', from: 'Usuario.Funcionario.Id').select_option
    fill_in 'Usuario_Login', with: 'sprintbr081@dimep.com'
    fill_in 'Usuario_Senha', with: 'dfnab%@Yc'
    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click
sleep 5
    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Usuário foi adicionado com sucesso'
  end

  it 'CT002 Validar insercao de campos obrigatórios em status', :ct002_status do
    fill_in 'Usuario_Nome', with: ''
    fill_in 'Usuario_Login', with: ''
    fill_in 'Usuario_Senha', with: ''
    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click
     
    expect(find('div[id=Summary-Field-Index]')).to have_content 'Por favor adicione uma senha'
    expect(find('span[for="Usuario_Nome"]')).to have_content 'Por favor adicione um nome'
    expect(find('span[data-valmsg-for="Usuario.Login"]')).to have_content 'Por favor adicione um email válido.'
    end
end
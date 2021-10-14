describe 'status do usuario', :status do
  before(:each) do
    visit '/'

    #Aceitando os cookies
    find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
    sleep 2 

    fill_in 'LogOnModel_UserName', with: $user_br
    fill_in 'LogOnModel_Password', with: $senha
    click_button 'Entrar'

    # Acessando o cadastro de Usuário pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 2
    find('div[class="pointer DropDownHeaderElement"]', text: 'Sistema').click



  end

  it 'CT016 Inserir um novo status', :ct016_status do
    find('label[class="pointer"]', text: 'Novo Usuário').click
    fill_in 'Usuario_Nome', with: 'fggh'
    select('pro', from: 'Usuario_Perfil_Id').select_option
    select('FUNCIONARIO 1001', from: 'Usuario_Funcionario_Id').select_option
    fill_in 'Usuario_Login', with: 'sprintbr08221@dimep.com'
    fill_in 'Usuario_Senha', with: 'dfnab%@Yc'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Usuário foi adicionado com sucesso'
  end
end

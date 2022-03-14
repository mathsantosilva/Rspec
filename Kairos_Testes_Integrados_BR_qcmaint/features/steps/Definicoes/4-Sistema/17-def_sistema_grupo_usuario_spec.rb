describe 'Sistema grupos de usuarios', :usuarios do
  before(:each) do
    visit '/'

    #Aceitando os cookies
    find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
    sleep 2

    fill_in 'LogOnModel_UserName', with: $user_br
    fill_in 'LogOnModel_Password', with: $senha
    click_button 'Entrar'

    # Acessando o cadastro de Grupo de Usuário pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 2
    find('div[class="pointer DropDownHeaderElement"]', text: 'Sistema').click
    find('div[id="MenuGruposUsuarios"]').click
  end

  it 'CT017 Inserir um novo grupo de usuário', :ct017_usuario do
    fill_in 'Grupo_Codigo', with: '1277453'
    fill_in 'Grupo_Descricao', with: 'abrb@!#543c'

    drop = find('.pointer', text: 'Adicionar', match: :first)
    drop.click
  end
end

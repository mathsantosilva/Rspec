describe 'perfis do sistema', :perfil do
  before(:each) do
    visit '/'

    #Aceitando os cookies
    find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
    sleep 2 

    fill_in 'LogOnModel_UserName', with: $user_br
    fill_in 'LogOnModel_Password', with: $senha
    click_button 'Entrar'

    # Acessando o cadastro de Perfil pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 2

    find('div[class="pointer DropDownHeaderElement"]', text: 'Sistema').click
    find('div[id="MenuPerfis"]').click
  end

  it 'CT018 Inserir um novo perfil', :ct018_perfil do

    find('label[class="pointer"]', text: 'Novo Perfil').click    
    fill_in 'Perfil_Descricao', with: 'teste'
    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Perfil foi adicionado com sucesso'
  end
end

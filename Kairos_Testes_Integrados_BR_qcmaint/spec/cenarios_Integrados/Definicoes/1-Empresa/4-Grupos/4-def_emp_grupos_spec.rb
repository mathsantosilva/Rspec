describe 'grupos', :grupos do

  before(:each) do
    visit '/'
    sleep 2

    #Aceitando os cookies
    find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
    sleep 2
    
    fill_in 'LogOnModel_UserName', with: $user_br
    fill_in 'LogOnModel_Password', with: $senha
    click_button 'Entrar'
    
    # Acessando o cadastro grupos pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 3
    
    find('div[class="pointer DropDownHeaderElement"]', text: 'Empresa').click
    find('div[id="MenuGrupos"]').click

  end

  it 'CT004 Inserir um novo grupo', :ct004_grupos do
    fill_in 'Grupo_Codigo', with: '1231231'
    fill_in 'Grupo_Descricao', with: 'abca'

    drop = find('.pointer', text: 'Adicionar', match: :first) # precisa manter o match para identificar o botão
    drop.click

    expect(find('form[id=FormGrupos]')).to have_content 'O Grupo foi adicionado com sucesso'
  end
end

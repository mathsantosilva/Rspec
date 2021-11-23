describe 'tipos de afastamento', :tipos_afastamento do
  before(:each) do
    visit '/'
    #Aceitando os cookies
    find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
    sleep 2 

    fill_in 'LogOnModel_UserName', with: $user_br
    fill_in 'LogOnModel_Password', with: $senha
    click_button 'Entrar'

    # Acessando o cadastro de tipo de afastamento pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 3

    find('div[class="pointer DropDownHeaderElement"]', text: 'Empresa').click
    find('div[id="MenuTiposAfastamento"]').click
   
    #Abrir criação de novo tipo de afastamento
    find('label[class="pointer"]', text: 'Novo Tipo de Afastamento').click
  
  end

  it 'CT008 Inserir um novo tipo de afastamento', :ct008_afastamento do
    fill_in 'TipoAfastamento_Codigo', with: '2397508'
    fill_in 'TipoAfastamento_Descricao', with: 'ih58()&)(¨)'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click
    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Tipo de Afastamento foi adicionado com sucesso'
  end
end

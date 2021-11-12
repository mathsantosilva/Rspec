require 'common\common'
common = Common.new

describe 'Cargos', :cargo_create do
  before(:each) do
    visit '/'
    expect(page.title).to eql 'kairos'

    #Realiza login
    common.logon_br
    # Acessando a empresa pela navegação de telas
    common.nav('Empresa', 'div[id="MenuEmpresas"]')
 
    #Aceitando os cookies
    find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click   
    fill_in 'LogOnModel_UserName', with: $user_br
    fill_in 'LogOnModel_Password', with: $senha
    click_button 'Entrar'
    # Acessando o cadastro cargos pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    find('div[class="pointer DropDownHeaderElement"]', text: 'Empresa').click
    find('div[id="MenuCargos"]').click

  end

  it 'Inserir um novo cargo', :cargo_create_1 do
    fill_in 'Cargo_Codigo', with: '123174231'
    fill_in 'Cargo_Descricao', with: 'abcgdga'

    drop = find('.pointer', text: 'Adicionar', match: :first) # precisa manter o match para identificar o botão
    drop.click

    expect(find('form[id=FormCargos]')).to have_content 'O Cargo foi adicionado com sucesso'
  end
end

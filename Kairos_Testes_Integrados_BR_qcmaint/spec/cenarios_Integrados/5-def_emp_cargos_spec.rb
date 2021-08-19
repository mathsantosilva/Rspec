describe 'Cargos', :cargos do
  before(:each) do
    visit '/'
    sleep 2

    #Aceitando os cookies
    find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
    sleep 2    

    fill_in 'LogOnModel_UserName', with: @login
    fill_in 'LogOnModel_Password', with: @senha
    click_button 'Entrar'
    
    # Acessando o cadastro cargos pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 3
    
    find('div[class="pointer DropDownHeaderElement"]', text: 'Empresa').click
    find('div[id="MenuCargos"]').click

  end

  it 'CT005 Inserir um novo cargo', :ct005_cargo do
    fill_in 'Cargo_Codigo', with: '123174231'
    fill_in 'Cargo_Descricao', with: 'abcgdga'

    drop = find('.pointer', text: 'Adicionar', match: :first) # precisa manter o match para identificar o botão
    drop.click

    expect(find('form[id=FormCargos]')).to have_content 'O Cargo foi adicionado com sucesso'
  end
end

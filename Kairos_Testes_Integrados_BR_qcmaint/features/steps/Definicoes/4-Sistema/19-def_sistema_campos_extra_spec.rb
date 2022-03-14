describe 'Cadastrar campos extra de estrutura organizacional e cargo', :campos do
  before(:each) do
    visit '/'

    #Aceitando os cookies
    find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
    sleep 2 

    fill_in 'LogOnModel_UserName', with: $user_br
    fill_in 'LogOnModel_Password', with: $senha
    click_button 'Entrar'
    
    # Acessando o cadastro de Campos extra pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 2

    find('div[class="pointer DropDownHeaderElement"]', text: 'Sistema').click
    find('div[id="MenuCamposExtra"]').click
    
  end

  it 'CT019 Inserir novos campos extras de estruturas', :ct019_campos do
    
    #Adicionando campos extra de estrutura
    find('label[for="Campo1"]', visible: false).set(true)
    fill_in 'LabelCampo1', with: '11'
    find('label[for="Campo2"]', visible: false).set(true)
    fill_in 'LabelCampo2', with: 'aa'

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click
    expect(find('div[id=Summary-Field-Index]')).to have_content 'Campos extra da estrutura organizacional guardados com sucesso.'

    #Adicionando campos extra de cargo
    find('span[id="TabCargo"]', text: 'Cargo').click
    find('label[for="CargoCampo1"]', visible: false ).set(true)
    fill_in 'CargoLabelCampo1', with: '22'
    find('label[for="CargoCampo2"]', visible: false).set(true)
    fill_in 'CargoLabelCampo2', with: 'bb'    

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click
    expect(find('div[id=Summary-Field-Index]')).to have_content 'Campos extra do cargo guardados com sucesso.'
  
  end
end

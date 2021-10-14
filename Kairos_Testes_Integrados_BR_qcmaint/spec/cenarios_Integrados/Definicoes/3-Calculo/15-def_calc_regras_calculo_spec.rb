describe 'estrutura', :regras_calculo do
  before(:each) do
    visit '/'

    #Aceitando os cookies
    find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
    sleep 2 

    fill_in 'LogOnModel_UserName', with: $user_br
    fill_in 'LogOnModel_Password', with: $senha
    click_button 'Entrar'

    # Acessando o cadastro de Horário pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 2
    find('div[class="pointer DropDownHeaderElement"]', text: 'Cálculo').click

    #Fechar janela de ajuda
    sleep 2
    find('div[aria-label= "Fechar diálogo"]').click

    find('div[id="MenuRegrasCalculo"]').click
  end

  it 'CT015 Inserir novas regras de calculo', :ct015_regras_calculo do
    find('label[class="pointer"]', text: 'Nova Regra').click
    fill_in 'Codigo', with: '127763'
    fill_in 'Descricao', with: 'azffsc'

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[class=field-summary-success]')).to have_content 'A Regra de cálculo foi criada com sucesso'
  end
end

describe 'regras', :regras do
  before(:each) do
    visit '/'
    #Aceitando os cookies
    find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
    sleep 2 

    fill_in 'LogOnModel_UserName', with: $user_br
    fill_in 'LogOnModel_Password', with: $senha
    click_button 'Entrar'

    # Acessando o cadastro de Regra de aprovação pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 3

    find('div[class="pointer DropDownHeaderElement"]', text: 'Empresa').click
    find('div[id="MenuRegrasAprovacao"]').click
   
    #Abrir criação de nova Regra de aprovação
    find('label[class="pointer"]', text: 'Nova Regra').click
 
  end

  it 'CT009 Inserir uma nova regra', :ct009_regras do
    fill_in 'Regra_Codigo', with: '12387125'
    fill_in 'Regra_Nome', with: '&)(&@$dagfsb123'
    fill_in 'Regra_NumDiasLimite', with: '10'
    find('span[id="1"]', visible: false).set(true)

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[class=validation-summary-ok]')).to have_content 'A Regra foi criada com sucesso'
  end
end

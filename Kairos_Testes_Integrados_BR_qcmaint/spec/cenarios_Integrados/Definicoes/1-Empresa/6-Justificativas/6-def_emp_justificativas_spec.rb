describe 'justificativas', :justificativas do
  before(:each) do
    visit '/'
    sleep 2

    #Aceitando os cookies
    find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
    sleep 2 

    fill_in 'LogOnModel_UserName', with: $user_br
    fill_in 'LogOnModel_Password', with: $senha
    click_button 'Entrar'

    # Acessando o cadastro justificativas pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 3

    find('div[class="pointer DropDownHeaderElement"]', text: 'Empresa').click
    find('div[id="MenuJustificativas"]').click

    #Abrir criação de nova justificativa
    find('label[class="pointer"]', text: 'Nova Justificativa').click
    

  end

  it 'CT006 Inserir uma nova justificatica', :ct006_justificativas do
    fill_in 'Justificativa_Codigo', with: '123'
    fill_in 'Justificativa_Descricao', with: 'abc'
    select('Rendimento', from: 'Justificativa_Tipo_Id').select_option
    find('label[for="EnviaBancoHoraManual_true"]', visible: false).set(true)
    select('Rendimento', from: 'Justificativa_Tipo_Id').select_option

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Justificativa foi criada com sucesso'
  end
end

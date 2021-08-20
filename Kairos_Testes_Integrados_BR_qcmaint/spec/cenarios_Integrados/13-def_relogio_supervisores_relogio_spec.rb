describe 'supervisores de relogio', :supervisor_relogio do
  before(:each) do
    visit '/'

    #Aceitando os cookies
    find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
    sleep 2 

    fill_in 'LogOnModel_UserName', with: @login
    fill_in 'LogOnModel_Password', with: @senha
    click_button 'Entrar'

    # Acessando o cadastro de Supervisor de Relógio pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 3
    find('div[class="pointer DropDownHeaderElement"]', text: 'Relógios').click
    find('div[id="MenuSupervisorRelogios"]').click
    
    #Abrir criação de novo Supervisor de Relógio
    find('label[class="pointer"]', text: 'Novo Supervisor de Relógio').click

  end

  it 'CT013 Inserir novos campos supervisor relogio', :ct013_supervisor do
    fill_in 'SupervisorRelogios_Codigo', with: '1243243'
    fill_in 'SupervisorRelogios_Nome', with: 'a*&*(¨%67hfd4cdz'
    fill_in 'supervisorRelogioPis', with: '12030759513'
    fill_in 'SupervisorRelogios_Senha', with: '1223412'
    fill_in 'SupervisorRelogios_SenhaConfirm', with: '1223412'
    fill_in 'SupervisorRelogios_Cpf', with: '02098864710'
    find('label[for="SupervisorRelogios_ColetaPenDiquete"]', visible: false).set(true)
    find('label[for="SupervisorRelogios_ProgramacaoDataHora"]', visible: false).set(true)
    find('label[for="SupervisorRelogios_NivelTecnico"]', visible: false).set(true)
    find('label[for="SupervisorRelogios_AlterarBobina"]', visible: false).set(true)

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[class=field-summary-success')).to have_content 'O Supervisor de Relógio foi adicionado com sucesso'
  end
end

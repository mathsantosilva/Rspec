describe 'supervisores de relogio', :supervisor_relogio do
  before(:each) do
    visit '/'

    #Aceitando os cookies
    find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
    sleep 2 

    fill_in 'LogOnModel_UserName', with: $user_br
    fill_in 'LogOnModel_Password', with: $senha
    click_button 'Entrar'

    # Acessando o cadastro de Supervisor de Relógio pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 3
    find('div[class="pointer DropDownHeaderElement"]', text: 'Relógios').click
    find('div[id="MenuSupervisorRelogios"]').click
    

  end

  it 'CT013 Inserir novos campos supervisor relogio', :ct013_supervisor do
    
    #Abrir criação de Primeiro Supervisor de Relógio
    find('label[class="pointer"]', text: 'Novo Supervisor de Relógio').click
    fill_in 'SupervisorRelogios_Codigo', with: '1'
    fill_in 'SupervisorRelogios_Nome', with: '1'
    fill_in 'supervisorRelogioPis', with: '12030759513'
    fill_in 'SupervisorRelogios_Senha', with: '1'
    fill_in 'SupervisorRelogios_SenhaConfirm', with: '1'
    fill_in 'SupervisorRelogios_Cpf', with: '02098864710'
    find('label[for="SupervisorRelogios_ColetaPenDiquete"]', visible: false).set(true)
    find('label[for="SupervisorRelogios_ProgramacaoDataHora"]', visible: false).set(true)
    find('label[for="SupervisorRelogios_NivelTecnico"]', visible: false).set(true)
    find('label[for="SupervisorRelogios_AlterarBobina"]', visible: false).set(true)
    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click
    
    #Abrir criação de Segundo Supervisor de Relógio
    find('label[class="pointer"]', text: 'Novo Supervisor de Relógio').click
    fill_in 'SupervisorRelogios_Codigo', with: '2'
    fill_in 'SupervisorRelogios_Nome', with: '2'
    fill_in 'supervisorRelogioPis', with: '12036382624'
    fill_in 'SupervisorRelogios_Senha', with: '2'
    fill_in 'SupervisorRelogios_SenhaConfirm', with: '2'
    fill_in 'SupervisorRelogios_Cpf', with: '74359853092'
    find('label[for="SupervisorRelogios_ColetaPenDiquete"]', visible: false).set(true)
    find('label[for="SupervisorRelogios_ProgramacaoDataHora"]', visible: false).set(true)
    find('label[for="SupervisorRelogios_NivelTecnico"]', visible: false).set(true)
    find('label[for="SupervisorRelogios_AlterarBobina"]', visible: false).set(true)
    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click
    
    #Abrir criação de Terceiro Supervisor de Relógio
    find('label[class="pointer"]', text: 'Novo Supervisor de Relógio').click
    fill_in 'SupervisorRelogios_Codigo', with: '3'
    fill_in 'SupervisorRelogios_Nome', with: '3'
    fill_in 'supervisorRelogioPis', with: '12066632645'
    fill_in 'SupervisorRelogios_Senha', with: '3'
    fill_in 'SupervisorRelogios_SenhaConfirm', with: '3'
    fill_in 'SupervisorRelogios_Cpf', with: '94115447460'
    find('label[for="SupervisorRelogios_ColetaPenDiquete"]', visible: false).set(true)
    find('label[for="SupervisorRelogios_ProgramacaoDataHora"]', visible: false).set(true)
    find('label[for="SupervisorRelogios_NivelTecnico"]', visible: false).set(true)
    find('label[for="SupervisorRelogios_AlterarBobina"]', visible: false).set(true)
    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click
    
    #Abrir criação de Quarto Supervisor de Relógio
    find('label[class="pointer"]', text: 'Novo Supervisor de Relógio').click
    fill_in 'SupervisorRelogios_Codigo', with: '4'
    fill_in 'SupervisorRelogios_Nome', with: '4'
    fill_in 'supervisorRelogioPis', with: '12083817020'
    fill_in 'SupervisorRelogios_Senha', with: '4'
    fill_in 'SupervisorRelogios_SenhaConfirm', with: '4'
    fill_in 'SupervisorRelogios_Cpf', with: '35207458795'
    find('label[for="SupervisorRelogios_ColetaPenDiquete"]', visible: false).set(true)
    find('label[for="SupervisorRelogios_ProgramacaoDataHora"]', visible: false).set(true)
    find('label[for="SupervisorRelogios_NivelTecnico"]', visible: false).set(true)
    find('label[for="SupervisorRelogios_AlterarBobina"]', visible: false).set(true)
    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click
    
    #Abrir criação de Quinto Supervisor de Relógio
    find('label[class="pointer"]', text: 'Novo Supervisor de Relógio').click
    fill_in 'SupervisorRelogios_Codigo', with: '5'
    fill_in 'SupervisorRelogios_Nome', with: '5'
    fill_in 'supervisorRelogioPis', with: '12052556070'
    fill_in 'SupervisorRelogios_Senha', with: '5'
    fill_in 'SupervisorRelogios_SenhaConfirm', with: '5'
    fill_in 'SupervisorRelogios_Cpf', with: '11007256109'
    find('label[for="SupervisorRelogios_ColetaPenDiquete"]', visible: false).set(true)
    find('label[for="SupervisorRelogios_ProgramacaoDataHora"]', visible: false).set(true)
    find('label[for="SupervisorRelogios_NivelTecnico"]', visible: false).set(true)
    find('label[for="SupervisorRelogios_AlterarBobina"]', visible: false).set(true)
    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[class=field-summary-success')).to have_content 'O Supervisor de Relógio foi adicionado com sucesso'
  end
end

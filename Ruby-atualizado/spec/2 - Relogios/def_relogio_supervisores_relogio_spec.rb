describe 'supervisores de relogio', :supervisor_relogio do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/SupervisorRelogio'
    visit '/admin/SupervisorRelogio/Add'

  end

it 'CT001 valida os campos supervisor relógio', :ct001_supervisor do

    fill_in 'SupervisorRelogios_Codigo', with: '123'
    fill_in 'SupervisorRelogios_Nome', with: 'a*&*(¨%674cdz'
    fill_in 'supervisorRelogioPis', with: '12044753547'
    fill_in 'SupervisorRelogios_Senha', with: '123123412312'
    fill_in 'SupervisorRelogios_SenhaConfirm', with: '123123412312'
    fill_in 'SupervisorRelogios_Cpf', with: '02098864710'
    find('label[for="SupervisorRelogios_ColetaPenDiquete"]', :visible=>false).set(true) 
    find('label[for="SupervisorRelogios_ProgramacaoDataHora"]', :visible=>false).set(true) 
    find('label[for="SupervisorRelogios_NivelTecnico"]', :visible=>false).set(true) 
    find('label[for="SupervisorRelogios_AlterarBobina"]', :visible=>false).set(true) 

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[class=field-summary-success')).to have_content 'O Supervisor de Relógio foi adicionado com sucesso'
  end

  it 'CT002 valida a inserção dos campos supervisor relógio', :ct002_supervisor do
    
    fill_in 'SupervisorRelogios_Codigo', with: ''
    fill_in 'SupervisorRelogios_Nome', with: ''
    fill_in 'supervisorRelogioPis', with: ''
    fill_in 'SupervisorRelogios_Senha', with: ''
    fill_in 'SupervisorRelogios_SenhaConfirm', with: ''

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('span[for=SupervisorRelogios_Codigo]')).to have_content 'Por favor adicione um código'
    expect(find('span[for=SupervisorRelogios_Nome]')).to have_content 'Por favor adicione um nome'
    expect(find('span[data-valmsg-for="SupervisorRelogios.Pis"]')).to have_content 'Por favor adicione um PIS'
    expect(find('span[data-valmsg-for="SupervisorRelogios.Senha"]')).to have_content 'Por favor adicione uma senha'
   end

   it 'CT003  Validar a existência de itens no campo', :ct003_supervisor do
    
    fill_in 'SupervisorRelogios_Codigo', with: '123'
    fill_in 'SupervisorRelogios_Nome', with: 'djoa*¨6467*&('
    fill_in 'supervisorRelogioPis', with: '12017133576'
    fill_in 'SupervisorRelogios_Senha', with: '123!'
    fill_in 'SupervisorRelogios_SenhaConfirm', with: '123!'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[class="field-validation-error"]')).to have_content 'Já existe um Supervisor de Relógio com o código inserido'
   end
end
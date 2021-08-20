describe 'supervisores de relogio', :supervisor_relogio do
  before(:each) do
    visit '/Dimep/Account/LogOn?timeOutLoginComo=False'

    fill_in 'LogOnModel_UserName', with: 'migracaopt16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/SupervisorRelogio'
    visit '/admin/SupervisorRelogio/Add'
  end

  it 'CT013 Inserir novos campos supervisor relogio', :ct013_supervisor do
    fill_in 'SupervisorRelogios_Codigo', with: '1'
    fill_in 'SupervisorRelogios_Nome', with: 'a*&*(¨%67hfd4cdz'
    fill_in 'supervisorRelogioPis', with: '12030759513'
    fill_in 'SupervisorRelogios_Senha', with: '1!Aa'
    fill_in 'SupervisorRelogios_SenhaConfirm', with: '1!Aa'
    find('label[for="SupervisorRelogios_ColetaPenDiquete"]', visible: false).set(true)
    find('label[for="SupervisorRelogios_ProgramacaoDataHora"]', visible: false).set(true)
    find('label[for="SupervisorRelogios_NivelTecnico"]', visible: false).set(true)
  
    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[class=field-summary-success')).to have_content 'O Supervisor de Relógio foi criado com sucesso'
  end
end

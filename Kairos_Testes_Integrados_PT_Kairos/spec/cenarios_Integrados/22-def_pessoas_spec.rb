describe 'cadastrar novas pesssoas', :pessoas do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'teste24052021@teste.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    
    visit '/admin/Pessoas/Create'
  end

  it 'CT022 Inserir uma nova pessoa', :ct022_pessoas do
    fill_in 'CreateModel_Nome', with: 'srtafvae'
    fill_in 'CreateModel_Pis', with: '12049375389'
    fill_in 'CreateModel_Matricula', with: '2103'
    fill_in 'CreateModel_Cracha', with: '1008543'
  #  drop = find("div[id='CreateModel_EstruturaCodigo_chzn']")
  #  drop.click

  #  page.find(:xpath, '/html/body/div[1]/form/div[2]/div/div[25]/div[2]/div/div/ul/li[2]').click 
   sleep 10
    page.find(:xpath, '//*[@id="CreateModel_EstruturaCodigo_chzn"]').click
    sleep 10
     find(:xpath, '//*[@id="CreateModel_EstruturaCodigo_chzn_o_1"]').click

    page.find(:xpath, '//*[@id="CreateModel_GrupoCodigo_chzn"]').click
    find(:xpath, '//*[@id="CreateModel_GrupoCodigo_chzn_o_1"]').click

    page.find(:xpath, '//*[@id="CreateModel_CargoCodigo_chzn"]').click
    find(:xpath, '//*[@id="CreateModel_CargoCodigo_chzn_o_1"]').click

    page.find(:xpath, '//*[@id="CreateModel_HorarioId_chzn"]').click
    find(:xpath, '//*[@id="CreateModel_HorarioId_chzn_o_1"]').click

    page.find(:xpath, '//*[@id="CreateModel_RegraCalculoCodigo_chzn"]').click
    find(:xpath, '//*[@id="CreateModel_RegraCalculoCodigo_chzn_o_1"]').click

    fill_in 'CreateModel_BaseHoras', with: '113'
    select('Estagiário', from: 'CreateModel_TipoFuncionarioCodigo').select_option
    fill_in 'CreateModel_NomeEmpresa', with: 'eqdawv'
    fill_in 'CreateModel_TelefoneEmpresa', with: '1236363'
    fill_in 'CreateModel_ContatoEmpresa', with: 'Principal'
    sleep 5

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[class=validation-summary-ok]')).to have_content 'Pessoa cadastrada com sucesso.'
  end
end
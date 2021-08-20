describe 'empresas', :empresas do
  before(:each) do
    visit '/Dimep/Account/LogOn?timeOutLoginComo=False'
  
    fill_in 'LogOnModel_UserName', with: 'teste24052021@teste.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    visit '/admin/Empresas'
    visit '/admin/Empresas/Create'
  end

  it 'CT001 Inserir uma nova empresa', :ct001_empresas do
    fill_in 'Empresa_Codigo', with: '261'
    fill_in 'Empresa_Telefone', with: '11'
    fill_in 'Empresa_RazaoSocial', with: 'SPRINT56PT - 4'
    fill_in 'Empresa_CnpjCpf', with: '51855335000122'
    select('INDÚSTRIAS EXTRATIVAS', from: 'Empresa_RamoAtividade_Id').select_option
    fill_in 'Empresa_Endereco', with: 'TESTE'
    fill_in 'Empresa_Bairro', with: 'TESTE'
    fill_in 'Empresa_Cidade', with: 'PORTO'
    fill_in 'Empresa_Pais', with: 'PORTGUAL'
    fill_in 'Empresa_URL', with: 'https://www.dimepkairos.com.pt/Dimep/Account/LogOn?ReturnUrl=%2F'
    fill_in 'Empresa_Email', with: 'kairos@kairos.com'
    fill_in 'Empresa_DataAbertura', with: '10032021'
    select('UTC - 12', from: 'Empresa_FusoHorario_Id').select_option
    find('label[for="checkHabilitaHorarioVerao"]', visible: false).set(true)
    fill_in 'Empresa_InicioHorarioVerao', with: '10052021'
    fill_in 'Empresa_FimHorarioVerao', with: '10062021'
    fill_in 'Empresa_DataPrevisaoProximoFechamento', with: '10062021'
    fill_in 'Empresa_DataLimiteTratamentoPonto', with: '10082021'
    fill_in 'connectChave_ChaveConnect', with: '65464577dsfASI'
    # fill_in 'Empresa_ChaveComprovantePonto', with: 'EC56E55F-CD28-419A-A405-E8FCBABB18C5'
    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click
  
    expect(find('div[class=validation-summary-ok]')).to have_content 'A Empresa foi criada com sucesso'
   end  
  end

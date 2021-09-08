describe 'empresa', :empresa_resource do
  before(:each) do
    visit '/'
    expect(page.title).to eql 'kairos'

    fill_in 'LogOnModel_UserName', with: @login
    fill_in 'LogOnModel_Password', with: @senha
    click_button 'Entrar'
    # Acessando a empresa pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 3
    find('div[class="pointer DropDownHeaderElement"]', text: 'Empresa').click
    find('div[id="MenuEmpresas"]').click
    find('label[class="pointer"]').click
    

    # Acessar a empresa direto pela URL
    # visit '/admin/Empresas'
    # visit '/admin/Empresas/Create'
  end

  it 'CT001 Inserir uma nova empresa', :ct001_empresa do
    fill_in 'Empresa_Codigo', with: '21438506'
    fill_in 'Empresa_CEI', with: '233257875388'
    fill_in 'Empresa_Telefone', with: '999999999'
    find('label[for="CbUtilizaPortaria"]', visible: true)
    fill_in 'Empresa_RazaoSocial', with: 'Empresa Nova'
    fill_in 'Empresa_CnpjCpf', with: @cnpj_cpf
    select('INDÚSTRIAS EXTRATIVAS', from: 'Empresa_RamoAtividade_Id').select_option
    fill_in 'Empresa_Endereco', with: 'rua abcd'
    fill_in 'Empresa_Bairro', with: 'abcd'
    fill_in 'Empresa_Cidade', with: 'abcd'
    fill_in 'Empresa_UF', with: 'SP'
    fill_in 'Empresa_Pais', with: 'Brasil'
    fill_in 'Empresa_URL', with: 'https://www.dimepkairos.com.br/Dimep/Account/LogOn?ReturnUrl=%2F'
    fill_in 'Empresa_Email', with: 'kairos@kairos.com'
    fill_in 'Empresa_DataAbertura', with: '10112020'
    select('UTC - 12', from: 'Empresa_FusoHorario_Id').select_option
    find('label[for="checkHabilitaHorarioVerao"]', visible: false).set(true)
    fill_in 'Empresa_InicioHorarioVerao', with: '10032021'
    fill_in 'Empresa_FimHorarioVerao', with: '10052021'
    fill_in 'Empresa_DataPrevisaoProximoFechamento', with: '10052021'
    fill_in 'Empresa_DataLimiteTratamentoPonto', with: '10072021'
    fill_in 'connectChave_ChaveConnect', with: 'S123ab&*(#$'
    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Empresa foi criada com sucesso'
   end  
  end

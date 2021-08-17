describe 'empresa', :empresa do
   before(:each) do
    visit 'http://qcdev.dimepkairos.com.br/admin/Account/LogOn?ReturnUrl=%2Fadmin%2FFormatosArquivoColetaApontamentos%2FEditUsuario'
    expect(page.title).to eql 'kairos'

    fill_in 'LogOnModel_UserName', with: 'sprintbr08012021@dimep.com'
    fill_in 'LogOnModel_Password', with: 'dimep123'
    click_button 'Entrar'
    visit '/admin/Empresas'
    visit '/admin/Empresas/Create'
  end

  it 'CT001 Inserir uma nova empresa', :ct001_empresa do
    fill_in 'Empresa_Codigo', with: '1634633'
    fill_in 'Empresa_CEI', with: '212990553782'
    fill_in 'Empresa_Telefone', with: '999999999'
    find('label[for="CbUtilizaPortaria"]', :visible=>true) 
    fill_in 'Empresa_RazaoSocial', with: 'IUUbc123$%*()<>,.'
    fill_in 'Empresa_CnpjCpf', with: '37715914000149'
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
    find('label[for="checkHabilitaHorarioVerao"]', :visible=>false).set(true)    
    fill_in 'Empresa_DataPrevisaoProximoFechamento', with: '10022021'
    fill_in 'Empresa_DataLimiteTratamentoPonto', with: '10032021'
    fill_in 'connectChave_ChaveConnect', with: 'S123ab&*(#$'
    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click
   
    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Empresa foi criada com sucesso'
  end

  it 'CT002 Validar insercao de campos obrigatórios no cadastro de empresa', :ct002_empresa do
    fill_in 'Empresa_Codigo', with: ''
    fill_in 'Empresa_CEI', with: ''
    fill_in 'Empresa_Telefone', with: ''
    fill_in 'Empresa_RazaoSocial', with: ''
    fill_in 'Empresa_CnpjCpf', with: ''
    fill_in 'Empresa_Endereco', with: ''
    fill_in 'Empresa_Bairro', with: ''
    fill_in 'Empresa_Cidade', with: ''
    fill_in 'Empresa_UF', with: ''
    fill_in 'Empresa_Pais', with: ''
    fill_in 'Empresa_DataAbertura', with: ''

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('span[for=Empresa_Codigo]')).to have_content 'Por favor adicione um código'
    expect(find('span[for=Empresa_Telefone]')).to have_content 'Por favor introduza um telefone'
    expect(find('span[for=Empresa_RazaoSocial]')).to have_content 'Por favor introduza uma razão social'
    expect(find('span[for=Empresa_CnpjCpf]')).to have_content 'Por favor introduza um CNPJ/CPF'
    expect(find('span[for=Empresa_Endereco]')).to have_content 'Por favor introduza um endereço'
    expect(find('span[for=Empresa_Cidade]')).to have_content 'Por favor introduza uma cidade'
    expect(find('span[for=Empresa_DataAbertura]')).to have_content 'Por favor introduza o dia de abertura do período.'
    expect(find('span[for=Empresa_Bairro]')).to have_content 'Por favor introduza um bairro'
    expect(find('span[for=Empresa_UF]')).to have_content 'Por favor introduza um UF'
  end

  it 'CT003 Validar insercao de empresa com código existente', :ct003_empresa do
    fill_in 'Empresa_Codigo', with: '12333'
    fill_in 'Empresa_CEI', with: '212990553782'
    fill_in 'Empresa_Telefone', with: '999999999'
    find('label[for="CbUtilizaPortaria"]', :visible=>true)  
    fill_in 'Empresa_RazaoSocial', with: 'OAabc1237$%*()<>,.'
    fill_in 'Empresa_CnpjCpf', with: '42662179000192'
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
    find('label[for="checkHabilitaHorarioVerao"]', :visible=>false).set(true) 
    fill_in 'Empresa_InicioHorarioVerao', with: '10022021'
    fill_in 'Empresa_FimHorarioVerao', with: '10032021'
    fill_in 'Empresa_DataPrevisaoProximoFechamento', with: '10022021'
    fill_in 'Empresa_DataLimiteTratamentoPonto', with: '10032021'
    fill_in 'connectChave_ChaveConnect', with: 'S123ab&*(#$'
    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div .field-validation-error')).to have_content 'Já existe uma Empresa com o código inserido'    
  end

  it 'CT004 Validar insercao de empresa com CNPJ existente', :ct004_empresa do
    fill_in 'Empresa_Codigo', with: '12333'
    fill_in 'Empresa_CEI', with: '212990553782'
    fill_in 'Empresa_Telefone', with: '999999999'
    find('label[for="CbUtilizaPortaria"]', :visible=>true)
    fill_in 'Empresa_RazaoSocial', with: 'Ababc123$%*()<>,.'
    fill_in 'Empresa_CnpjCpf', with: '47144341000102'
    select('INDÚSTRIAS EXTRATIVAS', from: 'Empresa_RamoAtividade_Id').select_option
    fill_in 'Empresa_Endereco', with: 'rua abcd'
    fill_in 'Empresa_Bairro', with: 'abcd'
    fill_in 'Empresa_Cidade', with: 'abcd'
    fill_in 'Empresa_UF', with: 'SP'
    fill_in 'Empresa_Pais', with: 'Brasil'
    fill_in 'Empresa_URL', with: 'https://www.dimepkairos.com.br/Dimep/Account/LogOn?ReturnUrl=%2F'
    fill_in 'Empresa_DataAbertura', with: '28112020'
    select('UTC - 12', from: 'Empresa_FusoHorario_Id').select_option
    fill_in 'Empresa_DataPrevisaoProximoFechamento', with: '10022021'
    fill_in 'Empresa_DataLimiteTratamentoPonto', with: '10032021'
    fill_in 'connectChave_ChaveConnect', with: 'S123ab&*(#$'

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div .field-validation-error')).to have_content 'Já existe uma Empresa com o CNPJ/CPF inserido'
  end

  it 'CT005 Validar insercao de empresa com Razão Social existente', :ct005_empresa do
    fill_in 'Empresa_Codigo', with: '1234533'
    fill_in 'Empresa_CEI', with: '212990553782'
    fill_in 'Empresa_Telefone', with: '999999999'
    find('label[for="CbUtilizaPortaria"]', :visible=>true)
    fill_in 'Empresa_RazaoSocial', with: 'Abc&*)_:$#	'
    fill_in 'Empresa_CnpjCpf', with: '65742348000108'
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
    find('label[for="checkHabilitaHorarioVerao"]', :visible=>false).set(true) 
    fill_in 'Empresa_InicioHorarioVerao', with: '10022021'
    fill_in 'Empresa_FimHorarioVerao', with: '10032021'
    fill_in 'Empresa_DataPrevisaoProximoFechamento', with: '10022021'
    fill_in 'Empresa_DataLimiteTratamentoPonto', with: '10032021'
    fill_in 'connectChave_ChaveConnect', with: 'S123ab&*(#$'
    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div .field-validation-error')).to have_content 'A Razão Social escolhida já está em uso.'
  end
  
  it 'CT006 Validar a desativação do checkbox da "portaria 1510"', :ct006_empresa do
    fill_in 'Empresa_Codigo', with: '124633'
    fill_in 'Empresa_CEI', with: '212990553782'
    fill_in 'Empresa_Telefone', with: '999999999'
    find('label[for="CbUtilizaPortaria"]', :visible=>true).set(false)  
    fill_in 'Empresa_RazaoSocial', with: 'Ababc123$%*()<>,.'
    fill_in 'Empresa_CnpjCpf', with: '12572770000198'
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
    find('label[for="checkHabilitaHorarioVerao"]', :visible=>false).set(true)
    fill_in 'Empresa_InicioHorarioVerao', with: '10022021'
    fill_in 'Empresa_FimHorarioVerao', with: '10032021'
    fill_in 'Empresa_DataPrevisaoProximoFechamento', with: '10022021'
    fill_in 'Empresa_DataLimiteTratamentoPonto', with: '10032021'
    fill_in 'connectChave_ChaveConnect', with: 'S123ab&*(#$'
    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click
   
    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Empresa foi criada com sucesso'
  end

  it 'CT007 Validar a ativação do checkbox da "Horário de verão"', :ct007_empresa do
    fill_in 'Empresa_Codigo', with: '126733'
    fill_in 'Empresa_CEI', with: '212990553782'
    fill_in 'Empresa_Telefone', with: '999999999'
    fill_in 'Empresa_RazaoSocial', with: 'Cbacbc123$%*()<>,.'
    fill_in 'Empresa_CnpjCpf', with: '09030486000185'
    find('label[for="CbUtilizaPortaria"]', :visible=>true)
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
    find('label[for="checkHabilitaHorarioVerao"]', :visible=>false).set(true)  
    fill_in 'Empresa_InicioHorarioVerao', with: '10022021'
    fill_in 'Empresa_FimHorarioVerao', with: '10032021'
    fill_in 'Empresa_DataPrevisaoProximoFechamento', with: '10022021'
    fill_in 'Empresa_DataLimiteTratamentoPonto', with: '10032021'
    fill_in 'connectChave_ChaveConnect', with: 'S123ab&*(#$'
    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click
   
    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Empresa foi criada com sucesso'
 end
end

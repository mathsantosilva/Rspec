require 'common\common'
common = Common.new

describe 'Cadastro de empresa', :empresa_create do
  before(:each) do
    visit '/'
    expect(page.title).to eql 'kairos'

    fill_in 'LogOnModel_UserName', with: @user_br
    fill_in 'LogOnModel_Password', with: @senha
    click_button 'Entrar'

    # Acessando a empresa pela navegação de telas
    common.nav('Empresa')
  end

  it 'Criando com CNPJ' do
    #Entrando na criaçao de empresa
    find('label[class="pointer"]').click

    fill_in 'Empresa_Codigo', with: @codigo_aleatorio
    fill_in 'Empresa_CEI', with: '294226088484'
    fill_in 'Empresa_Telefone', with: '116541954654'
    find('label[for="CbUtilizaPortaria"]', visible: true)
    fill_in 'Empresa_RazaoSocial', with: '	Empresa Br - Automação de testes - ' + @time.to_s
    fill_in 'Empresa_CnpjCpf', with: @cnpj
    select('INDÚSTRIAS EXTRATIVAS', from: 'Empresa_RamoAtividade_Id').select_option
    fill_in 'Empresa_Endereco', with: @endereco_aleatorio
    fill_in 'Empresa_Bairro', with: @bairro_aleatorio
    fill_in 'Empresa_Cidade', with: @cidade_aleatoria
    fill_in 'Empresa_UF', with: @estado_aleatorio
    fill_in 'Empresa_Pais', with: @pais_aleatorio
    fill_in 'Empresa_URL', with: 'https://www.dimepkairos.com.br/Dimep/Account/LogOn?ReturnUrl=%2F'
    fill_in 'Empresa_Email', with: @email_aleatorio
    fill_in 'Empresa_DataAbertura', with: '10112020'
    select('UTC - 12', from: 'Empresa_FusoHorario_Id').select_option
    find('label[for="checkHabilitaHorarioVerao"]', visible: false).set(true)
    fill_in 'Empresa_InicioHorarioVerao', with: '10032021'
    fill_in 'Empresa_FimHorarioVerao', with: '10052021'
    fill_in 'Empresa_DataPrevisaoProximoFechamento', with: '10052021'
    fill_in 'Empresa_DataLimiteTratamentoPonto', with: '10072021'
    fill_in 'connectChave_ChaveConnect', with: @chave_aleatoria
    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Empresa foi criada com sucesso'
  end

  it 'Criando com CPF' do
    #Entrando na criaçao de empresa
    find('label[class="pointer"]').click

    fill_in 'Empresa_Codigo', with: @codigo_aleatorio
    fill_in 'Empresa_CEI', with: '294226088484'
    fill_in 'Empresa_Telefone', with: '116541954654'
    find('label[for="CbUtilizaPortaria"]', visible: true)
    fill_in 'Empresa_RazaoSocial', with: '	Empresa Br - Automação de testes - ' + @time.to_s
    fill_in 'Empresa_CnpjCpf', with: @cpf
    select('INDÚSTRIAS EXTRATIVAS', from: 'Empresa_RamoAtividade_Id').select_option
    fill_in 'Empresa_Endereco', with: @endereco_aleatorio
    fill_in 'Empresa_Bairro', with: @bairro_aleatorio
    fill_in 'Empresa_Cidade', with: @cidade_aleatoria
    fill_in 'Empresa_UF', with: @estado_aleatorio
    fill_in 'Empresa_Pais', with: @pais_aleatorio
    fill_in 'Empresa_URL', with: 'https://www.dimepkairos.com.br/Dimep/Account/LogOn?ReturnUrl=%2F'
    fill_in 'Empresa_Email', with: @email_aleatorio
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

require 'common\common'
common = Common.new

describe 'empresa', :empresa_update do
  before(:each) do
    visit '/'
    expect(page.title).to eql 'kairos'

    fill_in 'LogOnModel_UserName', with: $user_br
    fill_in 'LogOnModel_Password', with: @senha
    click_button 'Entrar'

    # Acessando a empresa pela navegação de telas
    common.nav('Empresa')
    common.select_button('table tbody tr', 'Empresa Br - Automação de testes - 17-08-2021 - 1101')

  end

  it 'realizando alteração dos dados da empresa criada com CNPJ' do
    expect(find('input[id="Empresa_Codigo"]').readonly?).to be(true)
    fill_in 'Empresa_CEI', with: '242035439181'
    fill_in 'Empresa_Telefone', with: '119563245132155'
    expect(find('input[id="CbUtilizaPortaria"]', visible: false).checked?).to be(true)
    expect(find('input[id="CbUtilizaPortaria"]', visible: false).disabled?).to be(true)
    expect(find('input[id="Empresa_RazaoSocial"]').readonly?).to be(true)
    expect(find('input[id="Empresa_CnpjCpf"]').readonly?).to be(true)
    drop_ramo = find('#Empresa_RamoAtividade_Id')
    drop_ramo.all('option').sample.select_option
    fill_in 'Empresa_Endereco', with: $endereco_aleatorio
    fill_in 'Empresa_Bairro', with: $bairro_aleatorio
    fill_in 'Empresa_Cidade', with: $cidade_aleatoria
    fill_in 'Empresa_UF', with: $estado_aleatorio
    fill_in 'Empresa_Pais', with: $pais_aleatorio
    fill_in 'Empresa_URL', with: 'https://www.dimepkairos.com.br/Dimep/Empresas/Edit/'
    fill_in 'Empresa_Email', with: $email_aleatorio
    drop_fuso = find('#Empresa_FusoHorario_Id')
    drop_fuso.all('option').sample.select_option
    expect(find('input[id="checkHabilitaHorarioVerao"]', visible: false).checked?).to be(true)
    fill_in 'Empresa_InicioHorarioVerao', with: '10042021'
    fill_in 'Empresa_FimHorarioVerao', with: '10062021'
    fill_in 'Empresa_DataPrevisaoProximoFechamento', with: '10062021'
    fill_in 'Empresa_DataLimiteTratamentoPonto', with: '10082021'
    fill_in 'connectChave_ChaveConnect', with: $chave_aleatoria
    
    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'Empresa editada com sucesso'
  end
  it 'realizando alteração dos dados da empresa criada com CNPJ' do
    expect(find('input[id="Empresa_Codigo"]').readonly?).to be(true)
    fill_in 'Empresa_CEI', with: '242035439181'
    fill_in 'Empresa_Telefone', with: '119563245132155'
    expect(find('input[id="CbUtilizaPortaria"]', visible: false).checked?).to be(true)
    expect(find('input[id="CbUtilizaPortaria"]', visible: false).disabled?).to be(true)
    expect(find('input[id="Empresa_RazaoSocial"]').readonly?).to be(true)
    expect(find('input[id="Empresa_CnpjCpf"]').readonly?).to be(true)
    drop_ramo = find('#Empresa_RamoAtividade_Id')
    drop_ramo.all('option').sample.select_option
    fill_in 'Empresa_Endereco', with: $endereco_aleatorio
    fill_in 'Empresa_Bairro', with: $bairro_aleatorio
    fill_in 'Empresa_Cidade', with: $cidade_aleatoria
    fill_in 'Empresa_UF', with: $estado_aleatorio
    fill_in 'Empresa_Pais', with: $pais_aleatorio
    fill_in 'Empresa_URL', with: 'https://www.dimepkairos.com.br/Dimep/Empresas/Edit/'
    fill_in 'Empresa_Email', with: $email_aleatorio
    drop_fuso = find('#Empresa_FusoHorario_Id')
    drop_fuso.all('option').sample.select_option
    expect(find('input[id="checkHabilitaHorarioVerao"]', visible: false).checked?).to be(true)
    fill_in 'Empresa_InicioHorarioVerao', with: '10042021'
    fill_in 'Empresa_FimHorarioVerao', with: '10062021'
    fill_in 'Empresa_DataPrevisaoProximoFechamento', with: '10062021'
    fill_in 'Empresa_DataLimiteTratamentoPonto', with: '10082021'
    fill_in 'connectChave_ChaveConnect', with: $chave_aleatoria
    
    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'Empresa editada com sucesso'
  end
end

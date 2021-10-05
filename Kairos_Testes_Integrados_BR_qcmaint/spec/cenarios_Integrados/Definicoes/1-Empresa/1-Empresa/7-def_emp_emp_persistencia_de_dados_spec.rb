require 'common\common'
common = Common.new

describe 'Cadastrando empresas com valores existente', :persistencia_all do
    before(:each) do
      visit '/'

      fill_in 'LogOnModel_UserName', with: @user_br
      fill_in 'LogOnModel_Password', with: @senha
      click_button 'Entrar'
      
      # Acessando a empresa pela navegação de telas
      common.nav('Empresa')
    end

    it 'utilizando codigo repetido', :pesistencia_codigo do
      #removendo chat da tela
      common.remove_chat()

      #Entrando na criaçao de empresa
      find('label[class="pointer"]').click
  
      fill_in 'Empresa_Codigo', with: '516322'
      fill_in 'Empresa_CEI', with: '294226088484'
      fill_in 'Empresa_Telefone', with: '116541954654'
      find('label[for="CbUtilizaPortaria"]', visible: true)
      fill_in 'Empresa_RazaoSocial', with: 'Empresa Br - Automação de testes - ' + @time.to_s
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

      expect(find('div[class="field-validation-error"]')).to have_content 'Já existe uma Empresa com o código inserido'
    end

    it 'utilizando razão social repetida', :pesistencia_razao_social do
      #removendo chat da tela
      common.remove_chat()
  
      #Entrando na criaçao de empresa
      find('label[class="pointer"]').click

      fill_in 'Empresa_Codigo', with: @codigo_aleatorio
      fill_in 'Empresa_CEI', with: '294226088484'
      fill_in 'Empresa_Telefone', with: '116541954654'
      find('label[for="CbUtilizaPortaria"]', visible: true)
      fill_in 'Empresa_RazaoSocial', with: 'Empresa Br  - Automação de testes - 17-08-2021 - 1101'
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

      expect(find('div[class="field-validation-error"]')).to have_content 'A Razão Social escolhida já está em uso.'
    end  

    it 'utilizando CNPJ repetido', :pesistencia_cnpj do
      #removendo chat da tela
      common.remove_chat()  
      
      #Entrando na criaçao de empresa
      find('label[class="pointer"]').click

      fill_in 'Empresa_Codigo', with: @codigo_aleatorio
      fill_in 'Empresa_CEI', with: '294226088484'
      fill_in 'Empresa_Telefone', with: '116541954654'
      find('label[for="CbUtilizaPortaria"]', visible: true)
      fill_in 'Empresa_RazaoSocial', with: '	Empresa Br - Automação de testes - ' + @time.to_s
      fill_in 'Empresa_CnpjCpf', with: '92995941000120'
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

      expect(find('div[class="field-validation-error"]')).to have_content 'Já existe uma Empresa com o CNPJ/CPF inserido'
    end  

  it 'utilizando CPF repetido', :pesistencia_cpf do
    #removendo chat da tela
    common.remove_chat()

    #Entrando na criaçao de empresa
    find('label[class="pointer"]').click

    fill_in 'Empresa_Codigo', with: @codigo_aleatorio
    fill_in 'Empresa_CEI', with: '294226088484'
    fill_in 'Empresa_Telefone', with: '116541954654'
    find('label[for="CbUtilizaPortaria"]', visible: true)
    fill_in 'Empresa_RazaoSocial', with: '	Empresa Br - Automação de testes - ' + @time.to_s
    fill_in 'Empresa_CnpjCpf', with: '92878906926'
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

    expect(find('div[class="field-validation-error"]')).to have_content 'Já existe uma Empresa com o CNPJ/CPF inserido'
  end  
end
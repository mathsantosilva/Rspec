Dado('que acesso a empresa criada com cnpj') do
    #Realiza login
    @login.logon_br
    # Acessando a empresa pela navegação de telas
    sleep 5
    @common.nav_def('Empresa', 'div[id="MenuEmpresas"]')
    sleep 5
    @common.select_button('body > div.ZonaConteudo > div.Conteudo > table > tbody > tr:nth-child(1) > td:nth-child(1)', 'img[class="pointer icons editIcon"]')
end

Quando('altero os dados da empresa com cnpj') do
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
    fill_in 'Empresa_URL', with: $url_aleatoria
    fill_in 'Empresa_Email', with: $email_aleatorio
    drop_fuso = find('#Empresa_FusoHorario_Id')
    drop_fuso.all('option').sample.select_option
    expect(find('input[id="checkHabilitaHorarioVerao"]', visible: false).checked?).to be(true)
    fill_in 'Empresa_InicioHorarioVerao', with: '10042021'
    fill_in 'Empresa_FimHorarioVerao', with: '10062021'
    fill_in 'Empresa_DataPrevisaoProximoFechamento', with: '10062021'
    fill_in 'Empresa_DataLimiteTratamentoPonto', with: '10082021'
    fill_in 'connectChave_ChaveConnect', with: $chave_aleatoria
end

Quando('for salvar o cadastro com cnpj') do
    @common.botaosalvar
end

Então('ira demonstrar a mensagem {string}') do |message_success|
    expect(find('div[id=Summary-Field-Index]')).to have_content message_success
end

Dado('que acesso a empresa criada com cpf') do
    #Realiza login
    @login.logon_br
    # Acessando a empresa pela navegação de telas
    sleep 5
    @common.nav_def('Empresa', 'div[id="MenuEmpresas"]')
    sleep 5
    @common.select_button('body > div.ZonaConteudo > div.Conteudo > table > tbody > tr:nth-child(4) > td:nth-child(1)', 'img[class="pointer icons editIcon"]')
end

Quando('altero os dados da empresa com cpf') do
    sleep 5
    expect(find('input[id="Empresa_Codigo"]').readonly?).to be(true)
    fill_in 'Empresa_CEI', with: '242035439181'
    fill_in 'Empresa_Telefone', with: '119563245132155'
    expect(find('input[id="CbUtilizaPortaria"]', visible: false).checked?).to be(true)
    expect(find('input[id="CbUtilizaPortaria"]', visible: false).disabled?).to be(true)
    expect(find('input[id="Empresa_CnpjCpf"]').readonly?).to be(true)
    drop_ramo = find('#Empresa_RamoAtividade_Id')
    drop_ramo.all('option').sample.select_option
    fill_in 'Empresa_Endereco', with: $endereco_aleatorio
    fill_in 'Empresa_Bairro', with: $bairro_aleatorio
    fill_in 'Empresa_Cidade', with: $cidade_aleatoria
    fill_in 'Empresa_UF', with: $estado_aleatorio
    fill_in 'Empresa_Pais', with: $pais_aleatorio
    fill_in 'Empresa_URL', with: $url_aleatoria
    fill_in 'Empresa_Email', with: $email_aleatorio
    drop_fuso = find('#Empresa_FusoHorario_Id')
    drop_fuso.all('option').sample.select_option
    expect(find('input[id="checkHabilitaHorarioVerao"]', visible: false).checked?).to be(true)
    fill_in 'Empresa_InicioHorarioVerao', with: '10042021'
    fill_in 'Empresa_FimHorarioVerao', with: '10062021'
    fill_in 'Empresa_DataPrevisaoProximoFechamento', with: '10062021'
    fill_in 'Empresa_DataLimiteTratamentoPonto', with: '10082021'
    fill_in 'connectChave_ChaveConnect', with: $chave_aleatoria
end

Quando('for salvar o cadastro com cpf') do
    @common.botaosalvar

end

Então('ira informar a mensagem {string}') do |message_success|
    expect(find('div[id=Summary-Field-Index]')).to have_content message_success
end
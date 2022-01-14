Dado('que acesso a empresa criada com cnpj') do
    expect(page.title).to eql 'kairos'
    #Realiza login
    @login.logon_br
    # Acessando a empresa pela navegação de telas
    sleep 5
    @common.nav('Empresa', 'div[id="MenuEmpresas"]')
    sleep 5
    @common.select_button('table tbody tr', '/html/body/div[1]/div[3]/table/tbody/tr[1]/td[1]', '516322', 'span[class="spanButtonText"]')
    within('table tbody tr') do
        selecionar = find(:xpath, '/html/body/div[1]/div[3]/table/tbody/tr[1]/td[1]', text: '516322')
        puts selecionar
        selecionar.hover
        find('span[class="spanButtonText"]').click
    end
    
    sleep 10
    print('passou')
end

Dado('altero os dados da empresa') do
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

Quando('for salvar o cadastro') do
    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click
end

Então('ira demonstrar a mensagem ') do |message_success|
    expect(find('div[id=Summary-Field-Index]')).to have_content message_success
end

Dado('que acesso a empresa criada com cpf') do
  
end

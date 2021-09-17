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

  it 'Validando o Resource no create', :resource_crate do
    pagina = page
    puts 'codigo'
    find_field('.labelFormEdit', with: 'Código:', disabled: true)
    puts 'CEI'
    # pagina.has_field('CEI')
    # page.has_field?('Telefone')
    # page.has_field?('Utiliza portaria 1510')
    # page.has_field?('Razão Socia')
    # page.has_field?('CNPJ/CPF')
    # page.has_field?('Ramo de atividade', with: 'AGRICULTURA, PECUÁRIA, PRODUÇÃO FLORESTAL, PESCA E AQÜICULTURA')
    # page.has_field?('Endereço')
    # page.has_field?('Bairro')
    # page.has_field?('UF')
    # page.has_field?('País')
    # page.has_field?('Email')
    # page.has_field?('Dia de abertura do período')
    # page.has_field?('Fuso horário', with: 'UTC -3')
    # page.has_field?('Horário de verão')
    # page.has_field?('Início horário de verão')
    # page.has_field?('Fim horário de verão')
    # page.has_field?('Data de Previsão do Próximo Fechamento', with: '00/00/0000')
    # page.has_field?('Data Limite para Tratamento de Ponto', with: '00/00/0000')
    # page.has_field?('Alteração Automática')
    # page.has_field?('Chave do Kairos Connect')
    # page.has_field?('Logotipo personalizado')

    # texto = find('div div input', 'input[id="Empresa_Codigo"]')
    # expect(texto).to match_selector '/html/body/div[1]/div[3]/form/div[5]/div[1]'
    # expect(texto).to have_text 'Código:'




   end  

   it 'Validando o Resource no update', :resource_update do
  
   end  
  end

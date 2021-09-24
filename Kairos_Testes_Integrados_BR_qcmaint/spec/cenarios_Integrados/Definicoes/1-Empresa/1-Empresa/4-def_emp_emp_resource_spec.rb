# require "commom/expect"
# expect = Expect.new


describe 'empresa', :empresa_resource do
  before(:each) do
    visit '/'

    fill_in 'LogOnModel_UserName', with: @login
    fill_in 'LogOnModel_Password', with: @senha
    click_button 'Entrar'
    # Acessando a empresa pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 3
    find('div[class="pointer DropDownHeaderElement"]', text: 'Empresa').click
    find('div[id="MenuEmpresas"]').click

    # Acessar a empresa direto pela URL
    # visit '/admin/Empresas'
    # visit '/admin/Empresas/Create'
  end

  it 'Validando o Resource no create', :resource_crate do
    find('label[class="pointer"]').click
    # expect.comparecontent('Código:')

    expect(page).to have_content 'Código:'
    expect(page).to have_content 'CEI:'
    expect(page).to have_content 'Telefone:'
    expect(page).to have_content 'Utiliza portaria 1510'
    expect(page).to have_content 'Razão Social:'
    expect(page).to have_content 'CNPJ/CPF:'
    expect(page).to have_content 'Ramo de atividade:'
    # expect(find('select[id="Empresa_RamoAtividade_Id"]').selected?).to be(AGRICULTURA, PECUÁRIA, PRODUÇÃO FLORESTAL, PESCA E AQÜICULTURA)
    expect(page).to have_content 'Endereço:'
    expect(page).to have_content 'Bairro:'
    expect(page).to have_content 'UF:'
    expect(page).to have_content 'País:'
    expect(page).to have_content 'URL:'
    expect(page).to have_content 'Email:'
    expect(page).to have_content 'Dia de abertura do período:'
    expect(page).to have_content 'Fuso horário:'
    # 'UTC -3'
    expect(page).to have_content 'Horário de verão:'
    expect(page).to have_content 'Início horário de verão:'
    expect(page).to have_content 'Fim horário de verão:'
    expect(page).to have_content 'Data de Previsão do Próximo Fechamento:'
    # with: '00/00/0000'
    expect(page).to have_content 'Data Limite para Tratamento de Ponto:' 
    # with: '00/00/0000'
    expect(page).to have_content 'Alteração Automática'
    expect(page).to have_content 'Chave do Kairos Connect :'
    expect(page).to have_content 'Chave pública para geração de Comprovante de Ponto:'
    expect(page).to have_content 'Logotipo personalizado:'
    expect(page).to have_content 'Localização:'

  end  

  it 'Validando o Resource no update', :resource_update do
    within('table tbody tr', text: 'Empresa Br - Automação de testes - 17-08-2021 - 1101') do
      selecionar = find('td[style="width: 45%;"]')
      selecionar.hover
      find('img[class="pointer icons editIcon"]').click
    end

    expect(page).to have_content 'Código:'
    expect(page).to have_content 'CEI:'
    expect(page).to have_content 'Telefone:'
    expect(page).to have_content 'Utiliza portaria 1510'
    expect(page).to have_content 'Razão Social:'
    expect(page).to have_content 'CNPJ/CPF:'
    expect(page).to have_content 'Ramo de atividade:'
    # expect(find('select[id="Empresa_RamoAtividade_Id"]').selected?).to be(AGRICULTURA, PECUÁRIA, PRODUÇÃO FLORESTAL, PESCA E AQÜICULTURA)
    expect(page).to have_content 'Endereço:'
    expect(page).to have_content 'Bairro:'
    expect(page).to have_content 'UF:'
    expect(page).to have_content 'País:'
    expect(page).to have_content 'URL:'
    expect(page).to have_content 'Email:'
    expect(page).not_to have_content 'Dia de abertura do período:'
    expect(page).to have_content 'Fuso horário:'
    # 'UTC -3'
    expect(page).to have_content 'Horário de verão:'
    expect(page).to have_content 'Início horário de verão:'
    expect(page).to have_content 'Fim horário de verão:'
    expect(page).to have_content 'Data de Previsão do Próximo Fechamento:'
    # with: '00/00/0000'
    expect(page).to have_content 'Data Limite para Tratamento de Ponto:' 
    # with: '00/00/0000'
    expect(page).to have_content 'Alteração Automática'
    expect(page).to have_content 'Chave do Kairos Connect :'
    expect(page).to have_content 'Chave pública para geração de Comprovante de Ponto:'
    expect(page).to have_content 'Logotipo personalizado:'
    expect(page).to have_content 'Localização:'
  end  
end

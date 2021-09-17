describe 'empresa', :empresa_update do
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
    within('table tbody tr', text: 'Empresa Br - Automação de testes - 17-08-2021 - 1101') do
    selecionar = find('td[style="width: 45%;"]')
    selecionar.hover
    find('img[class="pointer icons editIcon"]').click
    end

    # Acessar a empresa direto pela URL
    # visit '/admin/Empresas'
    # visit '/admin/Empresas/Create'
  end

  it 'realizando alteração dos dados da empresa' do
    expect(find('input[id="Empresa_Codigo"]').readonly?).to be(true)
    fill_in 'Empresa_CEI', with: '242035439181'
    fill_in 'Empresa_Telefone', with: '119563245132155'
    expect(find('input[id="CbUtilizaPortaria"]', visible: false).checked?).to be(true)
    expect(find('input[id="CbUtilizaPortaria"]', visible: false).disabled?).to be(true)
    expect(find('input[id="Empresa_RazaoSocial"]').readonly?).to be(true)
    expect(find('input[id="Empresa_CnpjCpf"]').readonly?).to be(true)
    drop_ramo = find('#Empresa_RamoAtividade_Id')
    drop_ramo.all('option').sample.select_option
    fill_in 'Empresa_Endereco', with: 'rua da madis'
    fill_in 'Empresa_Bairro', with: 'centro'
    fill_in 'Empresa_Cidade', with: 'Diadema'
    fill_in 'Empresa_UF', with: 'SB 12345'
    fill_in 'Empresa_Pais', with: 'Portugal'
    fill_in 'Empresa_URL', with: 'https://www.dimepkairos.com.br/Dimep/Empresas/Edit/'
    fill_in 'Empresa_Email', with: 'dimep@dimep.com'
    drop_fuso = find('#Empresa_FusoHorario_Id')
    drop_fuso.all('option').sample.select_option
    expect(find('input[id="checkHabilitaHorarioVerao"]', visible: false).checked?).to be(true)
    fill_in 'Empresa_InicioHorarioVerao', with: '10042021'
    fill_in 'Empresa_FimHorarioVerao', with: '10062021'
    fill_in 'Empresa_DataPrevisaoProximoFechamento', with: '10062021'
    fill_in 'Empresa_DataLimiteTratamentoPonto', with: '10082021'
    fill_in 'connectChave_ChaveConnect', with: 'dsada#@$@#132465'
    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'Empresa editada com sucesso'
   end  
  end

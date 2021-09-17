describe 'criacao filial', :criacao_filial do
  before(:each) do
    visit '/'

    fill_in 'LogOnModel_UserName', with: @login
    fill_in 'LogOnModel_Password', with: @senha
    click_button 'Entrar'

    # Acessando o cadastro da empresa filial pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 3
    find('div[class="pointer DropDownHeaderElement"]', text: 'Empresa').click
    find('div[id="MenuFiliais"]').click
    find('label[class="pointer"]').click

  end

  it 'CT002 Cadastrar uma nova filial', :ct002_cricao_filial do
    fill_in 'Filial_Codigo', with: '1125'
    fill_in 'Filial_Telefone', with: '999999999'
    fill_in 'Filial_Descricao', with: 'Empresa Filial'
    fill_in 'Filial_CnpjCpf', with: @cnpj_cpf_filial
    fill_in 'Filial_Endereco', with: @rua_aleatoria
    fill_in 'Filial_Cidade', with: @cidade_aleatoria
    fill_in 'Filial_Bairro', with: 'Vila Borges'
    fill_in 'Filial_UF', with: 'SP'
    fill_in 'Filial_Pais', with: @pais_aleatorio
    fill_in 'Filial_URL', with: 'http://filial.com.br'
    fill_in 'Filial_Email', with: @email_aleatorio
    select('UTC -10', from: 'Filial_FusoHorario_Id').select_option
    find('label[for="checkHabilitaHorarioVerao"]', visible: false).set(true)
    fill_in 'Filial.InicioHorarioVerao', with: '10062021'
    fill_in 'Filial_FimHorarioVerao', with: '11092021'
    fill_in 'Filial_DataPrevisaoProximoFechamento', with: '10032021'
    fill_in 'Filial_DataLimiteTratamentoPonto', with: '11042021'
    fill_in 'ConnectChave_ChaveConnect', with: 'jkl471<>¨&*!$'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click
    sleep 2

    expect(find('div[class=validation-summary-ok]')).to have_content 'A Filial foi criada com sucesso'
  end
end
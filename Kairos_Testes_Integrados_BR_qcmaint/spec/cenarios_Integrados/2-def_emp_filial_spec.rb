describe 'filial', :filial do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

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

  it 'CT002 Inserir uma nova filial', :ct002_filial do
    fill_in 'Filial_Codigo', with: '1125'
    fill_in 'Filial_Telefone', with: '999999999'
    fill_in 'Filial_Descricao', with: 'Nova filial'
    fill_in 'Filial_CnpjCpf', with: @cnpj_cpf_filial
    fill_in 'Filial_Endereco', with: 'rua abcd'
    fill_in 'Filial_Cidade', with: 'abcd'
    fill_in 'Filial_Bairro', with: 'abcd'
    fill_in 'Filial_UF', with: 'SP'
    fill_in 'Filial_Pais', with: 'abcd'
    fill_in 'Filial_URL', with: 'http://abc.com.br'
    fill_in 'Filial_Email', with: 'abc@abc.com'
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
describe 'filial', :filial do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr08012021@dimep.com'
    fill_in 'LogOnModel_Password', with: 'dimep123'
    click_button 'Entrar'

    visit '/admin/Filiais'
    visit '/admin/Filiais/Create'
  end

  it 'CT001 Inserir uma nova estrutura organizacional', :ct001_filial do
    fill_in 'Filial_Codigo', with: '1125'
    fill_in 'Filial_Telefone', with: '999999999'
    fill_in 'Filial_Descricao', with: 'asdgc'
    fill_in 'Filial_CnpjCpf', with: '17580580000136'
    fill_in 'Filial_Endereco', with: 'rua abcd'
    fill_in 'Filial_Cidade', with: 'abcd'
    fill_in 'Filial_Bairro', with: 'abcd'
    fill_in 'Filial_UF', with: 'SP'
    fill_in 'Filial_Pais', with: 'abcd'
    fill_in 'Filial_URL', with: 'http://abc.com.br'
    fill_in 'Filial_Email', with: 'abc@abc.com'
    select('UTC -10', from: 'Filial_FusoHorario_Id').select_option
    fill_in 'Filial_DataPrevisaoProximoFechamento', with: '10032021'
    fill_in 'Filial_DataLimiteTratamentoPonto', with: '11042021'
    fill_in 'ConnectChave_ChaveConnect', with: 'jkl471<>¨&*!$'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click
    sleep 2

    expect(find('div[class=validation-summary-ok]')).to have_content 'A Filial foi criada com sucesso'
  end

  it 'CT002 Inserir uma nova estrutura com horário de verão', :ct002_filial do
    fill_in 'Filial_Codigo', with: '11251'
    fill_in 'Filial_Telefone', with: '999999999'
    fill_in 'Filial_Descricao', with: 'asdgac'
    fill_in 'Filial_CnpjCpf', with: '26727058000125'
    fill_in 'Filial_Endereco', with: 'rua abcd'
    fill_in 'Filial_Cidade', with: 'abcd'
    fill_in 'Filial_Bairro', with: 'abcd'
    fill_in 'Filial_UF', with: 'SP'
    fill_in 'Filial_Pais', with: 'abcd'
    fill_in 'Filial_URL', with: 'http://abc.com.br'
    fill_in 'Filial_Email', with: 'abc@abc.com'
    select('UTC -10', from: 'Filial_FusoHorario_Id').select_option
    find('label[for="checkHabilitaHorarioVerao"]', visible: false).set(true)
    fill_in 'Filial.InicioHorarioVerao', with: '10032021'
    fill_in 'Filial_FimHorarioVerao', with: '11042021'
    fill_in 'Filial_DataPrevisaoProximoFechamento', with: '10032021'
    fill_in 'Filial_DataLimiteTratamentoPonto', with: '11042021'
    fill_in 'ConnectChave_ChaveConnect', with: 'jkl471<>¨&*!$'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click
    sleep 2

    expect(find('div[class=validation-summary-ok]')).to have_content 'A Filial foi criada com sucesso'
  end

  it 'CT003 validar a existência dos campos', :ct003_filial do
    fill_in 'Filial_Codigo', with: ''
    fill_in 'Filial_Telefone', with: ''
    fill_in 'Filial_Descricao', with: ''
    fill_in 'Filial_CnpjCpf', with: ''
    fill_in 'Filial_Endereco', with: ''
    fill_in 'Filial_Cidade', with: ''
    fill_in 'Filial_Bairro', with: ''
    fill_in 'Filial_UF', with: ''

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('span[for=Filial_Codigo]')).to have_content 'Por favor adicione um código'
    expect(find('span[for=Filial_Telefone]')).to have_content 'Por favor introduza um telefone'
    expect(find('span[for=Filial_Descricao]')).to have_content 'Por favor introduza uma razão social'
    expect(find('span[for=Filial_CnpjCpf]')).to have_content 'Por favor introduza um CNPJ/CPF'
    expect(find('span[for=Filial_Endereco]')).to have_content 'Por favor introduza um endereço'
    expect(find('span[for=Filial_Cidade]')).to have_content 'Por favor introduza uma cidade'
    expect(find('span[for=Filial_Bairro]')).to have_content 'Por favor introduza um bairro'
    expect(find('span[for=Filial_UF]')).to have_content 'Por favor introduza um UF'
  end
end

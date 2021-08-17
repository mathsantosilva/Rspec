describe 'relógios', :relogios do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'
  
    fill_in 'LogOnModel_UserName', with: 'sprintbr08012021@dimep.com'
    fill_in 'LogOnModel_Password', with: 'dimep123'
    click_button 'Entrar'

    visit '/admin/Relogios'
    visit '/admin/Relogios/Edit'
  end

    it 'CT001 Validar a inserção de campos obrigatório no relógio ', :ct001_relogios do

    fill_in 'Relogio_Codigo', with: '123'
    fill_in 'Relogio_Descricao', with: 'abcdz'
    select('BioPoint II - Sensor 3', from: 'DdlModeloId').select_option 
    select('abcdz', from: 'DdlConfiguracaoId').select_option 
    fill_in 'enderecoIP', with: '19820525502'
    fill_in 'Relogio_VersaoFirmware', with: '1982d2'
    select('UTC - 12', from: 'Relogio_FusoHorarioId').select_option
    find('label[for="checkHabilitaHorarioVerao"]', :visible=>false).set(true) 
    fill_in 'Relogio_InicioHorarioVerao', with: '06042021'
    fill_in 'Relogio_FimHorarioVerao', with: '10052021'


    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Relógio foi adicionado com sucesso'
  end

  it 'CT002 Validar a inserção de campos obrigatório no relógio ', :ct002_relogios do
 
    fill_in 'Relogio_Codigo', with: ''
    fill_in 'Relogio_Descricao', with: ''
    select('BioPoint II - Sensor 3', from: 'DdlModeloId')
    fill_in 'enderecoIP', with: ''

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click 
    expect(find("span[class=field-validation-error][data-valmsg-for='Relogio.Codigo']")).to have_content 'Por favor adicione um Código'
    expect(find("span[class=field-validation-error][data-valmsg-for='Relogio.Descricao']")).to have_content 'Por favor adicione uma descrição'
    expect(find("span[class=field-validation-error][data-valmsg-for='Relogio.EnderecoIP']")).to have_content 'Por favor adicione um endereço IP'
    expect(find("span[class=field-validation-error][data-valmsg-for='Relogio.ConfiguracaoId']")).to have_content 'Cadastrar uma configuração de equipamento para o modelo selecionado'
  end
  
  it 'CT003 Validar a inserção de campos existentes no relógio ', :ct003_relogios do
 
    fill_in 'Relogio_Codigo', with: '123'
    fill_in 'Relogio_Descricao', with: 'nfpoi¨&%kdow13'
    select('abcdz', from: 'DdlConfiguracaoId').select_option 
    fill_in 'enderecoIP', with: '19820525501'

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[class="field-validation-error"]')).to have_content 'Já existe um Relógio com o código inserido'

  end
 end
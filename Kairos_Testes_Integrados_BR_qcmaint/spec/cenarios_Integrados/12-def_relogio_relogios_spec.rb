describe 'relógios', :relogios do
  before(:each) do
    visit '/'

    #Aceitando os cookies
    find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
    sleep 2 

    fill_in 'LogOnModel_UserName', with: @login
    fill_in 'LogOnModel_Password', with: @senha
    click_button 'Entrar'

    # Acessando o cadastro de Relógio pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 3
    find('div[class="pointer DropDownHeaderElement"]', text: 'Relógios').click
    find('div[id="MenuRelogios"]').click
    
    #Abrir criação de novo Relógio
    find('label[class="pointer"]', text: 'Adicionar').click

  end

  it 'CT012 Inserir novos campos nas configuracoes relogio ', :ct012_relogios do
    fill_in 'Relogio_Codigo', with: '123'
    fill_in 'Relogio_Descricao', with: 'abcddz'
    select('BioPoint II - Sensor 3', from: 'DdlModeloId').select_option
    select('abcdz', from: 'DdlConfiguracaoId').select_option
    fill_in 'enderecoIP', with: '19820525502'
    fill_in 'Relogio_VersaoFirmware', with: '1982d2'
    select('UTC - 12', from: 'Relogio_FusoHorarioId').select_option
    find('label[for="checkHabilitaHorarioVerao"]', visible: false).set(true)
    fill_in 'Relogio_InicioHorarioVerao', with: '06042021'
    fill_in 'Relogio_FimHorarioVerao', with: '10052021'

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Relógio foi adicionado com sucesso'
  end
end

describe 'relógios', :relogios do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'migracao15042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/Relogios'
    visit '/admin/Relogios/Edit'
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

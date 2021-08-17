describe 'importacao escalas', :escalas do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr08012021@dimep.com'
    fill_in 'LogOnModel_Password', with: 'dimep123'
    click_button 'Entrar'
    visit '/FormatosArquivoColetaApontamentos'
   
  end

  # it 'CT001 inserir campos na importacao coleta de marcacoes', :ct001__escalas_folgas do
  #   visit '/FormatosArquivoColetaApontamentos'
  #   visit '/FormatosArquivoColetaApontamentos/EditEscalasFolgas'
  # end

  # it 'CT002 validar a insercao dos campos obrigatorios na importacao escalas', :ct002_escalas_folgas do
  #   fill_in '', with: ''

  #   drop = find('', text: '')
  #   drop.click

  #   expect(find('')).to have_content ''
  # end

  #   it 'CT001 inserir campos na importacao coleta de marcacoes', :ct001__escalas_horarios do
  #   visit '/FormatosArquivoColetaApontamentos'
  #   visit '/FormatosArquivoColetaApontamentos/EditEscalasHorarios'

  #   it 'CT002 validar a insercao dos campos obrigatorios na importacao escalas', :ct002_escalas_horarios do
  # end
end

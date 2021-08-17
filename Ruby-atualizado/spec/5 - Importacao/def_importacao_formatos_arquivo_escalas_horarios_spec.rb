describe 'importacao escalas', :escalas do
    before(:each) do
      visit '/Dimep/Account/LogOn?ReturnUrl=%2F'
  
      fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
      fill_in 'LogOnModel_Password', with: '1'
      click_button 'Entrar'
      visit '/admin/FormatosArquivoColetaApontamentos/EditEscalasHorarios'
    end
  
    it 'CT001 inserir itens nos campos na importacao de escalas de horários', :ct001_escalas_horarios do
      fill_in 'FormatoArquivoColetaApontamentos_Codigo', with: '15233'
      fill_in 'FormatoArquivoColetaApontamentos_Descricao', with: 'abxsz'
  
      fill_in 'tbInicio3801', with: '153'
      fill_in 'tbFim3801', with: '4324'
  
      fill_in 'tbInicio3802', with: '42'
      fill_in 'tbFim3802', with: '4242'
  
      fill_in 'tbInicio3803', with: '42'
      fill_in 'tbFim3803', with: '867'

      fill_in 'tbInicio3804', with: '42'
      fill_in 'tbFim3804', with: '867'
      
      
      drop = find("input[type=button][value='Salvar']", match: :first)
      drop.click
  
      expect(find('div[id=Summary-Field-Index]')).to have_content 'O Formato de arquivo de importação de escalas de horários foi adicionado com sucesso'
    end
  
    it 'CT002 validar a insercao dos campos obrigatorios na importacao  de escalas de horários', :ct002_escalas_horarios do
      fill_in 'FormatoArquivoColetaApontamentos_Codigo', with: ''
      fill_in 'FormatoArquivoColetaApontamentos_Descricao', with: ''
  
      fill_in 'tbInicio3801', with: ''
      fill_in 'tbFim3801', with: ''
  
      fill_in 'tbInicio3802', with: ''
      fill_in 'tbFim3802', with: ''
  
      fill_in 'tbInicio3803', with: ''
      fill_in 'tbFim3803', with: ''

      fill_in 'tbInicio3804', with: ''
      fill_in 'tbFim3804', with: ''
  
      drop = find("input[type=button][value='Salvar']", match: :first)
      drop.click
  
      expect(find('span[data-valmsg-for="FormatoArquivoColetaApontamentos.Descricao"]')).to have_content 'A Descrição não pode estar vazia'
      expect(find('span[data-valmsg-for="FormatoArquivoColetaApontamentos.Codigo"]')).to have_content 'Por favor adicione um código'
      expect(find('span[id=spanErrorInicio3801]')).to have_content 'O Campo "Início" da secção "Matricula" tem de ser um número'
      expect(find('span[id=spanErrorFim3801]')).to have_content 'O Campo "Fim" da secção "Matricula" tem de ser um número'
      expect(find('span[id=spanErrorInicio3802]')).to have_content 'O Campo "Início" da secção "PIS" tem de ser um número'
      expect(find('span[id=spanErrorFim3802]')).to have_content 'O Campo "Fim" da secção "PIS" tem de ser um número'
      expect(find('span[id=spanErrorInicio3803]')).to have_content 'O Campo "Início" da secção "Data" tem de ser um número'
      expect(find('span[id=spanErrorFim3803]')).to have_content 'O Campo "Fim" da secção "Data" tem de ser um número'
      expect(find('span[id=spanErrorInicio3804]')).to have_content 'O Campo "Início" da secção "Horário" tem de ser um número'
      expect(find('span[id=spanErrorFim3804]')).to have_content 'O Campo "Fim" da secção "Horário" tem de ser um número'
    end
  end
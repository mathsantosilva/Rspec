describe 'importacao coleta marcacoes', :coleta do
    before(:each) do
      visit '/Dimep/Account/LogOn?ReturnUrl=%2F'
  
      fill_in 'LogOnModel_UserName', with: 'sprintbr08012021@dimep.com'
      fill_in 'LogOnModel_Password', with: 'dimep123'
      click_button 'Entrar'
      visit '/FormatosArquivoColetaApontamentos'
      visit '/FormatosArquivoColetaApontamentos/Edit'
    end
  
      it 'CT001 validar a inserção de campos obrigatórios da coleta da importacao', :ct001_importacao_coleta do
        fill_in 'FormatoArquivoColetaApontamentos_Codigo', with: '15233'
        fill_in 'FormatoArquivoColetaApontamentos_Descricao', with: 'abxsz'
    
        fill_in 'tbInicio2011', with: '15233'
        fill_in 'tbFim2011', with: '12743'
      
        drop = find("input[type=submit][value='Salvar']", match: :first)
        drop.click
    
        expect(find('div[class=validation-summary-ok]')).to have_content ' O Formato de arquivo de importação de estruturas foi adicionado com sucesso'
      end
      
      it 'CT002 validar a inserção dos campos obrigatórios na configuração importação de coleta', :ct002_importacao_coleta do
         
        fill_in 'FormatoArquivoColetaApontamentos_Descricao', with: ''
        fill_in 'FormatoArquivoColetaApontamentos_Codigo', with: ''  
        fill_in 'tbInicio1001', with: ''
        fill_in 'tbFim1001', with: ''
           
        drop = find("input[type=button][value='Salvar']", match: :first)
        drop.click
    
        expect(find('span[for=FormatoArquivoColetaApontamentos.Descricao]')).to have_content 'A Descrição não pode estar vazia'
        expect(find('span[for=FormatoArquivoColetaApontamentos.Codigo]')).to have_content 'Por favor adicione um código'
        expect(find('span[id=spanErrorInicio1001]')).to have_content 'O Campo "Início" da secção "Crachá" tem de ser um número'
        expect(find('span[id=spanErrorFim1001')).to have_content 'O Campo "Fim" da secção "Crachá" tem de ser um número'
        
    
      end
    end
    

describe 'cadastrar novas pesssoas', :pessoas_menu do
    before(:each) do
      visit '/Dimep/Account/LogOn?ReturnUrl=%2F'
  
      fill_in 'LogOnModel_UserName', with: 'sprintbr08012021@dimep.com'
      fill_in 'LogOnModel_Password', with: 'dimep123'
      click_button 'Entrar'
             visit '/Pessoas/Create'               
    end

    it 'CT001 Inserir uma nova pessoa', :ct001_pessoas_menu do
        fill_in 'CreateModel_Nome', with: 'abc'
        fill_in 'CreateModel_Pis', with: '27744369000165'
        fill_in 'CreateModel_Matricula', with: '123'
        fill_in 'CreateModel_BaseHoras', with: '123'
        fill_in 'CreateModel_TipoFuncionarioCodigo', with: 'estagiário'
    
        drop = find("input[type=button][value='Salvar']", match: :first)
        drop.click
        
        expect(find('div[id=Summary-Field-Index]')).to have_content 'Pessoa cadastrada com sucesso.'
    end


    it 'CT002 Validar insercao de campos obrigatórios no cadastro de pessoas', :ct002_pessoas_menu do
        fill_in 'CreateModel_Nome', with: ''
        fill_in 'CreateModel_Pis', with: ''
        fill_in 'CreateModel_Matricula', with: ''
        fill_in 'CreateModel_BaseHoras', with: ''
       #fill_in 'CreateModel_TipoFuncionarioCodigo', with: ''
        drop.find('CreateModel_TipoFuncionarioCodigo', text: 'Estagiário').select_option
        drop = find("input[type=button][value='Salvar']", match: :first)
        drop.click
        
    expect(find('span[for=CreateModel.Nome]')).to have_content 'Por favor adicione um nome'
    expect(find('span[for=CreateModel.Pis]')).to have_content 'Por favor adicione um PIS'
    expect(find('span[for=CreateModel.Matricula]')).to have_content 'Por favor introduza uma matrícula'
    expect(find('span[for=CreateModel.BaseHoras]')).to have_content 'Por favor introduza uma base de horas'
    expect(find('span[for=CreateModel.TipoFuncionarioCodigo]')).to have_content 'Por favor selecione um tipo de funcionário'

    end
end



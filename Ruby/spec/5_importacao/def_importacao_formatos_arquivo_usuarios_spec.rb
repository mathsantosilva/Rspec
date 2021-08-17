describe 'usuarios', :usuarios do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr08012021@dimep.com'
    fill_in 'LogOnModel_Password', with: 'dimep123'
    click_button 'Entrar'
    visit '/FormatosArquivoColetaApontamentos'
    visit '/FormatosArquivoColetaApontamentos/EditUsuario'
  end

  it 'CT001 inserir campos na importacao usuarios', :ct001_usuarios do
    fill_in 'FormatoArquivoColetaApontamentos_Codigo', with: '15233'
    fill_in 'FormatoArquivoColetaApontamentos_Descricao', with: 'abcd'
    fill_in 'tbInicio3901', with: '152'
    fill_in 'tbFim3901', with: '153'
    fill_in 'tbInicio3902', with: '152'
    fill_in 'tbFim3902', with: '154'
    fill_in 'tbInicio3904', with: '1523'
    fill_in 'tbFim3904', with: '1674'
    fill_in 'tbInicio3905', with: '1523'
    fill_in 'tbFim3905', with: '1874'
    fill_in 'tbInicio3906', with: '1523'
    fill_in 'tbFim3906', with: '1874'
    fill_in 'tbInicio3907', with: '1523'
    fill_in 'tbFim3907', with: '1974'
    fill_in 'tbInicio3913', with: '1123'
    fill_in 'tbFim3913', with: '1274'

    expect(find('div[class=validation-summary-ok]')).to have_content ' O Formato de arquivo de importação de usuários foi adicionado com sucesso' 
  end

  it 'CT002 validar a insercao dos campos obrigatorios na importacao usuarios', :ct002_usuarios do
    fill_in 'FormatoArquivoColetaApontamentos_Codigo', with: ''
    fill_in 'FormatoArquivoColetaApontamentos_Descricao', with: ''
    fill_in 'tbInicio3901', with: ''
    fill_in 'tbFim3901', with: ''
    fill_in 'tbInicio3902', with: ''
    fill_in 'tbFim3902', with: ''
    fill_in 'tbInicio3904', with: ''
    fill_in 'tbFim3904', with: ''
    fill_in 'tbInicio3905', with: ''
    fill_in 'tbFim3905', with: ''
    fill_in 'tbInicio3906', with: ''
    fill_in 'tbFim3906', with: ''
    fill_in 'tbInicio3907', with: ''
    fill_in 'tbFim3907', with: ''
    fill_in 'tbInicio3913', with: ''
    fill_in 'tbFim3913', with: ''

    drop = find("input[type=button][value='Salvar']", match: :first)
        drop.click
    
    expect(find('span[for=FormatoArquivoColetaApontamentos.Descricao]')).to have_content 'A Descrição não pode estar vazia'
    expect(find('span[for=FormatoArquivoColetaApontamentos.Codigo]')).to have_content 'Por favor adicione um código'
    expect(find('span[id=spanErrorInicio3501]')).to have_content 'O Campo "Início" da secção "Nome" tem de ser um número'
    expect(find('span[id=spanErrorFim3501')).to have_content 'O Campo "Fim" da secção "Nome" tem de ser um número'
    expect(find('span[id=spanErrorInicio3502]')).to have_content 'O Campo "Início" da secção "Perfil" tem de ser um número'
    expect(find('span[id=spanErrorFim3502]')).to have_content 'O Campo "Fim" da secção "Perfil" tem de ser um número'
    expect(find('span[for=FormatoArquivoColetaApontamentos.Descricao]')).to have_content 'O Campo "Fim" da secção "Matrícula do Funcionário" tem de ser um número'
    expect(find('span[for=FormatoArquivoColetaApontamentos.Codigo]')).to have_content 'O Campo "Fim" da secção "Matrícula do Funcionário" tem de ser um número'
    expect(find('span[id=spanErrorInicio3501]')).to have_content 'O Campo "Início" da secção "Cod. Este utilizador visualizará os dados" tem de ser um número'
    expect(find('span[id=spanErrorFim3501')).to have_content 'O Campo "Fim" da secção "Cod. Este utilizador visualizará os dados" tem de ser um número'
    expect(find('span[for=FormatoArquivoColetaApontamentos.Descricao]')).to have_content 'O campo "Inicio" da seccção "Língua" tem de ser um número'
    expect(find('span[for=FormatoArquivoColetaApontamentos.Codigo]')).to have_content 'O campo "Fim" da seccção "Língua" tem de ser um número'
    expect(find('span[id=spanErrorInicio3501]')).to have_content 'O Campo "Início" da secção "E-mail" tem de ser um número'
    expect(find('span[id=spanErrorFim3501')).to have_content 'O Campo "Fim" da secção "E-mail" tem de ser um número'
    expect(find('span[id=spanErrorInicio3502]')).to have_content 'O Campo "Início" da secção "Estruturas Organizacionais" tem de ser um número'
    expect(find('span[id=spanErrorFim3502]')).to have_content 'O Campo "Fim" da secção "Estruturas Organizacionais" tem de ser um número'
  end
end

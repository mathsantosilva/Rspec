describe 'usuarios', :usuarios do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    visit '/admin/FormatosArquivoColetaApontamentos'
    visit '/admin/FormatosArquivoColetaApontamentos/EditUsuario'
  end

  it 'CT001 inserir itens nos campos na importacao usuarios', :ct001_usuarios do
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

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Formato de arquivo de importação de usuários foi adicionado com sucesso'
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

    expect(find('span[data-valmsg-for="FormatoArquivoColetaApontamentos.Descricao"]')).to have_content 'A Descrição não pode estar vazia'
    expect(find('span[data-valmsg-for="FormatoArquivoColetaApontamentos.Codigo"]')).to have_content 'Por favor adicione um código'
    expect(find('span[id=spanErrorInicio3901]')).to have_content 'O Campo "Início" da secção "Nome" tem de ser um número'
    expect(find('span[id=spanErrorFim3901]')).to have_content 'O Campo "Fim" da secção "Nome" tem de ser um número'
    expect(find('span[id=spanErrorInicio3902]')).to have_content 'O Campo "Início" da secção "Perfil" tem de ser um número'
    expect(find('span[id=spanErrorFim3902]')).to have_content 'O Campo "Fim" da secção "Perfil" tem de ser um número'
    expect(find('span[id=spanErrorInicio3904]')).to have_content 'O Campo "Início" da secção "Matrícula do Funcionário" tem de ser um número'
    expect(find('span[id=spanErrorFim3904]')).to have_content 'O Campo "Fim" da secção "Matrícula do Funcionário" tem de ser um número'
    expect(find('span[id=spanErrorInicio3905]')).to have_content 'O Campo "Início" da secção "Cod. Este utilizador visualizará os dados" tem de ser um número'
    expect(find('span[id=spanErrorFim3905]')).to have_content 'O Campo "Fim" da secção "Cod. Este utilizador visualizará os dados" tem de ser um número'
    expect(find('span[id=spanErrorInicio3906]')).to have_content 'O campo "Inicio" da seccção "Língua" tem de ser um número'
    expect(find('span[id=spanErrorFim3906]')).to have_content 'O campo "Fim" da seccção "Língua" tem de ser um número'
    expect(find('span[id=spanErrorInicio3907]')).to have_content 'O Campo "Início" da secção "E-mail" tem de ser um número'
    expect(find('span[id=spanErrorFim3907]')).to have_content 'O Campo "Fim" da secção "E-mail" tem de ser um número'
    expect(find('span[id=spanErrorInicio3913]')).to have_content 'O Campo "Início" da secção "Estruturas Organizacionais" tem de ser um número'
    expect(find('span[id=spanErrorFim3913]')).to have_content 'O Campo "Fim" da secção "Estruturas Organizacionais" tem de ser um número'
  end
  it 'CT003 validar a insercao dos campos obrigatorios existentes de usuarios', :ct003_usuarios do
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

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click
    expect(find('div .field-validation-error')).to have_content 'Já existe um Formato de arquivo de importação de usuários com essa descrição'
  end
end

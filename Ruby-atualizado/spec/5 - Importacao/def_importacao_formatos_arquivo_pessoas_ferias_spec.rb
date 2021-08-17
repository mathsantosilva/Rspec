describe 'importacao ferias', :pessoas_ferias do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    visit '/admin/FormatosArquivoColetaApontamentos'
    visit '/admin/FormatosArquivoColetaApontamentos/EditPessoaFerias'
  end

  it 'CT001 inserir itens nos campos na importacao pessoas ferias', :ct001_pessoas_ferias do
    fill_in 'FormatoArquivoColetaApontamentos_Codigo', with: '1523'
    fill_in 'FormatoArquivoColetaApontamentos_Descricao', with: 'absz'

    fill_in 'tbInicio3401', with: '153'
    fill_in 'tbFim3401', with: '4324'
    fill_in 'tbInicio3402', with: '42'
    fill_in 'tbFim3402', with: '4242'
    fill_in 'tbInicio3403', with: '41'
    fill_in 'tbFim3403', with: '867'
    fill_in 'tbInicio3404', with: '43'
    fill_in 'tbFim3404', with: '866'

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'Formato de arquivo de importação de férias editado com sucesso'
  end

  it 'CT002 validar a insercao dos campos obrigatorios na importacao pessoas ferias', :ct002_pessoas_ferias do
    fill_in 'FormatoArquivoColetaApontamentos_Codigo', with: ''
    fill_in 'FormatoArquivoColetaApontamentos_Descricao', with: ''

    fill_in 'tbInicio3401', with: ''
    fill_in 'tbFim3401', with: ''

    fill_in 'tbInicio3402', with: ''
    fill_in 'tbFim3402', with: ''

    fill_in 'tbInicio3403', with: ''
    fill_in 'tbFim3403', with: ''

    fill_in 'tbInicio3404', with: ''
    fill_in 'tbFim3404', with: ''

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('span[data-valmsg-for="FormatoArquivoColetaApontamentos.Descricao"]')).to have_content 'A Descrição não pode estar vazia'
    expect(find('span[data-valmsg-for="FormatoArquivoColetaApontamentos.Codigo"]')).to have_content 'Por favor adicione um código'
    expect(find('span[id=spanErrorInicio3401]')).to have_content 'O Campo "Início" da secção "Matricula" tem de ser um número'
    expect(find('span[id=spanErrorFim3401]')).to have_content 'O Campo "Fim" da secção "Matricula" tem de ser um número'
    expect(find('span[id=spanErrorInicio3402]')).to have_content 'O Campo "Início" da secção "PIS" tem de ser um número'
    expect(find('span[id=spanErrorFim3402]')).to have_content 'O Campo "Fim" da secção "PIS" tem de ser um número'
    expect(find('span[id=spanErrorInicio3403]')).to have_content 'O Campo "Início" da secção "Data Inicio" tem de ser um número'
    expect(find('span[id=spanErrorFim3403]')).to have_content 'O Campo "Fim" da secção "Data Inicio" tem de ser um número'
    expect(find('span[id=spanErrorInicio3404]')).to have_content 'O Campo "Início" da secção "Data Fim" tem de ser um número'
    expect(find('span[id=spanErrorFim3404]')).to have_content 'O Campo "Fim" da secção "Data Fim" tem de ser um número'
  end
end

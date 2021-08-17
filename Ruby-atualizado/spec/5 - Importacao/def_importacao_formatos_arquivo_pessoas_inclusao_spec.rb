describe 'importacao pessoas', :pessoas do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    visit '/admin/FormatosArquivoColetaApontamentos/EditPessoa'
  end

  it 'CT001 inserir itens nos campos na importacao de pessoas', :ct001_pessoas_inclusao do
    fill_in 'FormatoArquivoColetaApontamentos_Codigo', with: '1523'
    fill_in 'FormatoArquivoColetaApontamentos_Descricao', with: 'absz'

    fill_in 'tbInicio1101', with: '153'
    fill_in 'tbFim1101', with: '4324'
    fill_in 'tbInicio1102', with: '42'
    fill_in 'tbFim1102', with: '4242'
    fill_in 'tbInicio1103', with: '41'
    fill_in 'tbFim1103', with: '867'
    fill_in 'tbInicio1104', with: '43'
    fill_in 'tbFim1104', with: '866'
    fill_in 'tbInicio1107', with: '47'
    fill_in 'tbFim1107', with: '869'
    fill_in 'tbInicio1113', with: '48'
    fill_in 'tbFim1113', with: '868'
    fill_in 'tbInicio1114', with: '40'
    fill_in 'tbFim1114', with: '861'

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Formato de arquivo de importação de pessoas foi adicionado com sucesso'
  end

  it 'CT002 validar a insercao dos campos obrigatorios na importação de pessoas', :ct002_pessoas_inclusao do
    fill_in 'FormatoArquivoColetaApontamentos_Codigo', with: ''
    fill_in 'FormatoArquivoColetaApontamentos_Descricao', with: ''

    fill_in 'tbInicio1101', with: ''
    fill_in 'tbFim1101', with: ''

    fill_in 'tbInicio1102', with: ''
    fill_in 'tbFim1102', with: ''

    fill_in 'tbInicio1103', with: ''
    fill_in 'tbFim1103', with: ''

    fill_in 'tbInicio1104', with: ''
    fill_in 'tbFim1104', with: ''

    fill_in 'tbInicio1113', with: ''
    fill_in 'tbFim1113', with: ''

    fill_in 'tbInicio1114', with: ''
    fill_in 'tbFim1114', with: ''

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('span[data-valmsg-for="FormatoArquivoColetaApontamentos.Descricao"]')).to have_content 'A Descrição não pode estar vazia'
    expect(find('span[data-valmsg-for="FormatoArquivoColetaApontamentos.Codigo"]')).to have_content 'Por favor adicione um código'
    expect(find('span[id=spanErrorInicio1101]')).to have_content 'O Campo "Início" da secção "Matrícula" tem de ser um número'
    expect(find('span[id=spanErrorFim1101]')).to have_content 'O Campo "Fim" da secção "Matrícula" tem de ser um número'
    expect(find('span[id=spanErrorInicio1102]')).to have_content 'O Campo "Início" da secção "PIS" tem de ser um número'
    expect(find('span[id=spanErrorFim1102]')).to have_content 'O Campo "Fim" da secção "PIS" tem de ser um número'
    expect(find('span[id=spanErrorInicio1103]')).to have_content 'O Campo "Início" da secção "Crachá" tem de ser um número'
    expect(find('span[id=spanErrorFim1103]')).to have_content 'O Campo "Fim" da secção "Crachá" tem de ser um número'
    expect(find('span[id=spanErrorInicio1104]')).to have_content 'O Campo "Início" da secção "Nome Completo" tem de ser um número'
    expect(find('span[id=spanErrorFim1104]')).to have_content 'O Campo "Fim" da secção "Nome Completo" tem de ser um número'
    expect(find('span[id=spanErrorInicio1107]')).to have_content 'O Campo "Início" da secção "Data de Admissão" tem de ser um número'
    expect(find('span[id=spanErrorFim1107]')).to have_content 'O Campo "Fim" da secção "Data de Admissão" tem de ser um número'
  end
end

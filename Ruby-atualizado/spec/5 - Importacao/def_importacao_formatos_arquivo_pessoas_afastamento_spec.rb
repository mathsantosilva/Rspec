describe 'importacao afastamento', :pessoa_afastamento do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    visit '/admin/FormatosArquivoColetaApontamentos'
    visit '/admin/FormatosArquivoColetaApontamentos/EditPessoaAfastamentos'
  end

  it 'CT001 inserir itens nos campos na importacao pessoas afastamento', :ct001_pessoa_afastamento do
    fill_in 'FormatoArquivoColetaApontamentos_Codigo', with: '1523'
    fill_in 'FormatoArquivoColetaApontamentos_Descricao', with: 'absz'

    fill_in 'tbInicio3301', with: '153'
    fill_in 'tbFim3301', with: '4324'
    fill_in 'tbInicio3302', with: '42'
    fill_in 'tbFim3302', with: '4242'
    fill_in 'tbInicio3303', with: '41'
    fill_in 'tbFim3303', with: '867'
    fill_in 'tbInicio3304', with: '43'
    fill_in 'tbFim3304', with: '866'
    fill_in 'tbInicio3305', with: '47'
    fill_in 'tbFim3305', with: '869'

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Formato de arquivo de importação de afastamentos foi adicionado com sucesso'
  end

  it 'CT002 validar a insercao dos campos obrigatorios na importacao pessoas afastamento', :ct002_pessoa_afastamento do
    fill_in 'FormatoArquivoColetaApontamentos_Codigo', with: ''
    fill_in 'FormatoArquivoColetaApontamentos_Descricao', with: ''
    fill_in 'tbInicio3301', with: ''
    fill_in 'tbFim3301', with: ''
    fill_in 'tbInicio3302', with: ''
    fill_in 'tbFim3302', with: ''
    fill_in 'tbInicio3303', with: ''
    fill_in 'tbFim3303', with: ''
    fill_in 'tbInicio3304', with: ''
    fill_in 'tbFim3304', with: ''
    fill_in 'tbInicio3305', with: ''
    fill_in 'tbFim3305', with: ''

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('span[data-valmsg-for="FormatoArquivoColetaApontamentos.Descricao"]')).to have_content 'A Descrição não pode estar vazia'
    expect(find('span[data-valmsg-for="FormatoArquivoColetaApontamentos.Codigo"]')).to have_content 'Por favor adicione um código'
    expect(find('span[id=spanErrorInicio3301]')).to have_content 'O Campo "Início" da secção "Matricula" tem de ser um número'
    expect(find('span[id=spanErrorFim3301]')).to have_content 'O Campo "Fim" da secção "Matricula" tem de ser um número'
    expect(find('span[id=spanErrorInicio3302]')).to have_content 'O Campo "Início" da secção "PIS" tem de ser um número'
    expect(find('span[id=spanErrorFim3302]')).to have_content 'O Campo "Fim" da secção "PIS" tem de ser um número'
    expect(find('span[id=spanErrorInicio3303]')).to have_content 'O Campo "Início" da secção "Código Afastamento" tem de ser um número'
    expect(find('span[id=spanErrorFim3303]')).to have_content 'O Campo "Fim" da secção "Código Afastamento" tem de ser um número'
    expect(find('span[id=spanErrorInicio3304]')).to have_content 'O Campo "Início" da secção "Data de Início" tem de ser um número'
    expect(find('span[id=spanErrorFim3304]')).to have_content 'O Campo "Fim" da secção "Data de Início" tem de ser um número'
    expect(find('span[id=spanErrorInicio3305]')).to have_content 'O Campo "Início" da secção "Data de Fim" tem de ser um número'
    expect(find('span[id=spanErrorFim3305]')).to have_content 'O Campo "Fim" da secção "Data de Fim" tem de ser um número'
  end

  it 'CT003 validar a insercao dos campos obrigatorios existentes de afastamento', :ct003_pessoa_afastamento do
    fill_in 'FormatoArquivoColetaApontamentos_Codigo', with: '15233'
    fill_in 'FormatoArquivoColetaApontamentos_Descricao', with: 'abcd'
    fill_in 'tbInicio3301', with: '152'
    fill_in 'tbFim3301', with: '153'
    fill_in 'tbInicio3302', with: '152'
    fill_in 'tbFim3302', with: '154'
    fill_in 'tbInicio3303', with: '1523'
    fill_in 'tbFim3303', with: '1674'
    fill_in 'tbInicio3304', with: '1523'
    fill_in 'tbFim3304', with: '1874'
    fill_in 'tbInicio3305', with: '1523'
    fill_in 'tbFim3305', with: '1874'

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click
    expect(find('div .field-validation-error')).to have_content 'Já existe um Formato de arquivo de importação de afastamentos com essa descrição'
  end
end

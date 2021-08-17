describe 'importacao desligamentos', :desligamentos do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    visit '/admin/FormatosArquivoColetaApontamentos'
    visit '/admin/FormatosArquivoColetaApontamentos/EditPessoaDesligamentos'
  end

  it 'CT001 inserir itens nos campos na importacao pessoas desligamentos', :ct001_desligamentos do
    fill_in 'FormatoArquivoColetaApontamentos_Codigo', with: '1523'
    fill_in 'FormatoArquivoColetaApontamentos_Descricao', with: 'absz'

    fill_in 'tbInicio3201', with: '153'
    fill_in 'tbFim3201', with: '4324'
    fill_in 'tbInicio3202', with: '42'
    fill_in 'tbFim3202', with: '4242'
    fill_in 'tbInicio3203', with: '41'
    fill_in 'tbFim3203', with: '867'
    fill_in 'tbInicio3204', with: '43'
    fill_in 'tbFim3204', with: '866'

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Formato de arquivo de importação de desligamentos foi adicionado com sucesso'
  end

  it 'CT002 validar a insercao dos campos obrigatorios na importacao pessoas desligamentos', :ct002_desligamentos do
    fill_in 'FormatoArquivoColetaApontamentos_Codigo', with: ''
    fill_in 'FormatoArquivoColetaApontamentos_Descricao', with: ''

    fill_in 'tbInicio3201', with: ''
    fill_in 'tbFim3201', with: ''

    fill_in 'tbInicio3202', with: ''
    fill_in 'tbFim3202', with: ''

    fill_in 'tbInicio3203', with: ''
    fill_in 'tbFim3203', with: ''

    fill_in 'tbInicio3204', with: ''
    fill_in 'tbFim3204', with: ''

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('span[data-valmsg-for="FormatoArquivoColetaApontamentos.Descricao"]')).to have_content 'A Descrição não pode estar vazia'
    expect(find('span[data-valmsg-for="FormatoArquivoColetaApontamentos.Codigo"]')).to have_content 'Por favor adicione um código'
    expect(find('span[id=spanErrorInicio3201]')).to have_content 'O Campo "Início" da secção "Motivo" tem de ser um número'
    expect(find('span[id=spanErrorFim3201]')).to have_content 'O Campo "Fim" da secção "Motivo" tem de ser um número'
    expect(find('span[id=spanErrorInicio3202]')).to have_content 'O Campo "Início" da secção "PIS" tem de ser um número'
    expect(find('span[id=spanErrorFim3202]')).to have_content 'O Campo "Fim" da secção "PIS" tem de ser um número'
    expect(find('span[id=spanErrorInicio3203]')).to have_content 'O Campo "Início" da secção "Matricula" tem de ser um número'
    expect(find('span[id=spanErrorFim3203]')).to have_content 'O Campo "Fim" da secção "Matricula" tem de ser um número'
    expect(find('span[id=spanErrorInicio3204]')).to have_content 'O Campo "Início" da secção "Data de Demissão" tem de ser um número'
    expect(find('span[id=spanErrorFim3204]')).to have_content 'O Campo "Fim" da secção "Data de Demissão" tem de ser um número'
  end
end

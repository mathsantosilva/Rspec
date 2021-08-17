describe 'importacao escalas', :escalas do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    visit '/admin/FormatosArquivoColetaApontamentos/EditEscalasFolgas'
  end

  it 'CT001 inserir itens nos campos na importacao de escalas de folgas', :ct001_escalas_folgas do
    fill_in 'FormatoArquivoColetaApontamentos_Codigo', with: '15233'
    fill_in 'FormatoArquivoColetaApontamentos_Descricao', with: 'abxsz'

    fill_in 'tbInicio3701', with: '153'
    fill_in 'tbFim3701', with: '4324'

    fill_in 'tbInicio3702', with: '42'
    fill_in 'tbFim3702', with: '4242'

    fill_in 'tbInicio3703', with: '42'
    fill_in 'tbFim3703', with: '867'
    
    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Formato de arquivo de importação de escalas de folgas foi adicionado com sucesso'
  end

  it 'CT002 validar a insercao dos campos obrigatorios na importacao escalas de folgas', :ct002_escalas_folgas do
    fill_in 'FormatoArquivoColetaApontamentos_Codigo', with: ''
    fill_in 'FormatoArquivoColetaApontamentos_Descricao', with: ''

    fill_in 'tbInicio3701', with: ''
    fill_in 'tbFim3701', with: ''

    fill_in 'tbInicio3702', with: ''
    fill_in 'tbFim3702', with: ''

    fill_in 'tbInicio3703', with: ''
    fill_in 'tbFim3703', with: ''

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('span[data-valmsg-for="FormatoArquivoColetaApontamentos.Descricao"]')).to have_content 'A Descrição não pode estar vazia'
    expect(find('span[data-valmsg-for="FormatoArquivoColetaApontamentos.Codigo"]')).to have_content 'Por favor adicione um código'
    expect(find('span[id=spanErrorInicio3701]')).to have_content 'O Campo "Início" da secção "Matricula" tem de ser um número'
    expect(find('span[id=spanErrorFim3701]')).to have_content 'O Campo "Fim" da secção "Matricula" tem de ser um número'
    expect(find('span[id=spanErrorInicio3702]')).to have_content 'O Campo "Início" da secção "PIS" tem de ser um número'
    expect(find('span[id=spanErrorFim3702]')).to have_content 'O Campo "Fim" da secção "PIS" tem de ser um número'
    expect(find('span[id=spanErrorInicio3703]')).to have_content 'O Campo "Início" da secção "Data" tem de ser um número'
    expect(find('span[id=spanErrorFim3703]')).to have_content 'O Campo "Fim" da secção "Data" tem de ser um número'
  end
end

describe 'importacao coleta marcacoes', :coleta do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'
    fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    visit '/admin/FormatosArquivoColetaApontamentos'
    visit '/admin/FormatosArquivoColetaApontamentos/Edit'
  end

  it 'CT001 validar a inserção de campos obrigatórios da coleta da importacao', :ct001_importacao_coleta do
    fill_in 'FormatoArquivoColetaApontamentos_Codigo', with: '15933'
    fill_in 'FormatoArquivoColetaApontamentos_Descricao', with: 'abxpsz'

    select('Padrão Virtual Point', from: 'ddlCriptografia').select_option
    select('Normal', from: 'ddlTipoArquivo').select_option
    find('label[for="ModeloPosicao_false"]', visible: false).set(true)
    find('label[for="FormatoArquivoColetaApontamentos_Separador_Tab"]', visible: false).set(true)
    fill_in 'tbColuna1001', with: '19'
    fill_in 'tbColuna1013', with: '110219901'
    sleep 3
    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[class=validation-summary-ok]')).to have_content 'O Formato de arquivo de Importação de Marcações foi adicionado com sucesso'
  end

  it 'CT002 validar a inserção dos campos obrigatórios na configuração importação de coleta', :ct002_importacao_coleta do
    fill_in 'FormatoArquivoColetaApontamentos_Descricao', with: ''
    fill_in 'FormatoArquivoColetaApontamentos_Codigo', with: ''
    find('label[for="ModeloPosicao_false"]', visible: false).set(true)
    find('label[for="FormatoArquivoColetaApontamentos_Separador_Tab"]', visible: false).set(true)
    fill_in 'tbColuna1001', with: ''
    fill_in 'tbColuna1013', with: ''

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('span[data-valmsg-for="FormatoArquivoColetaApontamentos.Descricao"]')).to have_content 'A Descrição não pode estar vazia'
    expect(find('span[data-valmsg-for="FormatoArquivoColetaApontamentos.Codigo"]')).to have_content 'Por favor adicione um código'
    expect(find('span[id=spanErrorColuna1001]')).to have_content 'O Campo "Coluna" da secção "Crachá" tem de ser um número'
  end
end

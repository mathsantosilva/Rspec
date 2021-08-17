describe 'importacao estrutura', :importacao_estrutura do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr08012021@dimep.com'
    fill_in 'LogOnModel_Password', with: 'dimep123'
    click_button 'Entrar'

    visit '/FormatosArquivoColetaApontamentos'
    visit '/FormatosArquivoColetaApontamentos/EditEstrutura'
  end

  it 'CT001 validar a inserção de campos obrigatórios na importação estrutura', :ct001_importacao_estrutura do
    fill_in 'FormatoArquivoColetaApontamentos_Codigo', with: '12233'
    fill_in 'FormatoArquivoColetaApontamentos_Descricao', with: 'abcdz'

    fill_in 'tbInicio2011', with: '12233'
    fill_in 'tbFim2011', with: '123243'

    fill_in 'tbInicio2012', with: 'abcds'
    fill_in 'tbFim2012', with: 'abcdz'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[class=validation-summary-ok]')).to have_content ' O Formato de arquivo de importação de estruturas foi adicionado com sucesso'
  end
  
  it 'CT002 validar a inserção dos campos obrigatórios na configuração importação de estrutura', :ct002_importacao_estrutura do
     
    fill_in 'FormatoArquivoColetaApontamentos_Codigo', with: ''
    fill_in 'FormatoArquivoColetaApontamentos_Descricao', with: ''
    fill_in 'tbInicio2011', with: ''
    fill_in 'tbFim2011', with: ''
    fill_in 'tbInicio2012', with: ''
    fill_in 'tbFim2012', with: ''

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('span[for=FormatoArquivoColetaApontamentos.Descricao]')).to have_content 'A Descrição não pode estar vazia'
    expect(find('span[for=FormatoArquivoColetaApontamentos.Codigo]')).to have_content 'Por favor adicione um código'
    expect(find('span[id=spanErrorInicio2011]')).to have_content 'O Campo "Início" da secção "Código" tem de ser um número'
    expect(find('span[id=spanErrorFim2011')).to have_content 'O Campo "Fim" da secção "Código" tem de ser um número'
    expect(find('span[id=spanErrorInicio2012]')).to have_content 'O Campo "Início" da secção "Descricao" tem de ser um número'
    expect(find('span[id=spanErrorFim2012]')).to have_content 'O Campo "Fim" da secção "Descricao" tem de ser um número'

  end
end
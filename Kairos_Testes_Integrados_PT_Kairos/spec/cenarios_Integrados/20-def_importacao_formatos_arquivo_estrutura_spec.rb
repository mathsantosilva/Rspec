describe 'importacao estrutura', :importacao_estrutura do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'teste24052021@teste.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/FormatosArquivoColetaApontamentos'
    visit '/admin/FormatosArquivoColetaApontamentos/EditEstrutura'
  end

  it 'CT020 Inserir campos na importação estrutura', :ct020_importacao_estrutura do
    fill_in 'FormatoArquivoColetaApontamentos_Codigo', with: '12233'
    fill_in 'FormatoArquivoColetaApontamentos_Descricao', with: 'abcdz'
    fill_in 'tbInicio2011', with: '1233'
    fill_in 'tbFim2011', with: '12323'
    fill_in 'tbInicio2012', with: '7547471'
    fill_in 'tbFim2012', with: '42357479'

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Formato de arquivo de importação de estruturas foi criado com sucesso'
  end
end

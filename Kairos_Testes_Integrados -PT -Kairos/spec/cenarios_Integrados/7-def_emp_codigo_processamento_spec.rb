describe 'eventos', :processamento do
  before(:each) do
    visit '/Dimep/Account/LogOn?timeOutLoginComo=False'


    fill_in 'LogOnModel_UserName', with: 'teste24052021@teste.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/Eventos'
    visit '/admin/Eventos/Create'
  end

  it 'CT007 Inserir um novo evento', :ct007_processamento do
    fill_in 'Evento_Codigo', with: '11'
    fill_in 'Evento_Descricao', with: 'Feriado'
    fill_in 'Evento_EventoFolha', with: '312'
    fill_in 'Evento_Porcentagem', with: '10'
    select('Crédito', from: 'Evento_Tipo_Id').select_option
    fill_in 'Evento_IdentificadorExportacao', with: '10'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click
    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Código de Processamento foi criado com sucesso'
  end
end

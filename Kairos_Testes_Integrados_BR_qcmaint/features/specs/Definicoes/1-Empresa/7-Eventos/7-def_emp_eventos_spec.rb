describe 'eventos', :eventos do
  before(:each) do
    visit '/'

    #Aceitando os cookies
    find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
    sleep 2 

    fill_in 'LogOnModel_UserName', with: $user_br
    fill_in 'LogOnModel_Password', with: $senha
    click_button 'Entrar'

    # Acessando o cadastro eventos pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 3
    find('div[class="pointer DropDownHeaderElement"]', text: 'Empresa').click
    find('div[id="MenuEventos"]').click
   
    #Abrir criação de novo evento
    find('label[class="pointer"]', text: 'Novo Evento').click
    
  end

  it 'CT007 Inserir um novo evento', :ct007_eventos do
    fill_in 'Evento_Codigo', with: '11'
    fill_in 'Evento_Descricao', with: 'Feriado'
    fill_in 'Evento_EventoFolha', with: '!#$()'
    fill_in 'Evento_Porcentagem', with: '10'
    select('Interjornada', from: 'Evento_Tipo_Id').select_option
    fill_in 'Evento_IdentificadorExportacao', with: '10'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click
    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Evento foi adicionado com sucesso'
  end
end

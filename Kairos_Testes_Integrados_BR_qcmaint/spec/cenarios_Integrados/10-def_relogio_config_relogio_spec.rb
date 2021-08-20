describe 'configuração', :config_relogio do
  before(:each) do
    visit '/'
    #Aceitando os cookies
    find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
    sleep 2 

    fill_in 'LogOnModel_UserName', with: @login
    fill_in 'LogOnModel_Password', with: @senha
    click_button 'Entrar'

    # Acessando o cadastro de Configuração de relógio pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 3
    find('div[class="pointer DropDownHeaderElement"]', text: 'Relógios').click
   
    #Abrir criação de nova Configuração de relógio
    find('label[class="pointer"]', text: 'Adicionar').click
 
  end

  it 'CT010 Inserir uma nova config de relogio', :ct010_relogio do
    fill_in 'Codigo', with: '12233'
    fill_in 'Descricao', with: 'abcdz'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Configuração Relógio foi criada com sucesso'
  end
end

describe 'funcoes do relógio', :funcoes_relogio do
  before(:each) do
    visit '/'

    #Aceitando os cookies
    find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
    sleep 2 

    fill_in 'LogOnModel_UserName', with: $user_br
    fill_in 'LogOnModel_Password', with: $senha
    click_button 'Entrar'

    # Acessando o cadastro de Funções de relógio pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 3
    find('div[class="pointer DropDownHeaderElement"]', text: 'Relógios').click
    find('div[id="MenuFuncaoRelogio"]').click
    
    #Abrir criação de nova Função de relógio
    find('label[class="pointer"]', text: 'Adicionar').click
 
  end

  it 'CT011 Inserir novos campos funcoes relogio', :ct011_funcoes do
    fill_in 'FuncaoRelogio_Codigo', with: '1110'
    fill_in 'FuncaoRelogio_Descricao', with: 'abczzz'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Função do Relógio foi criada com sucesso'
  end
end

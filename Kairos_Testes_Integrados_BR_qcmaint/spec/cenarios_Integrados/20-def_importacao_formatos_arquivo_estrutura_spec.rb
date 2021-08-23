describe 'importacao estrutura', :importacao_estrutura do
  before(:each) do
    visit '/'

    #Aceitando os cookies
    find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click

    #Informações de login
    fill_in 'LogOnModel_UserName', with: @login
    fill_in 'LogOnModel_Password', with: @senha
    click_button 'Entrar'

    # Acessando o cadastro de Formato de folha de pagamento pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 2
    find('div[class="pointer DropDownHeaderElement"]', text: 'Importação').click

  end

  it 'CT020 Inserir campos na importação estrutura', :ct020_importacao_estrutura do
    
    #Adicionar cadastro de formato 
    find('label[class="pointer"]' , text:'Adicionar' ).click
    fill_in 'FormatoArquivoColetaApontamentos_Codigo', with: '123'
    fill_in 'FormatoArquivoColetaApontamentos_Descricao', with: 'abcdz'
    fill_in 'tbInicio2011', with: '1233'
    fill_in 'tbFim2011', with: '12323'
    fill_in 'tbInicio2012', with: '7547471'
    fill_in 'tbFim2012', with: '42357479'
    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Formato de arquivo de importação de estruturas foi adicionado com sucesso'
  end
end

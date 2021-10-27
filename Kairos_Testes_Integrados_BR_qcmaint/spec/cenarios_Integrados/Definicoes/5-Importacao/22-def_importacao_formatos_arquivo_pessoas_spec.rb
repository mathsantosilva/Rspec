describe 'cadastrar Formato de importação de pesssoas', :formato_pessoas do
  before(:each) do
    visit '/'

    #Aceitando os cookies
    find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click

    #Informações de login
    fill_in 'LogOnModel_UserName', with: $user_br
    fill_in 'LogOnModel_Password', with: $senha
    click_button 'Entrar'

    # Acessando o cadastro de Formato de pessoas pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 2
    find('div[class="pointer DropDownHeaderElement"]', text: 'Importação').click
    find('span[id="TabFuncionarios"]' , text: 'Pessoas').click
  end

  it 'CT022 Cadastro de formato de pessoa - Campos obrigatórios somente', :ct022_pessoas do

    #Adicionar cadastro de formato 
    find('label[class="pointer"]' , text:'Adicionar').click
    #Preencher código e descrição
    fill_in 'FormatoArquivoColetaApontamentos_Codigo' , with: '101'
    fill_in 'FormatoArquivoColetaApontamentos_Descricao' , with: 'Formato pessoas'
    #matrícula
    fill_in 'tbInicio1101' , with: '1'
    fill_in 'tbFim1101' , with: '15'
    #PIS
    fill_in 'tbInicio1102' , with: '61'
    fill_in 'tbFim1102' , with: '71'
    #Crachá
    fill_in 'tbInicio1103' , with: '16'
    fill_in 'tbFim1103' , with: '30'
    #Nome Completo
    fill_in 'tbInicio1104' , with: '31'
    fill_in 'tbFim1104' , with: '46'   
    #Data de Admissão
    fill_in 'tbInicio1107' , with: '47'
    fill_in 'tbFim1107' , with: '56'
    #Tipo de Salário
    fill_in 'tbInicio1113' , with: '57'
    fill_in 'tbFim1113' , with: '57'
    #Base horas
    fill_in 'tbInicio1114' , with: '58'
    fill_in 'tbFim1114' , with: '60'
    sleep 1
    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Formato de arquivo de importação de pessoas foi adicionado com sucesso'
  end
end

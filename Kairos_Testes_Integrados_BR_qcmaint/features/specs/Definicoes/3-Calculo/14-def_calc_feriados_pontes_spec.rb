describe 'feriados', :feriados_pontes do
  before(:each) do
    visit '/'

    #Aceitando os cookies
    find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
    sleep 2 

    fill_in 'LogOnModel_UserName', with: $user_br
    fill_in 'LogOnModel_Password', with: $senha
    click_button 'Entrar'
    
    # Acessando o cadastro de Feriado pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 2
    find('div[class="pointer DropDownHeaderElement"]', text: 'Cálculo').click

    #Fechar janela de ajuda
    sleep 2
    find('div[aria-label= "Fechar diálogo"]').click
  end

  it 'CT014 Inserir os campos da descrição do calculo', :ct014_calculo_descricao do
    fill_in 'FeriadosCreate_Descricao', with: 'feriado A'
    fill_in 'FeriadosCreate_Date', with: '10092021'
    drop = find('label[id=PlusButtonLabel]', match: :first)
    drop.click
    expect(find('form[id=FormFerias]')).to have_content 'O Feriado foi adicionado com sucesso'
     end
end

describe 'login', :login do
  it 'login com sucesso' do
    visit '/'
    sleep 1

    #Aceitando os cookies
    find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
    sleep 2

    fill_in 'LogOnModel_UserName', with: @login
    fill_in 'LogOnModel_Password', with: @senha

    click_button 'Entrar'
    find('img[class="DMPLogoHeader"]').click
    nome_empresa = find('div[class="TabMenuNomeEmpresa shortText"]')
    expect(nome_empresa).to have_content 'Empresa Br - Automação de testes - 17-08-2021 - 1101'
    sleep 2

    #Clicando no botão de deslogar
    selecionar = find('span[id="toogleUserName"]')
    selecionar.hover
    sleep 2
    find('span[style="line-height:20px;margin-left:4px;"]', text: 'Sair da aplicação').click
    sleep 2

  end
end

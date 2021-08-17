describe 'login', :login do
  it 'login com sucesso' do
    visit '/'

    fill_in 'LogOnModel_UserName', with: @login
    fill_in 'LogOnModel_Password', with: @senha

    click_button 'Entrar'
    find('img[class="DMPLogoHeader"]').click
    nome_empresa = find('div[class="TabMenuNomeEmpresa shortText"]')
    expect(nome_empresa).to have_content 'Empresa Br - Automação de testes - 17-08-2021 - 1101'
  end
end

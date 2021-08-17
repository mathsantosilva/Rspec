describe 'perfis do sistema', :perfil do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr08012021@dimep.com'
    fill_in 'LogOnModel_Password', with: 'dimep123'
    click_button 'Entrar'
    visit '/Perfis'
    visit '/Perfis/Create'
  end

  it 'CT001 Inserir um novo perfil', :ct001_perfil do
    fill_in 'Perfil_Descricao', with: 'abc'
    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Perfil foi adicionado com sucesso'
  end

  it 'CT002 Validar insercao de campos obrigatórios em perfis', :ct002_perfil do
    fill_in 'Perfil_Descricao', with: 'abc'
    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('span[data-valmsg-for="ModelEstruturaOrganizacional.Descricao"]')).to have_content 'Por favor adicione uma descrição'
  end
end

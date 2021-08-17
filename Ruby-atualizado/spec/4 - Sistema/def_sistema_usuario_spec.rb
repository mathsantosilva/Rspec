describe 'sistema do usuario', :usuario do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    visit '/admin/Usuarios'
    visit '/admin/GruposUsuarios'

  end

  it 'CT001 Inserir um novo usuário', :ct001_usuario do
    fill_in 'Grupo_Codigo', with: '1234'
    fill_in 'Grupo_Descricao', with: 'abcga'

    drop = find('.pointer', text: 'Adicionar', match: :first)
    drop.click
    sleep 5
  end

  it 'CT002 Validar insercao de campos obrigatórios do usuário', :ct002_usuario do
    fill_in 'Grupo_Codigo', with: ''
    fill_in 'Grupo_Descricao', with: ''

    drop = find('.pointer', text: 'Adicionar', match: :first)
    drop.click

    expect(find('span[data-valmsg-for="Grupo.Descricao"]')).to have_content 'Por favor adicione uma descrição'
    expect(find('span[data-valmsg-for="Grupo.Codigo"]')).to have_content 'Por favor adicione um código'
  end

  it 'CT003 Validar insercao de grupo existente', :ct003_usuario do
    fill_in 'Grupo_Codigo', with: '123'
    fill_in 'Grupo_Descricao', with: 'abc'

    drop = find('.pointer', text: 'Adicionar', match: :first)
    drop.click

    expect(find('span[data-valmsg-for="Grupo.Codigo"]')).to have_content 'Já existe um Grupo com essa descrição'
  end
end

describe 'sistema do usuario', :usuario do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr08012021@dimep.com'
    fill_in 'LogOnModel_Password', with: 'dimep123'
    click_button 'Entrar'
    visit '/Usuarios'
    visit '/Usuarios/Create'
  end

  it 'CT001 Inserir um novo usuário', :ct001_usuario do
    fill_in '  Grupo_Codigo', with: '123'
    fill_in ' Grupo_Descricao', with: 'abc'

    drop = find('.pointer', text: 'Adicionar', match: :first)
    drop.click
  end

    it 'CT002 Validar insercao de campos obrigatórios do usuário', :ct002_usuario do
      drop = find('.pointer', text: 'Adicionar', match: :first)
      drop.click
    
      expect(find('span[data-valmsg-for="Grupo.Descricao"]')).to have_content 'Por favor adicione uma descrição'
      expect(find('span[data-valmsg-for="Grupo.Codigo"]')).to have_content 'Por favor adicione um código'
    end

      it 'CT003 Validar insercao de grupo existente', :ct003_usuario do

        fill_in '  Grupo_Codigo', with: '123'
        fill_in ' Grupo_Descricao', with: 'abc'
    
        drop = find('.DivDescricaoEstrutura', text: 'Adicionar')
        drop.click

        expect(find('span[data-valmsg-for="Grupo.Codigo"]')).to have_content 'Já existe um Grupo com essa descrição'

    end
  end
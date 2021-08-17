describe 'configuração', :config_relogio do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/ConfiguracaoRelogio'
    visit '/admin/ConfiguracaoRelogio/Create'

  end

  it 'CT001 Valida os campos obrigatórios do relogio', :ct001_relogio do
    
    fill_in 'Codigo', with: '12233'
    fill_in 'Descricao', with: 'abcdz'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Configuração Relógio foi criada com sucesso'
  
  end

  it 'CT002 validar a inserção dos campos obrigatórios na configuração relógio', :ct002_relogio do
     
    fill_in 'Codigo', with: ''
    fill_in 'Descricao', with: ''

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('span[data-valmsg-for=Codigo]')).to have_content 'Por favor adicione um código'
    expect(find('span[data-valmsg-for=Descricao]')).to have_content 'Por favor adicione uma descrição'
 sleep 3
  end

    it 'CT003  Validar a existência de itens nos campos tipos configuração relógio', :ct003_relogio do
     
      fill_in 'Codigo', with: '12233'
      fill_in 'Descricao', with: 'abcdz'
  
      drop = find("input[type=submit][value='Salvar']", match: :first)
      drop.click
  
      expect(find('form[id=FormConfiguracaoRelogio]')).to have_content 'Já existe uma Configuração Relógio com essa descrição'
    end
  end

describe 'funcoes do relógio', :funcoes_relogio do
  before(:each) do
    visit '/Dimep/Account/LogOn?timeOutLoginComo=False'

    fill_in 'LogOnModel_UserName', with: 'migracaopt16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/FuncaoRelogio'
    visit '/admin/FuncaoRelogio/Create'
  end

  it 'CT011 Inserir novos campos funcoes relogio', :ct011_funcoes do
    fill_in 'FuncaoRelogio_Codigo', with: '1'
    fill_in 'FuncaoRelogio_Descricao', with: 'teste6749@dimep.com.br	'
    find('label[for="cbConsideraPonto1"]', visible: false).set(true)


    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Função do Relógio foi criada com sucesso'
  end
end

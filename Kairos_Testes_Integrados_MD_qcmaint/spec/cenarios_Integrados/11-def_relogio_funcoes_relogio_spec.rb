describe 'funcoes do relógio', :funcoes_relogio do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'migracaomd15042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/FuncaoRelogio'
    visit '/admin/FuncaoRelogio/Create'
  end

  it 'CT011 Inserir novos campos funcoes relogio', :ct011_funcoes do
    fill_in 'FuncaoRelogio_Codigo', with: '1110'
    fill_in 'FuncaoRelogio_Descricao', with: 'abczzz'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Função do Relógio foi criada com sucesso'
  end
end

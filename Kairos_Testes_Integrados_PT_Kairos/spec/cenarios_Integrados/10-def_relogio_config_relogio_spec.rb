describe 'configuração', :config_relogio do
  before(:each) do
    visit '/Dimep/Account/LogOn?timeOutLoginComo=False'


    fill_in 'LogOnModel_UserName', with: 'teste24052021@teste.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/ConfiguracaoRelogio'
    visit '/admin/ConfiguracaoRelogio/Create'
  end

  it 'CT010 Inserir uma nova config de relogio', :ct010_relogio do
    fill_in 'Codigo', with: '3'
    fill_in 'Descricao', with: 'teste6749@dimep.com.br'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Configuração Relógio foi criada com sucesso'
  end
end

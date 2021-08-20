describe 'perfis do sistema', :perfil do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'teste24052021@teste.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/Usuarios'
    visit '/admin/Perfis/Create'
  end

  it 'CT018 Inserir um novo perfil', :ct018_perfil do
    fill_in 'Perfil_Descricao', with: 'TESTE'
   # find('div[class="labelFormEdit"]', visible: false).set(true)
    page.find(:xpath, '//*[@id="j1_2"]/a/i[2]').click
    #find('span[id="101"]', visible: false).set(true)
    
    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'O Perfil foi criado com sucesso'
  end
end

describe 'grupos', :grupos do
  before(:each) do
    visit '/Dimep/Account/LogOn?timeOutLoginComo=False'

    fill_in 'LogOnModel_UserName', with: 'teste24052021@teste.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    visit '/admin/Grupos'
  end

  it 'CT004 Inserir um novo grupo', :ct004_grupos do
    fill_in 'Grupo_Codigo', with: '1'
    fill_in 'Grupo_Descricao', with: 'A'

    drop = find('.pointer', text: 'Adicionar', match: :first) # precisa manter o match para identificar o botão
    drop.click

    expect(find('form[id=FormGrupos]')).to have_content 'O Grupo foi criado com sucesso'
  end
end

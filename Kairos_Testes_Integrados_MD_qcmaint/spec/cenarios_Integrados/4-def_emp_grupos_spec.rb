describe 'grupos', :grupos do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'migracaomd15042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    visit '/admin/Grupos'
  end

  it 'CT004 Inserir um novo grupo', :ct004_grupos do
    fill_in 'Grupo_Codigo', with: '1231231'
    fill_in 'Grupo_Descricao', with: 'abca'

    drop = find('.pointer', text: 'Adicionar', match: :first) # precisa manter o match para identificar o botão
    drop.click

    expect(find('form[id=FormGrupos]')).to have_content 'O Grupo foi adicionado com sucesso'
  end
end

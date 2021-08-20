describe 'estrutura', :estrutura do
  before(:each) do
    visit '/Dimep/Account/LogOn?timeOutLoginComo=False'

    fill_in 'LogOnModel_UserName', with: 'migracaopt16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    visit '/admin/Estrutura'
  end

  it 'CT003 Inserir uma nova estrutura organizacional', :ct003_estrutura do
    fill_in 'ModelEstruturaOrganizacional_Descricao', with: 'Estrutura A'
    fill_in 'ModelEstruturaOrganizacional_Codigo', with: '1'

    drop = find('.DivDescricaoEstrutura', text: 'Principal')
    drop.click

    drop = find('.pointer', text: 'Adicionar', match: :first)
    drop.click

    expect(find('form[id=FormEstruturas]')).to have_content 'A Estrutura Organizacional foi criada com sucesso'
  end
end

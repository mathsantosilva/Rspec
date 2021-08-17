describe 'Cargos', :cargos do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'migracaomd15042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    
    visit '/admin/Cargos'
  end

  it 'CT005 Inserir um novo cargo', :ct005_cargo do
    fill_in 'Cargo_Codigo', with: '123174231'
    fill_in 'Cargo_Descricao', with: 'abcgdga'

    drop = find('.pointer', text: 'Adicionar', match: :first) # precisa manter o match para identificar o botão
    drop.click

    expect(find('form[id=FormCargos]')).to have_content 'O Cargo foi adicionado com sucesso'
  end
end

describe 'Cargos', :categoria do
  before(:each) do
    visit '/Dimep/Account/LogOn?timeOutLoginComo=False'

    fill_in 'LogOnModel_UserName', with: 'teste24052021@teste.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    
    visit '/admin/Cargos'
  end

  it 'CT005 Inserir um novo cargo', :ct005_categoria do
    fill_in 'Cargo_Codigo', with: '30000000'
    fill_in 'Cargo_Descricao', with: 'CEO'

    drop = find('.pointer', text: 'Adicionar', match: :first) # precisa manter o match para identificar o botão
    drop.click

    expect(find('form[id=FormCargos]')).to have_content 'A Categoria Profissional foi criada com sucesso'
  end
end

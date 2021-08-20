describe 'feriados', :feriados_pontes do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'migracaomd15042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    
    visit '/admin/FeriadosPontes'
  end

  it 'CT014 Inserir os campos da descrição do calculo', :ct014_calculo_descricao do
    fill_in 'FeriadosCreate_Descricao', with: 'feriado A'
    fill_in 'FeriadosCreate_Date', with: '10092021'
    drop = find('label[id=PlusButtonLabel]', match: :first)
    drop.click
    expect(find('form[id=FormFerias]')).to have_content 'O Feriado foi adicionado com sucesso'
     end
end

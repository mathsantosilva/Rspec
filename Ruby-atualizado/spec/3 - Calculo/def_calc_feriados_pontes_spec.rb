describe 'feriados', :feriados_pontes do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'
    fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    visit '/admin/FeriadosPontes'
  end

  it 'CT001 validar a insercao de campos obrigatórios da descrição do calculo', :ct001_calculo_descricao do
    fill_in 'FeriadosCreate_Descricao', with: 'feriado A'
    fill_in 'FeriadosCreate_Date', with: '10092021'
    drop = find('label[id=PlusButtonLabel]', match: :first)
    drop.click
    expect(find('form[id=FormFerias]')).to have_content 'O Feriado foi adicionado com sucesso'
    sleep 5
  end

  it 'CT002 valida os campos obrigatórios da descrição do calculo', :ct002_calculo_descricao do
    fill_in 'FeriadosCreate_Descricao', with: ''
    fill_in 'FeriadosCreate_Date', with: ''
    drop = find('label[id=PlusButtonLabel]', match: :first)
    drop.click
    expect(find("span[data-valmsg-for='FeriadosCreate.Date']")).to have_content 'Por favor introduza uma data'
    expect(find("span[data-valmsg-for='FeriadosCreate.Descricao']")).to have_content 'Por favor adicione uma descrição'
  end

  it 'CT003 valida os campos existentes da descrição do calculo', :ct003_calculo_descricao do
    fill_in 'FeriadosCreate_Descricao', with: 'feriado A'
    fill_in 'FeriadosCreate_Date', with: '10092021'
    drop = find('label[id=PlusButtonLabel]', match: :first)
    drop.click
    expect(find('form[id=FormFerias]')).to have_content 'Já existe um Feriado com a mesma data'
  end
end

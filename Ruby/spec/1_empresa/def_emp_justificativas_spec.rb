describe 'justificativas', :justificativas do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr08012021@dimep.com'
    fill_in 'LogOnModel_Password', with: 'dimep123'
    click_button 'Entrar'

    visit '/admin/Justificativas'
    visit '/admin/Justificativas/Create'
  end

  it 'CT001 Validar inserção de uma nova justificatica', :ct001_justificativas do
    fill_in 'Justificativa_Codigo', with: '123'
    fill_in 'Justificativa_Descricao', with: 'abc'
    find('label[for="EnviaBancoHoraManual_true"]', :visible=>false).set(true) 
    select('Rendimento', from: 'Justificativa_Tipo_Id').select_option

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Justificativa foi criada com sucesso'
  end

  it 'CT002 Validar inserção de campos obrigatórios na justificativa', :ct002_justificativas do
    fill_in 'Justificativa_Codigo', with: ''
    fill_in 'Justificativa_Descricao', with: ''
    select('Rendimento', from: 'Justificativa_Tipo_Id').select_option

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('span[for=Justificativa_Codigo]')).to have_content 'Por favor adicione um código'
    expect(find('span[for=Justificativa_Descricao]')).to have_content 'Por favor adicione uma descrição'
  end
end

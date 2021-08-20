describe 'justificativas', :justificativas do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'migracaomd15042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/Justificativas'
    visit '/admin/Justificativas/Create'
  end

  it 'CT006 Inserir uma nova justificatica', :ct006_justificativas do
    fill_in 'Justificativa_Codigo', with: '123'
    fill_in 'Justificativa_Descricao', with: 'abc'
    select('Rendimento', from: 'Justificativa_Tipo_Id').select_option
    find('label[for="EnviaBancoHoraManual_true"]', visible: false).set(true)
    select('Rendimento', from: 'Justificativa_Tipo_Id').select_option

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Justificativa foi criada com sucesso'
  end
end

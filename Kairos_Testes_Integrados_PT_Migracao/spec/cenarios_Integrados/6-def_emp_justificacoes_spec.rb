describe 'justificacoes', :justificacoes do
  before(:each) do
    visit '/Dimep/Account/LogOn?timeOutLoginComo=False'

    fill_in 'LogOnModel_UserName', with: 'migracaopt16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/Justificativas'
    visit '/admin/Justificativas/Create'
  end

  it 'CT006 Inserir uma nova justificatica', :ct006_justificacoes do
    fill_in 'Justificativa_Codigo', with: '9'
    fill_in 'Justificativa_Descricao', with: 'TESTE'
    select('Rendimento', from: 'Justificativa_Tipo_Id').select_option
    find('label[for="EnviaBancoHoraManual_false"]', visible: false).set(true)
    select('Horas DSR', from: 'IdEventoCredito').select_option

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Justificação foi criada com sucesso'
  end
end

describe 'regras', :regras do
  before(:each) do
    visit '/Dimep/Account/LogOn?timeOutLoginComo=False'

    fill_in 'LogOnModel_UserName', with: 'migracaopt16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/RegrasAprovacao'
    visit '/admin/RegrasAprovacao/Create'
  end

  it 'CT009 Inserir uma nova regra', :ct009_regras do
    fill_in 'Regra_Codigo', with: '12387125'
    fill_in 'Regra_Nome', with: '&)(&@$dagfsb123'
    fill_in 'Regra_NumDiasLimite', with: '10'
    find('span[id="1"]', visible: false).set(true)

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[class=validation-summary-ok]')).to have_content 'A Regra foi criada com sucesso'
  end
end

describe 'regras', :regras do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/RegrasAprovacao'
    visit '/admin/RegrasAprovacao/Create'
  end

  it 'CT001 Inserir uma nova estrutura organizacional', :ct001_regras do
    fill_in 'Regra_Codigo', with: '12387125'
    fill_in 'Regra_Nome', with: '&)(&@$dagfsb123'
    fill_in 'Regra_NumDiasLimite', with: '10'
    find('span[id="1"]', visible: false).set(true)

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click

    expect(find('div[class=validation-summary-ok]')).to have_content 'A Regra foi criada com sucesso'

    sleep 3
  end

  it 'CT002 Validar inserção de campos nas regras da empresa', :ct002_regras do
    fill_in 'Regra_Codigo', with: ''
    fill_in 'Regra_Nome', with: ''
    find('span[id="1"]', visible: false)
    fill_in 'Regra_NumDiasLimite', with: ''
    sleep 3

    drop = find("input[type=button][value='Salvar']", match: :first)
    drop.click
    expect(find("span[class=field-validation-error][data-valmsg-for='Regra.Codigo']")).to have_content 'O campo Código é obrigatório'
    expect(find("span[class=field-validation-error][data-valmsg-for='Regra.Nome']")).to have_content 'O campo Nome é obrigatório'
    expect(find("span[class=field-validation-error][data-valmsg-for='Regra.NumDiasLimite']")).to have_content 'O campo Número de dias máximo para aprovação é obrigatório'
    expect(find("span[class=field-validation-error][data-valmsg-for='Regra.IdEstrutura']")).to have_content 'O campo Estrutura é obrigatório'
  end
end

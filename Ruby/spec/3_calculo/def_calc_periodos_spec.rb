describe 'periodo', :periodos do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr08012021@dimep.com'
    fill_in 'LogOnModel_Password', with: 'dimep123'
    click_button 'Entrar'

    visit '/admin/Periodos'
  end

  it 'CT001 validar a inserção de campos no periodo do calculo', :ct001_validar_periodos do
    fill_in 'tbPeriodoAtualFim', with: '26012021'

    drop = find("input[type=submit][value='Fechar']", match: :first)
    drop.click

    expect(find('div .validation-summary-ok')).to have_content 'Período fechado com sucesso.'
  end

  it 'CT002 validar a inserção de campos no periodo do calculo', :ct002_validar_periodos do
    fill_in 'tbPeriodoAtualFim', with: ''

    drop = find("input[type=submit][value='Fechar']", match: :first)
    drop.click

    expect(find('div .field-validation-error]')).to have_content 'Data de fim inválida. A data de fim
  tem de pertencer ao passado, e tem de ser posterior à data de início.'
  
  end
end

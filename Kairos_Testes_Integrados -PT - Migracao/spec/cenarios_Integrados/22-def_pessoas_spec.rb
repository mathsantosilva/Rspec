describe 'cadastrar novas pesssoas', :pessoas do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'migracaopt16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    
    visit '/admin/Pessoas/Create'
  end

  it 'CT022 Inserir uma nova pessoa', :ct022_pessoas do
    fill_in 'CreateModel_Nome', with: 'TESTE'
    fill_in 'CreateModel_Matricula', with: '123'
    fill_in 'CreateModel_Cracha', with: '127543'
    select('Estrutura A', from: 'chzn-container chzn-container-single chzn-container-active chzn-with-drop').select_option
    

    # Nestes itens precisa localizar os códigos corretos para finalizar o cadastro pessoa 

    # fill_in 'CreateModel_EstruturaCodigo', with: 'Estrutura A'
    # fill_in 'CreateModel_HorarioId', with: 'Horário Padrão'
    # fill_in 'CreateModel_RegraCalculoCodigo', with: 'Padrão'

    fill_in 'CreateModel_BaseHoras', with: '123'
    select('Estagiário', from: 'CreateModel_TipoFuncionarioCodigo').select_option   
    fill_in 'CreateModel_NomeEmpresa', with: 'eqwv'
    fill_in 'CreateModel_TelefoneEmpresa', with: '12364363'  
    fill_in 'CreateModel_ContatoEmpresa', with: 'Principal'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'Pessoa registado com sucesso.'
  end
end

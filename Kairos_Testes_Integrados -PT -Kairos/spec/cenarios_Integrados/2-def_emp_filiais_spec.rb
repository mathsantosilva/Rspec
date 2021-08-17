describe 'filial', :filiais do
  before(:each) do
    visit '/Dimep/Account/LogOn?timeOutLoginComo=False'

    fill_in 'LogOnModel_UserName', with: 'teste24052021@teste.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'

    visit '/admin/Filiais'
    visit '/admin/Filiais/Create'
  end

  it 'CT002 Inserir uma nova filial', :ct002_filial do
    fill_in 'Filial_Codigo', with: '12'
    fill_in 'Filial_Telefone', with: '11'
    fill_in 'Filial_Descricao', with: 'SPRINT56PT - 3'
    fill_in 'Filial_CnpjCpf', with: '54518693000138'
    fill_in 'Filial_Endereco', with: 'TESTE'
    fill_in 'Filial_Cidade', with: 'PORTO'
    fill_in 'Filial_Pais', with: 'PORTUGAL'
    fill_in 'Filial_URL', with: 'http://abc.com.br'
    fill_in 'Filial_Email', with: 'abc@abc.com'
    select('UTC -10', from: 'Filial_FusoHorario_Id').select_option
    fill_in 'Filial_DataPrevisaoProximoFechamento', with: '10032021'
    fill_in 'Filial_DataLimiteTratamentoPonto', with: '11042021'
    fill_in 'ConnectChave_ChaveConnect', with: 'jkl471<>¨&*!$'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click
    sleep 2

    expect(find('div[class=validation-summary-ok]')).to have_content 'A Filial foi criada com sucesso'
  end
end
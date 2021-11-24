require 'common\common'
common = Common.new

describe 'criacao filial', :filial_create do
  before(:each) do
    visit '/'

    find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
    sleep 1

    # Acessando a empresa filial pela navegação de telas
    common.logon_br

    # Acessando o cadastro da empresa filial pela navegação de telas
    common.nav('Empresa','div[id="MenuFiliais"')

  end

  it 'Cadastrar uma nova filial' do

    find('label[class="pointer"]').click

    fill_in 'Filial_Codigo', with: $codigo_aleatorio
    fill_in 'Filial_Telefone', with: '999999999'
    fill_in 'Filial_Descricao', with: $nome_empresa_aleatoria + ' ' + $time.to_s
    fill_in 'Filial_CnpjCpf', with: $cnpj
    fill_in 'Filial_Endereco', with: $endereco_aleatorio
    fill_in 'Filial_Cidade', with: $cidade_aleatoria
    fill_in 'Filial_Bairro', with: 'Vila Borges'
    fill_in 'Filial_UF', with: 'SP'
    fill_in 'Filial_Pais', with: $pais_aleatorio
    fill_in 'Filial_URL', with: 'http://filial.com.br'
    fill_in 'Filial_Email', with: $email_aleatorio
    select('UTC -10', from: 'Filial_FusoHorario_Id').select_option
    find('label[for="checkHabilitaHorarioVerao"]', visible: false).set(true)
    fill_in 'Filial.InicioHorarioVerao', with: '10062021'
    fill_in 'Filial_FimHorarioVerao', with: '11092021'
    fill_in 'Filial_DataPrevisaoProximoFechamento', with: '10032021'
    fill_in 'Filial_DataLimiteTratamentoPonto', with: '11042021'
    fill_in 'ConnectChave_ChaveConnect', with: 'jkl471<>¨&*!$'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click
    sleep 2

    expect(find('div[class=validation-summary-ok]')).to have_content 'A Filial foi criada com sucesso'
  end
end
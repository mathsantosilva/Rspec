require 'common\common'
require 'common\complements'
common = Common.new
complements = Complements.new

describe 'Cargos', :cargo_create do
  before(:each) do
    visit '/'
    expect(page.title).to eql 'kairos'
    # Realiza login
    common.logon_br
    # Acessando a tela de cargos pela navegacao de telas
    common.nav('Empresa', 'div[id="MenuCargos"]')
    # Carrega as variaveis utilizadas nas spec
    complements.varcadastro
 
  end

  it 'Inserir um novo cargo', :cargo_create_1 do
    fill_in 'Cargo_Codigo', with: $codigo_aleatorio
    fill_in 'Cargo_Descricao', with: $nome_empresa_aleatoria

    drop = find('.pointer', text: 'Adicionar', match: :first) # precisa manter o match para identificar o botão
    drop.click

    expect(find('form[id=FormCargos]')).to have_content 'O Cargo foi adicionado com sucesso'
  end
end

require 'common\common'
require 'common\complements'
common = Common.new
complements = Complements.new

describe 'Cargos', :cargo_update do
  before(:each) do
    visit '/'
    expect(page.title).to eql 'kairos'
    # Realiza login
    common.logon_br
    # Acessando a tela de cargos pela navegacao de telas
    common.nav('Empresa', 'div[id="MenuCargos"]')
    # Carrega as variaveis utilizadas nas spec
    complements.varcadastro
    common.remove_chat
    #  common.select_button('table[class="ContentTable"]','img[class="pointer icons editIcon"]')

  end

  it 'Alteração de cargo', :cargo_update_direto do
    within('table tbody tr' , text: 'Kunze LLC') do
      selecionar = find('td[style="width: 270px; min-width: 280px;"]')
      selecionar.hover 

      find('span[class="spanButtonText"]', text: 'Alterar').click
    
    end
      
    fill_in 'Cargo_Codigo', with: $codigo_aleatorio
    fill_in 'Cargo_Descricao', with: $nome_empresa_aleatoria
    drop = find('label[class="pointer"]', text: 'Alterar') 
    drop.click
    
    expect(find('form[id=FormCargos]')).to have_content 'Cargo editado com sucesso'
  end
end

  
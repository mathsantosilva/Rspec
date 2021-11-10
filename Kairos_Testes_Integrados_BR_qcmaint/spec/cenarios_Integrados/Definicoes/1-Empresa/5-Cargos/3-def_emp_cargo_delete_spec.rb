
describe 'Cargos', :cargo_delete do
  require 'common\common'
  common = Common.new
  
  before(:each) do
    visit '/'
    expect(page.title).to eql 'kairos'
    # Realiza login
    common.logon_br
    # Acessando a tela de cargos pela navegacao de telas
    common.nav('Empresa', 'div[id="MenuCargos"]')
    # Carrega as variaveis utilizadas nas spec
    common.remove_chat
    #  common.select_button('table[class="ContentTable"]','img[class="pointer icons editIcon"]')

    end
  
    it 'Alteração de cargo', :cargo_delete_d do
        within('table tbody tr' , text: 'Kunze LLC') do
         selecionar = find('td[style="width: 270px; min-width: 280px;"]')
         selecionar.hover
         find('span[class="btnDeleteDeleteCargo pointer spanButton tooltip"]', text: 'Remover').click
        end

        find('span[class="PlusButton pointer"]').click
      expect(find('form[id=FormCargos]')).to have_content 'O Cargo foi removido com sucesso'
    end
  end
  
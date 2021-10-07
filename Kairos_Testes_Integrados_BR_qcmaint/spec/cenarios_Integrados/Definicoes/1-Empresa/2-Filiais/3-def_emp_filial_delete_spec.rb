require 'common\common'
common = Common.new

describe 'filial', :deletando_filial do
    before(:each) do
      visit '/'

      sleep 1
      find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
  
      common.logon_br
  
      # Acessando a empresa filial pela navegação de telas
      common.nav('Empresa','div[id="MenuFiliais"')

      common.remove_chat

  
    end

    it "Removendo a empresa filial" do

        common.select_button('table[class="ContentTable"]','img[class="pointer icons deleteIcon"]')

        common.confir_remover

        msg = find('div[class="validation-summary-ok"]')
        expect(msg).to have_content 'A Filial foi removida com sucesso'

    end

end
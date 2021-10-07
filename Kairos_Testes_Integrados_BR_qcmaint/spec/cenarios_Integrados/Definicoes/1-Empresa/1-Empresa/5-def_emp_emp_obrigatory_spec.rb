require 'common\common'
common = Common.new

describe 'Validando Resource em Português - BR', :empresa_resource_br do
    before(:each) do
      visit '/'

      fill_in 'LogOnModel_UserName', with: $user_br
      fill_in 'LogOnModel_Password', with: @senha
      click_button 'Entrar'
      
      # Acessando a empresa pela navegação de telas
      common.nav('Empresa')
    end

    it 'No Create', :resource_crate_br do
      #removendo chat da tela
      common.remove_chat()

      #acessar a criação de empresas
      find('label[class="pointer"]').click



    end  

    it 'No Update', :resource_update_br do
      #Acessar a edição de empresas
      common.select_button('table tbody tr', 'Empresa Br - Automação de testes - 17-08-2021 - 1101')

    end  
  end
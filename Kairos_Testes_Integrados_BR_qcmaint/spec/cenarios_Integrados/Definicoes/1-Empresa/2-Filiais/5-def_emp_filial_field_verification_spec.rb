require 'common\common'
require 'common\campos_obrigatorios'

common = Common.new
obrigatorio = Obrigatorios.new

describe 'Verificação dos campos', :field_verification_filial do

    describe 'Obrigatoriedades', :field_obrigatoriedade do
        before(:each) do

            visit '/'

            find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
            sleep 1

            # Acessando a empresa filial pela navegação de telas
            common.logon_br

            # Acessando o cadastro da empresa filial pela navegação de telas
            common.nav('Empresa','div[id="MenuFiliais"')

        
        end

        it 'Campos Obrigatorios Filial' do

            obrigatorio.camp_obrig_filiais()

        end
    end

    #Valor limite
    
    #Tipo de caracteres
    
end
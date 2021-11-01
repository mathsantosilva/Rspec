require 'common\common'
require 'common\campos_obrigatorios'
require 'common\cadastros_empresas'

common = Common.new
obrigatorio = Obrigatorios.new
cadas_emp = Cadastros.new
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

    describe 'Tipos de caracteres', :field_tipos_carateres do
        before(:each) do

            visit '/'

            find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
            sleep 1

            # Acessando a empresa filial pela navegação de telas
            common.logon_br

            # Acessando o cadastro da empresa filial pela navegação de telas
            common.nav('Empresa','div[id="MenuFiliais"')
        
        end

        it 'Tipos de caracteres' do

            cadas_emp.cadas_emp_filial_especiais()
            
        end
    end

    describe 'Valores limites', :field_valores_limites do
        before(:each) do

            visit '/'

            find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
            sleep 1

            # Acessando a empresa filial pela navegação de telas
            common.logon_br

            # Acessando o cadastro da empresa filial pela navegação de telas
            common.nav('Empresa','div[id="MenuFiliais"')
        
        end

        it 'Valores Limites' do

            cadas_emp.cadas_emp_filial_val_limites()
            
        end
    end
    
end
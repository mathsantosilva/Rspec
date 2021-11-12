require 'common\common'
require 'common\complements'
common = Common.new
complements = Complements.new


describe 'Verificação dos campos', :field_verification do
    describe 'Obrigatoriedade', :field_obrigatory do
        before(:each) do
            visit '/'
            expect(page.title).to eql 'kairos'
            # Realiza Login
            common.logon_br
            # Acessando a empresa pela navegação
            common.nav('Empresa', 'div[id="MenuEmpresas"]')
            # Carrega as variaveis utilizadas nas spec
            complements.varcommon
        end

        it 'Obrigatoriedade' do
            find('label[class="pointer"]').click
            drop = find("input[type=button][value='Salvar']", match: :first)
            drop.click

            # Valida quantos campos ficam com a classe
            expect(page.assert_selector('input.input-validation-error', count: 9))

            # Valida as mensagem de erro
            expect(page).to have_content 'Por favor adicione um código'
            expect(page).to have_content 'Por favor introduza um telefone'
            expect(page).to have_content 'Por favor introduza uma razão social'
            expect(page).to have_content 'Por favor introduza um CNPJ/CPF'
            expect(page).to have_content 'Por favor introduza um endereço'
            expect(page).to have_content 'Por favor introduza uma cidade'
            expect(page).to have_content 'Por favor introduza o dia de abertura do período.'
            expect(page).to have_content 'Por favor introduza um bairro'
            expect(page).to have_content 'Por favor introduza um UF'

        end

        it 'Valor limite', :field_valor_limite do
            find('label[class="pointer"]').click
            fill_in 'Empresa_Codigo', with: '11111111111111111111'
            fill_in 'Empresa_CEI', with: '294226088484'
            fill_in 'Empresa_Telefone', with: '111111111111111111111'
            fill_in 'Empresa_RazaoSocial', with: 'Não tem Limite'
            fill_in 'Empresa_CnpjCpf', with: $cnpj
            fill_in 'Empresa_Endereco', with: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
            fill_in 'Empresa_Bairro', with: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
            fill_in 'Empresa_Cidade', with: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
            fill_in 'Empresa_UF', with: 'xxxxxxxxxx'
            fill_in 'Empresa_Pais', with: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
            fill_in 'Empresa_URL', with: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
            fill_in 'Empresa_Email', with: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx@xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.com.brrrrrrrrrrr'
            fill_in 'Empresa_DataAbertura', with: '01012021'
            fill_in 'connectChave_ChaveConnect', with: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
            
        end

        it 'Tipo de caracteres', :field_tipo_cartere do
            find('label[class="pointer"]').click
            fill_in 'Empresa_Codigo', with: '1a2b3c4!5@6#7$8%9¨&*()?:><'
            fill_in 'Empresa_CEI', with: '294226088484'
            fill_in 'Empresa_Telefone', with: '132a2b3c4!5@6#7$8%9¨10&11*12(13)14?15:16>17<'
            fill_in 'Empresa_RazaoSocial', with: '123456789teste'
            fill_in 'Empresa_CnpjCpf', with: $cnpj
            fill_in 'Empresa_Endereco', with: "1a2b3c4d5e6f7g8h9i1j0k1l1m1n1o1p1q1r1s1t1u1v1x1w1y1z1!@#$%¨&*()?:><^}{`|'11111111111111111111111111111111111111111111111111111222222222222222222222222222222222222222222222222222222222222222222223333"
            fill_in 'Empresa_Bairro', with: "1a2b3c4d5e6f7g8h9i1j0k1l1m1n1o1p1q1r1s1t1u1v1x1w1y1z1!@#$%¨&*()?:><^}{`|'11111"
            fill_in 'Empresa_Cidade', with: "1a2b3c4d5e6f7g8h9i1j0k1l1m1n1o1p1q1r1s1t1u1v1x1w1y1z1!@#$%¨&*()?:><^}{`|'11111"
            fill_in 'Empresa_UF', with: "1a"
            fill_in 'Empresa_Pais', with: "1a2b3c4d5e6f7g8h9i1j0k1l1m1n1o1p1q1r1s1t1u1v1x1w1y"
            fill_in 'Empresa_URL', with: "1a2b3c4d5e6f7g8h9i1j0k1l1m1n1o1p1q1r1s1t1u1v1x1w1y1z1!@#$%¨&*()?:><^}{`|'11111111111111111111111111111111111111111111111111111222222222222222222222222222222222222222222222222222222222222222222223333"
            fill_in 'Empresa_Email', with: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx@xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.com.br"
            fill_in 'Empresa_DataAbertura', with: '01012021'
            fill_in 'connectChave_ChaveConnect', with: "1a2b3c4d5e6f7g8h9i1j0k1l1m1n1o1p"
            
            drop = find("input[type=button][value='Salvar']", match: :first)
            drop.click
        end
    end
end
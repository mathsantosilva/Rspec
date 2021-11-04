require 'common\complements'
require 'common\common'

class Cadastros

    #inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
    include Capybara::DSL
    include RSpec::Matchers

    complements = Complements.new
    common = Common.new

    complements.varcommon
    complements.varcadastro

    #Cadastro de empresas filiais
    def cadas_emp_filial ()

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
        fill_in 'ConnectChave_ChaveConnect', with: $chave_aleatoria

        drop = find("input[type=submit][value='Salvar']", match: :first)
        drop.click
        sleep 2

        expect(find('div[class=validation-summary-ok]')).to have_content 'A Filial foi criada com sucesso'

    end

    #Cadastro de empresas filiais com caracteres especiais
    def cadas_emp_filial_especiais ()

        find('label[class="pointer"]').click

        fill_in 'Filial_Codigo', with: '"!@#$%¨&*()_we'
        fill_in 'Filial_Telefone', with: '"!@#$%¨&*()_we'
        fill_in 'Filial_Descricao', with: '"!@#$%¨&*()_we' + ' ' + $time.to_s
        fill_in 'Filial_CnpjCpf', with: '"!@#$%¨&*()_we'
        fill_in 'Filial_Endereco', with: '"!@#$%¨&*()_we'
        fill_in 'Filial_Cidade', with: '"!@#$%¨&*()_we'
        fill_in 'Filial_Bairro', with: '"!@#$%¨&*()_we'
        fill_in 'Filial_UF', with: '$0'
        fill_in 'Filial_Pais', with: '"!@#$%¨&*()_we'
        fill_in 'Filial_URL', with: '"!@#$%¨&*()_we'
        fill_in 'Filial_Email', with: '"!@#$%¨&*()_we"!@#$%¨&*()_we.com'
        select('UTC -10', from: 'Filial_FusoHorario_Id').select_option
        find('label[for="checkHabilitaHorarioVerao"]', visible: false).set(true)
        fill_in 'Filial.InicioHorarioVerao', with: '10062021'
        fill_in 'Filial_FimHorarioVerao', with: '11092021'
        fill_in 'Filial_DataPrevisaoProximoFechamento', with: '10032021'
        fill_in 'Filial_DataLimiteTratamentoPonto', with: '11042021'
        fill_in 'ConnectChave_ChaveConnect', with: '"!@#$%¨&*()_we'

        drop = find("input[type=submit][value='Salvar']", match: :first)
        drop.click
        sleep 2

        expect(page.assert_selector('input.input-validation-error', count: 2))

        expect(page).to have_content 'Por favor adicione um código'
        expect(page).to have_content 'Email inválido'

        fill_in 'Filial_Codigo', with: $codigo_aleatorio
        fill_in 'Filial_Email', with: $email_aleatorio

        drop = find("input[type=submit][value='Salvar']", match: :first)
        drop.click

        expect(find('div[class=field-validation-error]')).to have_content 'CNPJ/CPF inválido'


        fill_in 'Filial_CnpjCpf', with: $cnpj

        drop = find("input[type=submit][value='Salvar']", match: :first)
        drop.click

        expect(find('div[class=validation-summary-ok]')).to have_content 'A Filial foi criada com sucesso'
        
    end

    #Cadastro de empresas filiais valores limites
    def cadas_emp_filial_val_limites ()

        find('label[class="pointer"]').click

        fill_in 'Filial_Codigo', with: $codigo_aleatorio
        fill_in 'Filial_Telefone', with: '1111111111111111111100'
        fill_in 'Filial_Descricao', with: 'Teste valores limites'
        fill_in 'Filial_CnpjCpf', with: $cnpj
        fill_in 'Filial_Endereco', with: $endereco_aleatorio
        fill_in 'Filial_Cidade', with: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxooo'
        fill_in 'Filial_Bairro', with: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxooo'
        fill_in 'Filial_UF', with: 'xxooo'
        fill_in 'Filial_Pais', with: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxooo'
        fill_in 'Filial_URL', with: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxooo'
        fill_in 'Filial_Email', with: 'xxxxxxxxxxxxxxxxxxxxxxxxxx@xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.comooo'
        select('UTC -10', from: 'Filial_FusoHorario_Id').select_option
        find('label[for="checkHabilitaHorarioVerao"]', visible: false).set(true)
        fill_in 'Filial.InicioHorarioVerao', with: '10062021'
        fill_in 'Filial_FimHorarioVerao', with: '11092021'
        fill_in 'Filial_DataPrevisaoProximoFechamento', with: '10032021'
        fill_in 'Filial_DataLimiteTratamentoPonto', with: '11042021'
        fill_in 'ConnectChave_ChaveConnect', with: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxooo'

        drop = find("input[type=submit][value='Salvar']", match: :first)
        drop.click
        sleep 2

        expect(find('div[class=validation-summary-ok]')).to have_content 'A Filial foi criada com sucesso'


    end

    #salvar com quantidade a mais do permitido e depois verificar se o que foi salvo foi a quantidade certa EX: permitw 100 coloquei pra digirar 102 e ver ser o que foi salvo foi com 100

end
class Cadastros

    #inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
    include Capybara::DSL
    include RSpec::Matchers


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

        fill_in 'Filial_Codigo', with: $codigo_aleatorio
        fill_in 'Filial_Telefone', with: '"!@#$%¨&*()_we'
        fill_in 'Filial_Descricao', with: '"!@#$%¨&*()_we' + ' ' + $time.to_s
        fill_in 'Filial_CnpjCpf', with: $cnpj
        fill_in 'Filial_Endereco', with: '"!@#$%¨&*()_we'
        fill_in 'Filial_Cidade', with: '"!@#$%¨&*()_we'
        fill_in 'Filial_Bairro', with: '"!@#$%¨&*()_we'
        fill_in 'Filial_UF', with: '$0'
        fill_in 'Filial_Pais', with: '"!@#$%¨&*()_we'
        fill_in 'Filial_URL', with: '"!@#$%¨&*()_we'
        fill_in 'Filial_Email', with: '"!@#$%¨&*()_we@"!@#$%¨&*()_we.com'
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

        expect(find('span[class=field-validation-error]')).to have_content 'Email inválido'

        #incluir validação para salvar com o CNPJ com caracteres especiais e colocar pra salvar mais uma vez com o CNPJ e EMAIL valido

    end

    #Cadastro de empresas filiais valores limites
    def cadas_emp_filial_val_limites ()

        find('label[class="pointer"]').click

        fill_in 'Filial_Codigo', with: $codigo_aleatorio
        fill_in 'Filial_Telefone', with: '911111111111111111111'
        fill_in 'Filial_Descricao', with: $nome_empresa_aleatoria + ' ' + $time.to_s
        fill_in 'Filial_CnpjCpf', with: $cnpj
        fill_in 'Filial_Endereco', with: $endereco_aleatorio
        fill_in 'Filial_Cidade', with: 'paaaaaaaaaaaaaaaaaaaggggggggggggggggggggggggaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaagggg'
        fill_in 'Filial_Bairro', with: 'paaaaaaaaaaaaaaaaaaaggggggggggggggggggggggggggaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        fill_in 'Filial_UF', with: 'pSP'
        fill_in 'Filial_Pais', with: 'paaaaaaaaaaaaaaaagggggggggggggggggggggggaaaaaaaaaaa'
        fill_in 'Filial_URL', with: 'paaaaaaaaaaaaaaaaaaaafffffffffffffffffffggggggggggggggggggggggggggaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaggggggggggggggggggggggggggggggggaaaaaaaaaaaaaaaaaaaaaaaaaaaggggggggggggggggggggggaaaaaaaaaaaaaaaaaaaaaa'
        fill_in 'Filial_Email', with: 'paaaaaaaaaaaaaaaaaaaaaa@agggggggggggggggggggggggggggggaaaaaaaaaaaaaaaaaaaaaag.com'
        select('UTC -10', from: 'Filial_FusoHorario_Id').select_option
        find('label[for="checkHabilitaHorarioVerao"]', visible: false).set(true)
        fill_in 'Filial.InicioHorarioVerao', with: '10062021'
        fill_in 'Filial_FimHorarioVerao', with: '11092021'
        fill_in 'Filial_DataPrevisaoProximoFechamento', with: '10032021'
        fill_in 'Filial_DataLimiteTratamentoPonto', with: '11042021'
        fill_in 'ConnectChave_ChaveConnect', with: 'paaaaaaaaaaaaaaaaaagggggggggggggg'

        drop = find("input[type=submit][value='Salvar']", match: :first)
        drop.click
        sleep 2

        expect(find('div[class=validation-summary-ok]')).to have_content 'A Filial foi criada com sucesso'

    end

end
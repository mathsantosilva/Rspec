class Resources
    var campos_empresa['Código:',
        'CEI:',
        'Telefone:',
        'Utiliza portaria 1510:',
        'Razão Social:',
        'CNPJ/CPF:',
        'Ramo de atividade:',
        "AGRICULTURA, PECUÁRIA, PRODUÇÃO FLORESTAL, PESCA E AQÜICULTURA",
        'Endereço:',
        'Bairro:',
        'Cidade:',
        'UF:',
        'País:',
        'URL:',
        'Email:',
        'Dia de abertura do período:',
        'Fuso horário:',
        'Horário de verão:',
        'Início horário de verão:',
        'Fim horário de verão:',
        'Data de Previsão do Próximo Fechamento:',
        'Data Limite para Tratamento de Ponto:',
        'Alteração Automática',
        'Chave do Kairos Connect :',
        'Chave pública para geração de Comprovante de Ponto:',
        'Logotipo personalizado:','Localização:']

    def validandoCampos 
        op = 0
        tamanho = campos_empresa.length
        puts tamanho
        tamanho.times do
            cadastros_empresas[op]
            op = op ++1
            return cadastros_empresas
        end
    end

end
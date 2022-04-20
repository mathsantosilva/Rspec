class Resources

    include Capybara::DSL
    include RSpec::Matchers
    $campos_empresa_portugues_br = [
        'Código:',
        'CEI/CNO/CAEPF:',
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
        'Logotipo personalizado:',
        'Localização:',
        'Adendo LGPD:']

    $campos_empresa_ingles = [
        'Code:',
        'CEI/CNO/CAEPF:',
        'telephone:',
        'According to the law 1510:',
        'Company Name:',
        'CNPJ/CPF:',
        'Hive of activity:',
        'Address:',
        'Neighborhood:',
        'City:',
        'State:',
        'Country:',
        'URL:',
        'E-mail:',
        'Opening day of the period:',
        'Time zone:',
        'DST:',
        'Home DST:',
        'End Daylight Saving Time:',
        'Next Closing Forecast Date:',
        'Deadline for Point Treatment:',
        'Automatic Change',
        'Key of Kairos Connect :',
        'Public Key for Point Voucher Generation:',
        'Custom logo:',
        'Extend LGPD:']
    
    $campos_empresa_espanhol = [
        'Registro:',
        'CEI/CNO/CAEPF:',
        'Teléfono:',
        'Utiliza ley 1510 de BR:',
        'Nombre de la Sociedad:',
        'RFC:',
        'Ramo de la Actividad:',
        'Dirección:',
        'Colonia:',
        'Ciudad:',
        'Sigla Provincia:',
        'País:',
        'URL:',
        'Email:',
        'Día de apertura del periodo:',
        'Huso:',
        'Horario de verano:',
        'Inicio horario de verano:',
        'Fin de horario de verano:',
        'Fecha de Pronóstico de Cierre Siguiente:',
        'Fecha Límite Para el Tratamiento Puntual:',
        'Cambio Automático',
        'Clave Kairos Connect :',
        'Clave pública para la generación de comprobantes de puntos:',
        'Logotipo personalizado:',
        'Ampliar LGPD:']

    $campos_empresa_portugues_Pt = [
        'Código:',
        'CEI/CNO/CAEPF:',
        'Telefone:',
        'Utiliza portaria 1510:',
        'Nome da Empresa:',
        'Número do Contribuinte:',
        'CAE:',
        'Morada:',
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
        'Data de Previsão do Próximo Fechamento:',
        'Alteração Automática',
        'Chave do Kairos Connect :',
        'Chave pública para geração de Comprovante de Ponto:',
        'Logotipo personalizado:',
        'Estender LGPD:']

    $resources_mensagem_obrigacao_empresa = [
        "Por favor adicione um código",
        "Por favor introduza um telefone",
        "Por favor introduza uma razão social",
        "Por favor introduza um CNPJ/CPF",
        "Por favor introduza um endereço",
        "Por favor introduza uma cidade",
        "Por favor introduza o dia de abertura do período.",
        "Por favor introduza um bairro",
        "Por favor introduza um UF" ]

    def validando_nome_Campos (valor_campos)
        valor_campos.each do |campos|
            expect(page).to have_content campos
        end
    end

    def valida_mensagem_campos(valor_resource)
        valor_resource.each do |mensagem|
            expect(page).to have_content mensagem
        end
    end
end
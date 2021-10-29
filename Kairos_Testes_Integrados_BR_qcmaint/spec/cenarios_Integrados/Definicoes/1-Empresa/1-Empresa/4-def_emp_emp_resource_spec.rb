require 'common\common'
common = Common.new

describe 'Todos os resources', :empresa_resource_all do

  describe 'Validando Resource em Português - BR', :empresa_resource_br do
    before(:each) do
      visit '/'

      #Realiza login
      common.logon_br
      # Acessando a empresa pela navegação de telas
      common.nav('Empresa', 'div[id="MenuEmpresas"]')
    end

    it 'No Create', :resource_create_br do
      #removendo chat da tela
      common.remove_chat

      #acessar a criação de empresas
      find('label[class="pointer"]').click

      expect(page).to have_content 'Código:'
      expect(page).to have_content 'CEI:'
      expect(page).to have_content 'Telefone:'
      expect(page).to have_content 'Utiliza portaria 1510:'
      expect(page).to have_content 'Razão Social:'
      expect(page).to have_content 'CNPJ/CPF:'
      expect(page).to have_content 'Ramo de atividade:'
      # expect(find('select[id="Empresa_RamoAtividade_Id"]').selected?).to be(AGRICULTURA, PECUÁRIA, PRODUÇÃO FLORESTAL, PESCA E AQÜICULTURA)
      expect(page).to have_content 'Endereço:'
      expect(page).to have_content 'Bairro:'
      expect(page).to have_content 'Cidade:'
      expect(page).to have_content 'UF:'
      expect(page).to have_content 'País:'
      expect(page).to have_content 'URL:'
      expect(page).to have_content 'Email:'
      expect(page).to have_content 'Dia de abertura do período:'
      expect(page).to have_content 'Fuso horário:'
      # 'UTC -3'
      expect(page).to have_content 'Horário de verão:'
      expect(page).to have_content 'Início horário de verão:'
      expect(page).to have_content 'Fim horário de verão:'
      expect(page).to have_content 'Data de Previsão do Próximo Fechamento:'
      # with: '00/00/0000'
      expect(page).to have_content 'Data Limite para Tratamento de Ponto:' 
      # with: '00/00/0000'
      expect(page).to have_content 'Alteração Automática'
      expect(page).to have_content 'Chave do Kairos Connect :'
      expect(page).to have_content 'Chave pública para geração de Comprovante de Ponto:'
      expect(page).to have_content 'Logotipo personalizado:'
      expect(page).to have_content 'Localização:'

    end  

    it 'No Update', :resource_update_br do
      #Acessar a edição de empresas
      common.select_button('table tbody tr', 'Empresa Br - Automação de testes - 17-08-2021 - 1101')

      expect(page).to have_content 'Código:'
      expect(page).to have_content 'CEI:'
      expect(page).to have_content 'Telefone:'
      expect(page).to have_content 'Utiliza portaria 1510:'
      expect(page).to have_content 'Razão Social:'
      expect(page).to have_content 'CNPJ/CPF:'
      expect(page).to have_content 'Ramo de atividade:'
      # expect(find('select[id="Empresa_RamoAtividade_Id"]').selected?).to be(AGRICULTURA, PECUÁRIA, PRODUÇÃO FLORESTAL, PESCA E AQÜICULTURA)
      expect(page).to have_content 'Endereço:'
      expect(page).to have_content 'Bairro:'
      expect(page).to have_content 'Cidade:'
      expect(page).to have_content 'UF:'
      expect(page).to have_content 'País:'
      expect(page).to have_content 'URL:'
      expect(page).to have_content 'Email:'
      expect(page).not_to have_content 'Dia de abertura do período:'
      expect(page).to have_content 'Fuso horário:'
      # 'UTC -3'
      expect(page).to have_content 'Horário de verão:'
      expect(page).to have_content 'Início horário de verão:'
      expect(page).to have_content 'Fim horário de verão:'
      expect(page).to have_content 'Data de Previsão do Próximo Fechamento:'
      # with: '00/00/0000'
      expect(page).to have_content 'Data Limite para Tratamento de Ponto:' 
      # with: '00/00/0000'
      expect(page).to have_content 'Alteração Automática'
      expect(page).to have_content 'Chave do Kairos Connect :'
      expect(page).to have_content 'Chave pública para geração de Comprovante de Ponto:'
      expect(page).to have_content 'Logotipo personalizado:'
      expect(page).to have_content 'Localização:'
    end  
  end


  describe 'Validando Resource em Inglês', :empresa_resource_en do
    before(:each) do
      visit '/'

      #Realiza login
      common.logon_en
      # Acessando a empresa pela navegação de telas
      common.nav('Company', 'div[id="MenuEmpresas"]')
    end

    it 'No Create', :resource_crate_en do
      #removendo chat da tela
      common.remove_chat()

      #acessar a criação de empresas
      find('label[class="pointer"]').click
      
      expect(page).to have_content 'Code:'
      expect(page).to have_content 'CEI:'
      expect(page).to have_content 'telephone:'
      expect(page).to have_content 'According to the law 1510:'
      expect(page).to have_content 'Company Name:'
      expect(page).to have_content 'CNPJ/CPF:'
      expect(page).to have_content 'Hive of activity:'
      # expect(find('select[id="Empresa_RamoAtividade_Id"]').selected?).to be(AGRICULTURA, PECUÁRIA, PRODUÇÃO FLORESTAL, PESCA E AQÜICULTURA)
      expect(page).to have_content 'Address:'
      expect(page).to have_content 'Neighborhood:'
      expect(page).to have_content 'City:'
      expect(page).to have_content 'State:'
      expect(page).to have_content 'Country:'
      expect(page).to have_content 'URL:'
      expect(page).to have_content 'E-mail:'
      expect(page).to have_content 'Opening day of the period:'
      expect(page).to have_content 'Time zone:'
      # 'UTC -3'
      expect(page).to have_content 'DST:'
      expect(page).to have_content 'Home DST:'
      expect(page).to have_content 'End Daylight Saving Time:'
      expect(page).to have_content 'Next Closing Forecast Date:'
      # with: '00/00/0000'
      expect(page).to have_content 'Deadline for Point Treatment:' 
      # with: '00/00/0000'
      expect(page).to have_content 'Automatic Change'
      expect(page).to have_content 'Key of Kairos Connect :'
      expect(page).to have_content 'Public Key for Point Voucher Generation:'
      expect(page).to have_content 'Custom logo:'
      expect(page).to have_content 'Location:'

    end  

    it 'No Update', :resource_update_en do
      #Acessar a edição de Empresas
      common.select_button('table tbody tr', 'Empresa Br - Automação de testes - 17-08-2021 - 1101')

      expect(page).to have_content 'Code:'
      expect(page).to have_content 'CEI:'
      expect(page).to have_content 'telephone:'
      expect(page).to have_content 'According to the law 1510:'
      expect(page).to have_content 'Company Name:'
      expect(page).to have_content 'CNPJ/CPF:'
      expect(page).to have_content 'Hive of activity:'
      # expect(find('select[id="Empresa_RamoAtividade_Id"]').selected?).to be(AGRICULTURA, PECUÁRIA, PRODUÇÃO FLORESTAL, PESCA E AQÜICULTURA)
      expect(page).to have_content 'Address:'
      expect(page).to have_content 'Neighborhood:'
      expect(page).to have_content 'City:'
      expect(page).to have_content 'State:'
      expect(page).to have_content 'Country:'
      expect(page).to have_content 'URL:'
      expect(page).to have_content 'E-mail:'
      expect(page).not_to have_content 'Opening day of the period:'
      expect(page).to have_content 'Time zone:'
      # 'UTC -3'
      expect(page).to have_content 'DST:'
      expect(page).to have_content 'Home DST:'
      expect(page).to have_content 'End Daylight Saving Time:'
      expect(page).to have_content 'Next Closing Forecast Date:'
      # with: '00/00/0000'
      expect(page).to have_content 'Deadline for Point Treatment:' 
      # with: '00/00/0000'
      expect(page).to have_content 'Automatic Change'
      expect(page).to have_content 'Key of Kairos Connect :'
      expect(page).to have_content 'Public Key for Point Voucher Generation:'
      expect(page).to have_content 'Custom logo:'
      expect(page).to have_content 'Location:'
    end  
  end


  describe 'Validando Resource em Espanhol', :empresa_resource_mx do
    before(:each) do
      visit '/'

      #Realiza login
      common.logon_mx
      # Acessando a empresa pela navegação de telas
      common.nav('Sociedad', 'div[id="MenuEmpresas"]')
    end

    it 'No Create', :resource_crate_mx do
      #removendo chat da tela
      common.remove_chat()

      #acessar a criação de empresas
      find('label[class="pointer"]').click
      
      expect(page).to have_content 'Registro:'
      expect(page).to have_content 'CEI:'
      expect(page).to have_content 'Teléfono:'
      expect(page).to have_content 'Utiliza ley 1510 de BR:'
      expect(page).to have_content 'Nombre de la Sociedad:'
      expect(page).to have_content 'RFC:'
      expect(page).to have_content 'Ramo de la Actividad:'
      expect(page).to have_content 'Dirección:'
      expect(page).to have_content 'Colonia:'
      expect(page).to have_content 'Ciudad:'
      expect(page).to have_content 'Sigla Provincia:'
      expect(page).to have_content 'País:'
      expect(page).to have_content 'URL:'
      expect(page).to have_content 'Email:'
      expect(page).to have_content 'Día de apertura del periodo:'
      expect(page).to have_content 'Huso:'
      expect(page).to have_content 'Horario de verano:'
      expect(page).to have_content 'Inicio horario de verano:'
      expect(page).to have_content 'Fin de horario de verano:'
      expect(page).to have_content 'Fecha de Pronóstico de Cierre Siguiente:'
      expect(page).to have_content 'Fecha Límite Para el Tratamiento Puntual:' 
      expect(page).to have_content 'Cambio Automático'
      expect(page).to have_content 'Clave Kairos Connect :'
      expect(page).to have_content 'Clave pública para la generación de comprobantes de puntos:'
      expect(page).to have_content 'Logotipo personalizado:'
      expect(page).to have_content 'Ubicación:'

    end  

    it 'No Update', :resource_update_mx do
      #Acessar a edição de Empresas
      common.select_button('table tbody tr', 'Empresa Br - Automação de testes - 17-08-2021 - 1101')

      expect(page).to have_content 'Registro:'
      expect(page).to have_content 'CEI:'
      expect(page).to have_content 'Teléfono:'
      expect(page).to have_content 'Utiliza ley 1510 de BR:'
      expect(page).to have_content 'Nombre de la Sociedad:'
      expect(page).to have_content 'RFC:'
      expect(page).to have_content 'Ramo de la Actividad:'
      expect(page).to have_content 'Dirección:'
      expect(page).to have_content 'Colonia:'
      expect(page).to have_content 'Ciudad:'
      expect(page).to have_content 'Sigla Provincia:'
      expect(page).to have_content 'País:'
      expect(page).to have_content 'URL:'
      expect(page).to have_content 'Email:'
      expect(page).not_to have_content 'Día de apertura del periodo:'
      expect(page).to have_content 'Huso:'
      expect(page).to have_content 'Horario de verano:'
      expect(page).to have_content 'Inicio horario de verano:'
      expect(page).to have_content 'Fin de horario de verano:'
      expect(page).to have_content 'Fecha de Pronóstico de Cierre Siguiente:'
      expect(page).to have_content 'Fecha Límite Para el Tratamiento Puntual:' 
      expect(page).to have_content 'Cambio Automático'
      expect(page).to have_content 'Clave Kairos Connect :'
      expect(page).to have_content 'Clave pública para la generación de comprobantes de puntos:'
      expect(page).to have_content 'Logotipo personalizado:'
      expect(page).to have_content 'Ubicación:'

    end  
  end

  describe 'Validando Resource em Português - Portugal', :empresa_resource_pt do
    before(:each) do
      visit '/'

      #Realiza login
      common.logon_pt
      # Acessando a empresa pela navegação de telas
      common.nav('Empresa', 'div[id="MenuEmpresas"]')
    end

    it 'No Create', :resource_crate_pt do
      #removendo chat da tela
      common.remove_chat()

      #acessar a criação de empresas
      find('label[class="pointer"]').click
      
      expect(page).to have_content 'Código:'
      expect(page).to have_content 'Codigo Postal:'
      expect(page).to have_content 'Telefone:'
      expect(page).to have_content 'Utiliza portaria 1510:'
      expect(page).to have_content 'Nome da Empresa:'
      expect(page).to have_content 'Número do Contribuinte:'
      expect(page).to have_content 'CAE:'
      expect(page).to have_content 'Morada:'
      expect(page).to have_content 'Bairro:'
      expect(page).to have_content 'Cidade:'
      expect(page).to have_content 'UF:'
      expect(page).to have_content 'País:'
      expect(page).to have_content 'URL:'
      expect(page).to have_content 'Email:'
      expect(page).to have_content 'Dia de abertura do período:'
      expect(page).to have_content 'Fuso horário:'
      expect(page).to have_content 'Horário de verão:'
      expect(page).to have_content 'Início horário de verão:'
      expect(page).to have_content 'Fim horário de verão:'
      expect(page).to have_content 'Data de Previsão do Próximo Fechamento:'
      expect(page).to have_content 'Data Limite para Tratamento de Ponto:' 
      expect(page).to have_content 'Alteração Automática'
      expect(page).to have_content 'Chave do Kairos Connect :'
      expect(page).to have_content 'Chave pública para geração de Comprovante de Ponto:'
      expect(page).to have_content 'Logotipo personalizado:'
      expect(page).to have_content 'Localização:'

    end  

    it 'No Update', :resource_update_pt do
      #Acessar a edição de Empresas
      common.select_button('table tbody tr', 'Empresa Br - Automação de testes - 17-08-2021 - 1101')

      expect(page).to have_content 'Código:'
      expect(page).to have_content 'Codigo Postal:'
      expect(page).to have_content 'Telefone:'
      expect(page).to have_content 'Utiliza portaria 1510:'
      expect(page).to have_content 'Nome da Empresa:'
      expect(page).to have_content 'Número do Contribuinte:'
      expect(page).to have_content 'CAE:'
      expect(page).to have_content 'Morada:'
      expect(page).to have_content 'Bairro:'
      expect(page).to have_content 'Cidade:'
      expect(page).to have_content 'UF:'
      expect(page).to have_content 'País:'
      expect(page).to have_content 'URL:'
      expect(page).to have_content 'Email:'
      expect(page).not_to have_content 'Dia de abertura do período:'
      expect(page).to have_content 'Fuso horário:'
      expect(page).to have_content 'Horário de verão:'
      expect(page).to have_content 'Início horário de verão:'
      expect(page).to have_content 'Fim horário de verão:'
      expect(page).to have_content 'Data de Previsão do Próximo Fechamento:'
      expect(page).to have_content 'Data Limite para Tratamento de Ponto:' 
      expect(page).to have_content 'Alteração Automática'
      expect(page).to have_content 'Chave do Kairos Connect :'
      expect(page).to have_content 'Chave pública para geração de Comprovante de Ponto:'
      expect(page).to have_content 'Logotipo personalizado:'
      expect(page).to have_content 'Localização:'

    end  
  end

end
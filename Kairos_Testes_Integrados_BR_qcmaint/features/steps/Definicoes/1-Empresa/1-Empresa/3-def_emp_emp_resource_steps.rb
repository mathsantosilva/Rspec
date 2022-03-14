Dado('que acesso a tela de empresa PTbr') do
  # Realiza login
  @login.logon_br
  # Acessando a empresa pela navegacao de telas
  @common.nav_def('Empresa', 'div[id="MenuEmpresas"]')
end
  
  Quando('acesso a criação de empresa PTbr') do
    @common.remove_chat
    find('label[class="pointer"]').click
  end
  
  Então('todos os campos do create serão validados em portugues') do
    expect(page).to have_content 'Código:'
    expect(page).to have_content 'CEI/CNO/CAEPF:'
    expect(page).to have_content 'Telefone:'
    expect(page).to have_content 'Utiliza portaria 1510:'
    expect(page).to have_content 'Razão Social:'
    expect(page).to have_content 'CNPJ/CPF:'
    expect(page).to have_content 'Ramo de atividade:'
    # expect(find('select[id="Empresa_RamoAtividade_Id"]').selected?).to be("AGRICULTURA, PECUÁRIA, PRODUÇÃO FLORESTAL, PESCA E AQÜICULTURA")
    expect(page).to have_content 'Endereço:'
    expect(page).to have_content 'Bairro:'
    expect(page).to have_content 'Cidade:'
    expect(page).to have_content 'UF:'
    expect(page).to have_content 'País:'
    expect(page).to have_content 'URL:'
    expect(page).to have_content 'Email:'
    expect(page).to have_content 'Dia de abertura do período:'
    expect(page).to have_content 'Fuso horário:'
    # expect(find('select[id="Empresa_FusoHorario_Id"]').selected?).to be("UTC -3")
    # 'UTC -3'
    expect(page).to have_content 'Horário de verão:'
    expect(page).to have_content 'Início horário de verão:'
    expect(page).to have_content 'Fim horário de verão:'
    expect(page).to have_content 'Data de Previsão do Próximo Fechamento:'
    # expect(find('input[id="Empresa_DataPrevisaoProximoFechamento"]').selected?).to be("UTC -3")
    # with: '00/00/0000'
    expect(page).to have_content 'Data Limite para Tratamento de Ponto:' 
    # with: '00/00/0000'
    expect(page).to have_content 'Alteração Automática'
    expect(page).to have_content 'Chave do Kairos Connect :'
    expect(page).to have_content 'Chave pública para geração de Comprovante de Ponto:'
    expect(page).to have_content 'Logotipo personalizado:'
    expect(page).to have_content 'Localização:'
    expect(page).to have_content 'Adendo LGPD:'
  end
  
  Quando('acesso o update de empresa PTbr') do
    @common.select_button('body > div.ZonaConteudo > div.Conteudo > table > tbody > tr:nth-child(1) > td:nth-child(1)', 'img[class="pointer icons editIcon"]')
  end
  
  Então('todos os campos do update serão validados em portugues') do
    expect(page).to have_content 'Código:'
    expect(page).to have_content 'CEI/CNO/CAEPF:'
    expect(page).to have_content 'Telefone:'
    expect(page).to have_content 'Utiliza portaria 1510:'
    expect(page).to have_content 'Razão Social:'
    expect(page).to have_content 'CNPJ/CPF:'
    expect(page).to have_content 'Ramo de atividade:'
    # expect(find('select[id="Empresa_RamoAtividade_Id"]').selected?).to be("AGRICULTURA, PECUÁRIA, PRODUÇÃO FLORESTAL, PESCA E AQÜICULTURA")
    expect(page).to have_content 'Endereço:'
    expect(page).to have_content 'Bairro:'
    expect(page).to have_content 'Cidade:'
    expect(page).to have_content 'UF:'
    expect(page).to have_content 'País:'
    expect(page).to have_content 'URL:'
    expect(page).to have_content 'Email:'
    expect(page).to have_content 'Fuso horário:'
    # expect(find('select[id="Empresa_FusoHorario_Id"]').selected?).to be("UTC -3")
    # 'UTC -3'
    expect(page).to have_content 'Horário de verão:'
    expect(page).to have_content 'Início horário de verão:'
    expect(page).to have_content 'Fim horário de verão:'
    expect(page).to have_content 'Data de Previsão do Próximo Fechamento:'
    # expect(find('input[id="Empresa_DataPrevisaoProximoFechamento"]').selected?).to be("UTC -3")
    # with: '00/00/0000'
    expect(page).to have_content 'Data Limite para Tratamento de Ponto:' 
    # with: '00/00/0000'
    expect(page).to have_content 'Alteração Automática'
    expect(page).to have_content 'Chave do Kairos Connect :'
    expect(page).to have_content 'Chave pública para geração de Comprovante de Ponto:'
    expect(page).to have_content 'Logotipo personalizado:'
    expect(page).to have_content 'Localização:'
    expect(page).to have_content 'Adendo LGPD:'

  end
  
Dado('que acesso a tela de empresa EN') do
  # Realiza login
  @login.logon_en
  # Acessando a empresa pela navegacao de telas
  @common.nav_def('Company', 'div[id="MenuEmpresas"]')
end
  
  Quando('acesso a criação de empresa EN') do
    @common.remove_chat
    find('label[class="pointer"]').click
  end
  
  Então('todos os campos do create serão validados em Ingles') do
    expect(page).to have_content 'Code:'
    expect(page).to have_content 'CEI/CNO/CAEPF:'
    expect(page).to have_content 'telephone:'
    expect(page).to have_content 'According to the law 1510:'
    expect(page).to have_content 'Company Name:'
    expect(page).to have_content 'CNPJ/CPF:'
    expect(page).to have_content 'Hive of activity:'
    # expect(find('select[id="Empresa_RamoAtividade_Id"]').selected?).to be("AGRICULTURA, PECUÁRIA, PRODUÇÃO FLORESTAL, PESCA E AQÜICULTURA")
    expect(page).to have_content 'Address:'
    expect(page).to have_content 'Neighborhood:'
    expect(page).to have_content 'City:'
    expect(page).to have_content 'State:'
    expect(page).to have_content 'Country:'
    expect(page).to have_content 'URL:'
    expect(page).to have_content 'E-mail:'
    expect(page).to have_content 'Opening day of the period:'
    expect(page).to have_content 'Time zone:'
    # expect(find('select[id="Empresa_FusoHorario_Id"]').selected?).to be("UTC -3")
    # 'UTC -3'
    expect(page).to have_content 'DST:'
    expect(page).to have_content 'Home DST:'
    expect(page).to have_content 'End Daylight Saving Time:'
    expect(page).to have_content 'Next Closing Forecast Date:'
    # expect(find('input[id="Empresa_DataPrevisaoProximoFechamento"]').selected?).to be("UTC -3")
    # with: '00/00/0000'
    expect(page).to have_content 'Deadline for Point Treatment:' 
    # with: '00/00/0000'
    expect(page).to have_content 'Automatic Change'
    expect(page).to have_content 'Key of Kairos Connect :'
    expect(page).to have_content 'Public Key for Point Voucher Generation:'
    expect(page).to have_content 'Custom logo:'
    expect(page).to have_content 'Extend LGPD:'
  end
  
  Quando('acesso o update de empresa EN') do
    @common.select_button('body > div.ZonaConteudo > div.Conteudo > table > tbody > tr:nth-child(1) > td:nth-child(1)', 'img[class="pointer icons editIcon"]')
  end
  
  Então('todos os campos do update serão validados em Ingles') do
    expect(page).to have_content 'Code:'
    expect(page).to have_content 'CEI/CNO/CAEPF:'
    expect(page).to have_content 'telephone:'
    expect(page).to have_content 'According to the law 1510:'
    expect(page).to have_content 'Company Name:'
    expect(page).to have_content 'CNPJ/CPF:'
    expect(page).to have_content 'Hive of activity:'
    # expect(find('select[id="Empresa_RamoAtividade_Id"]').selected?).to be("AGRICULTURA, PECUÁRIA, PRODUÇÃO FLORESTAL, PESCA E AQÜICULTURA")
    expect(page).to have_content 'Address:'
    expect(page).to have_content 'Neighborhood:'
    expect(page).to have_content 'City:'
    expect(page).to have_content 'State:'
    expect(page).to have_content 'Country:'
    expect(page).to have_content 'URL:'
    expect(page).to have_content 'E-mail:'
    expect(page).to have_content 'Time zone:'
    # expect(find('select[id="Empresa_FusoHorario_Id"]').selected?).to be("UTC -3")
    # 'UTC -3'
    expect(page).to have_content 'DST:'
    expect(page).to have_content 'Home DST:'
    expect(page).to have_content 'End Daylight Saving Time:'
    expect(page).to have_content 'Next Closing Forecast Date:'
    # expect(find('input[id="Empresa_DataPrevisaoProximoFechamento"]').selected?).to be("UTC -3")
    # with: '00/00/0000'
    expect(page).to have_content 'Deadline for Point Treatment:' 
    # with: '00/00/0000'
    expect(page).to have_content 'Automatic Change'
    expect(page).to have_content 'Key of Kairos Connect :'
    expect(page).to have_content 'Public Key for Point Voucher Generation:'
    expect(page).to have_content 'Custom logo:'
    expect(page).to have_content 'Extend LGPD:'
  end
  
Dado('que acesso a tela de empresa espanhol') do
  # Realiza login
  @login.logon_es
  # Acessando a empresa pela navegacao de telas
  @common.nav_def('Sociedad', 'div[id="MenuEmpresas"]')
end
  
  Quando('acesso a criação de empresa espanhol') do
    @common.remove_chat
    find('label[class="pointer"]').click
  end
  
  Então('todos os campos do create serão validados em Espanhol') do
    expect(page).to have_content 'Registro:'
    expect(page).to have_content 'CEI/CNO/CAEPF:'
    expect(page).to have_content 'Teléfono:'
    expect(page).to have_content 'Utiliza ley 1510 de BR:'
    expect(page).to have_content 'Nombre de la Sociedad:'
    expect(page).to have_content 'RFC:'
    expect(page).to have_content 'Ramo de la Actividad:'
    # expect(find('select[id="Empresa_RamoAtividade_Id"]').selected?).to be("AGRICULTURA, PECUÁRIA, PRODUÇÃO FLORESTAL, PESCA E AQÜICULTURA")
    expect(page).to have_content 'Dirección:'
    expect(page).to have_content 'Colonia:'
    expect(page).to have_content 'Ciudad:'
    expect(page).to have_content 'Sigla Provincia:'
    expect(page).to have_content 'País:'
    expect(page).to have_content 'URL:'
    expect(page).to have_content 'Email:'
    expect(page).to have_content 'Día de apertura del periodo:'
    expect(page).to have_content 'Huso:'
    # expect(find('select[id="Empresa_FusoHorario_Id"]').selected?).to be("UTC -3")
    # 'UTC -3'
    expect(page).to have_content 'Horario de verano:'
    expect(page).to have_content 'Inicio horario de verano:'
    expect(page).to have_content 'Fin de horario de verano:'
    expect(page).to have_content 'Fecha de Pronóstico de Cierre Siguiente:'
    # expect(find('input[id="Empresa_DataPrevisaoProximoFechamento"]').selected?).to be("UTC -3")
    # with: '00/00/0000'
    expect(page).to have_content 'Fecha Límite Para el Tratamiento Puntual:' 
    # with: '00/00/0000'
    expect(page).to have_content 'Cambio Automático'
    expect(page).to have_content 'Clave Kairos Connect :'
    expect(page).to have_content 'Clave pública para la generación de comprobantes de puntos:'
    expect(page).to have_content 'Logotipo personalizado:'
    expect(page).to have_content 'Ampliar LGPD:'
  end
  
  Quando('acesso o update de empresa espanhol') do
    @common.select_button('body > div.ZonaConteudo > div.Conteudo > table > tbody > tr:nth-child(1) > td:nth-child(1)', 'img[class="pointer icons editIcon"]')
  end
  
  Então('todos os campos do update serão validados em Espanhol') do
    expect(page).to have_content 'Registro:'
    expect(page).to have_content 'CEI/CNO/CAEPF:'
    expect(page).to have_content 'Teléfono:'
    expect(page).to have_content 'Utiliza ley 1510 de BR:'
    expect(page).to have_content 'Nombre de la Sociedad:'
    expect(page).to have_content 'RFC:'
    expect(page).to have_content 'Ramo de la Actividad:'
    # expect(find('select[id="Empresa_RamoAtividade_Id"]').selected?).to be("AGRICULTURA, PECUÁRIA, PRODUÇÃO FLORESTAL, PESCA E AQÜICULTURA")
    expect(page).to have_content 'Dirección:'
    expect(page).to have_content 'Colonia:'
    expect(page).to have_content 'Ciudad:'
    expect(page).to have_content 'Sigla Provincia:'
    expect(page).to have_content 'País:'
    expect(page).to have_content 'URL:'
    expect(page).to have_content 'Email:'
    expect(page).to have_content 'Huso:'
    # expect(find('select[id="Empresa_FusoHorario_Id"]').selected?).to be("UTC -3")
    # 'UTC -3'
    expect(page).to have_content 'Horario de verano:'
    expect(page).to have_content 'Inicio horario de verano:'
    expect(page).to have_content 'Fin de horario de verano:'
    expect(page).to have_content 'Fecha de Pronóstico de Cierre Siguiente:'
    # expect(find('input[id="Empresa_DataPrevisaoProximoFechamento"]').selected?).to be("UTC -3")
    # with: '00/00/0000'
    expect(page).to have_content 'Fecha Límite Para el Tratamiento Puntual:' 
    # with: '00/00/0000'
    expect(page).to have_content 'Cambio Automático'
    expect(page).to have_content 'Clave Kairos Connect :'
    expect(page).to have_content 'Clave pública para la generación de comprobantes de puntos:'
    expect(page).to have_content 'Logotipo personalizado:'
    expect(page).to have_content 'Ampliar LGPD:'
  end
  
Dado('que acesso a tela de empresa PTpt') do
  # Realiza login
  @login.logon_pt
  # Acessando a empresa pela navegacao de telas
  @common.nav_def('Empresa', 'div[id="MenuEmpresas"]')
end
  
  Quando('acesso a criação de empresa PTpt') do
    @common.remove_chat
    find('label[class="pointer"]').click
  end
  
  Então('todos os campos do create serão validados em portugues de portugal') do
    expect(page).to have_content 'Código:'
    expect(page).to have_content 'CEI/CNO/CAEPF:'
    expect(page).to have_content 'Telefone:'
    expect(page).to have_content 'Utiliza portaria 1510:'
    expect(page).to have_content 'Nome da Empresa:'
    expect(page).to have_content 'Número do Contribuinte:'
    expect(page).to have_content 'CAE:'
    # expect(find('select[id="Empresa_RamoAtividade_Id"]').selected?).to be("AGRICULTURA, PECUÁRIA, PRODUÇÃO FLORESTAL, PESCA E AQÜICULTURA")
    expect(page).to have_content 'Morada:'
    expect(page).to have_content 'Bairro:'
    expect(page).to have_content 'Cidade:'
    expect(page).to have_content 'UF:'
    expect(page).to have_content 'País:'
    expect(page).to have_content 'URL:'
    expect(page).to have_content 'Email:'
    expect(page).to have_content 'Dia de abertura do período:'
    expect(page).to have_content 'Fuso horário:'
    # expect(find('select[id="Empresa_FusoHorario_Id"]').selected?).to be("UTC -3")
    # 'UTC -3'
    expect(page).to have_content 'Horário de verão:'
    expect(page).to have_content 'Início horário de verão:'
    expect(page).to have_content 'Fim horário de verão:'
    expect(page).to have_content 'Data de Previsão do Próximo Fechamento:'
    # expect(find('input[id="Empresa_DataPrevisaoProximoFechamento"]').selected?).to be("UTC -3")
    # with: '00/00/0000'
    expect(page).to have_content 'Data de Previsão do Próximo Fechamento:' 
    # with: '00/00/0000'
    expect(page).to have_content 'Alteração Automática'
    expect(page).to have_content 'Chave do Kairos Connect :'
    expect(page).to have_content 'Chave pública para geração de Comprovante de Ponto:'
    expect(page).to have_content 'Logotipo personalizado:'
    expect(page).to have_content 'Estender LGPD:'
  end
  
  Quando('acesso o update de empresa PTpt') do
    @common.select_button('body > div.ZonaConteudo > div.Conteudo > table > tbody > tr:nth-child(1) > td:nth-child(1)', 'img[class="pointer icons editIcon"]')
  end
  
  Então('todos os campos do update serão validados em portugues de portugal') do
    expect(page).to have_content 'Código:'
    expect(page).to have_content 'CEI/CNO/CAEPF:'
    expect(page).to have_content 'Telefone:'
    expect(page).to have_content 'Utiliza portaria 1510:'
    expect(page).to have_content 'Nome da Empresa:'
    expect(page).to have_content 'Número do Contribuinte:'
    expect(page).to have_content 'CAE:'
    # expect(find('select[id="Empresa_RamoAtividade_Id"]').selected?).to be("AGRICULTURA, PECUÁRIA, PRODUÇÃO FLORESTAL, PESCA E AQÜICULTURA")
    expect(page).to have_content 'Morada:'
    expect(page).to have_content 'Bairro:'
    expect(page).to have_content 'Cidade:'
    expect(page).to have_content 'UF:'
    expect(page).to have_content 'País:'
    expect(page).to have_content 'URL:'
    expect(page).to have_content 'Email:'
    expect(page).to have_content 'Fuso horário:'
    # expect(find('select[id="Empresa_FusoHorario_Id"]').selected?).to be("UTC -3")
    # 'UTC -3'
    expect(page).to have_content 'Horário de verão:'
    expect(page).to have_content 'Início horário de verão:'
    expect(page).to have_content 'Fim horário de verão:'
    expect(page).to have_content 'Data de Previsão do Próximo Fechamento:'
    # expect(find('input[id="Empresa_DataPrevisaoProximoFechamento"]').selected?).to be("UTC -3")
    # with: '00/00/0000'
    expect(page).to have_content 'Data de Previsão do Próximo Fechamento:' 
    # with: '00/00/0000'
    expect(page).to have_content 'Alteração Automática'
    expect(page).to have_content 'Chave do Kairos Connect :'
    expect(page).to have_content 'Chave pública para geração de Comprovante de Ponto:'
    expect(page).to have_content 'Logotipo personalizado:'
    expect(page).to have_content 'Estender LGPD:'
  end
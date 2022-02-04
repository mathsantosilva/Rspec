Dado('que acesso a tela de empresa PTbr') do
    # Realiza login
    @login.logon_br
    # Acessando a empresa pela navegacao de telas
    @common.nav('Empresa', 'div[id="MenuEmpresas"]')
end
  
  Quando('acesso a criação de empresa PTbr') do
    @common.remove_chat
    find('label[class="pointer"]').click
  end
  
  Então('todos os campos do create serão validados em portugues') do
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
  
  Quando('acesso o update de empresa PTbr') do
    @common.select_button('body > div.ZonaConteudo > div.Conteudo > table > tbody > tr:nth-child(1) > td:nth-child(1)', 'img[class="pointer icons editIcon"]')
  end
  
  Então('todos os campos do update serão validados em portugues') do
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
    scroll_to('input[name="connectChave.ChaveConnect"]')
    expect(page).to have_content 'Localização:'
  end
  
Dado('que acesso a tela de empresa EN') do
    pending # Write code here that turns the phrase above into concrete actions
end
  
  Quando('acesso a criação de empresa EN') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então('todos os campos do create serão validados em Ingles') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Quando('acesso o update de empresa EN') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então('todos os campos do update serão validados em Ingles') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
Dado('que acesso a tela de empresa MX') do
    pending # Write code here that turns the phrase above into concrete actions
end
  
  Quando('acesso a criação de empresa MX') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então('todos os campos do create serão validados em Espanhol') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Quando('acesso o update de empresa MX') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então('todos os campos do update serão validados em Espanhol') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
Dado('que acesso a tela de empresa PTpt') do
    pending # Write code here that turns the phrase above into concrete actions
end
  
  Quando('acesso a criação de empresa PTpt') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então('todos os campos do create serão validados em portugues de portugal') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Quando('acesso o update de empresa PTpt') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então('todos os campos do update serão validados em portugues de portugal') do
    pending # Write code here that turns the phrase above into concrete actions
  end
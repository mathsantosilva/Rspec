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
    @resources.validando_nome_Campos($campos_empresa_portugues_br)
     end
  
  Quando('acesso o update de empresa PTbr') do
    @common.select_button('body > div.ZonaConteudo > div.Conteudo > table > tbody > tr:nth-child(1) > td:nth-child(1)', 'img[class="pointer icons editIcon"]')
  end
  
  Então('todos os campos do update serão validados em portugues') do
    $campos_empresa_portugues_br.delete("Dia de abertura do período:")
    @resources.validando_nome_Campos($campos_empresa_portugues_br)
 
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
    @resources.validando_nome_Campos($campos_empresa_ingles)
   end
  
  Quando('acesso o update de empresa EN') do
    @common.select_button('body > div.ZonaConteudo > div.Conteudo > table > tbody > tr:nth-child(1) > td:nth-child(1)', 'img[class="pointer icons editIcon"]')
  end
  
  Então('todos os campos do update serão validados em Ingles') do
    $campos_empresa_ingles.delete("Opening day of the period:")
    @resources.validando_nome_Campos($campos_empresa_ingles)
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
    @resources.validando_nome_Campos($campos_empresa_espanhol)
  end
  
  Quando('acesso o update de empresa espanhol') do
    @common.select_button('body > div.ZonaConteudo > div.Conteudo > table > tbody > tr:nth-child(1) > td:nth-child(1)', 'img[class="pointer icons editIcon"]')
  end
  
  Então('todos os campos do update serão validados em Espanhol') do
    $campos_empresa_espanhol.delete("Día de apertura del periodo:")
    @resources.validando_nome_Campos($campos_empresa_espanhol)
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
    @resources.validando_nome_Campos($campos_empresa_portugues_Pt)
  end
  
  Quando('acesso o update de empresa PTpt') do
    @common.select_button('body > div.ZonaConteudo > div.Conteudo > table > tbody > tr:nth-child(1) > td:nth-child(1)', 'img[class="pointer icons editIcon"]')
  end
  
  Então('todos os campos do update serão validados em portugues de portugal') do
    $campos_empresa_portugues_Pt.delete("Dia de abertura do período:")
    @resources.validando_nome_Campos($campos_empresa_portugues_Pt)
  end
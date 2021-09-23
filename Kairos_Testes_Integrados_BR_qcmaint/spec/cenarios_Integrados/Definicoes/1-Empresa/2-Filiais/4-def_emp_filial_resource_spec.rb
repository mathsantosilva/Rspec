describe 'criacao filial', :validando_resource_filial do
    before(:each) do
      visit '/'
  
      fill_in 'LogOnModel_UserName', with: @login
      fill_in 'LogOnModel_Password', with: @senha
      click_button 'Entrar'
  
      # Acessando o cadastro da empresa filial pela navegação de telas
      selecionar = find('div[id="toggleUserDefinitions"]')
      selecionar.hover
      sleep 3
      find('div[class="pointer DropDownHeaderElement"]', text: 'Empresa').click
      find('div[id="MenuFiliais"]').click
      find('label[class="pointer"]').click
  
    end


    it 'Validando o Resource no create', :resource_filial do
        #pagina = page
        puts 'Validando resources'

        find('div[class="labelFormEdit"]', text:'Código:')
        
        @elemento = find('div[class="labelFormEdit"]', text:'Código:')
        @elemento2 = expect(@elemento).to have_content 'Código:'

        puts @elemento2


        if @codigo = (expect(@elemento).to have_content 'Código:')
            
             puts 'Resource correto'
            
        else
            puts 'Resource incorreto'

        end
        
        # find('div[class="labelFormEdit"]', text: 'Telefone:')
        # find('div[class="labelFormEdit"]', text: 'Razão social:')
        # pagina.has_field?(find('div[class="labelFormEdit"]', text: 'CNPJ/CPF:'))
        # pagina.has_field?(find('div[class="labelFormEdit"]', text: 'Endereço:'))
        # pagina.has_field?(find('div[class="labelFormEdit"]', text: 'Bairro:'))
        # pagina.has_field?(find('div[class="labelFormEdit"]', text: 'Cidade:'))
        # pagina.has_field?(find('div[class="labelFormEdit"]', text: 'UF:'))
        # pagina.has_field?(find('div[class="labelFormEdit"]', text: 'País:'))
        # pagina.has_field?(find('div[class="labelFormEdit"]', text: 'URL:'))
        # pagina.has_field?(find('div[class="labelFormEdit"]', text: 'Email:'))
        # pagina.has_field?(find('div[class="labelFormEdit"]', text: 'Fuso horário:'))
        # pagina.has_field?(find('div[class="labelFormEdit"]', text: 'Horário de verão:'))
        # pagina.has_field?(find('div[class="labelFormEdit"]', text: 'Início horário de verão:'))
        # pagina.has_field?(find('div[class="labelFormEdit"]', text: 'Fim horário de verão:'))
        # pagina.has_field?(find('div[class="labelFormEdit"]', text: 'Data de Previsão do Próximo Fechamento:'))
        # pagina.has_field?(find('div[class="labelFormEdit"]', text: 'Data Limite para Tratamento de Ponto:'))
        # pagina.has_field?(find('div[class="labelFormEdit"]', text: 'Chave do Kairos Connect :'))
        # pagina.has_field?(find('div[class="labelFormEdit"]', text: 'Localização:'))

    end

end
class Common

    #inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
    include Capybara::DSL
    include RSpec::Matchers

    #Realizando o login BR
    def logon_br()
        fill_in 'LogOnModel_UserName', with: $user_br
        fill_in 'LogOnModel_Password', with: $senha
        click_button 'Entrar'
    end

    #Realizando o login mx
    def logon_mx()
        fill_in 'LogOnModel_UserName', with: $user_mx
        fill_in 'LogOnModel_Password', with: $senha
        click_button 'Entrar'
    end

    #Realizando o login pt
    def logon_pt()
        fill_in 'LogOnModel_UserName', with: $user_pt
        fill_in 'LogOnModel_Password', with: $senha
        click_button 'Entrar'
    end

    #Realizando o login en
    def logon_en()
        fill_in 'LogOnModel_UserName', with: $user_en
        fill_in 'LogOnModel_Password', with: $senha
        click_button 'Entrar'
    end

    #executando a navegacao das paginas
    def nav(text, value)
        selecionar = find('div[id="toggleUserDefinitions"]')
        selecionar.hover
        find('div[class="pointer DropDownHeaderElement"]', text: text).click
        find(value).click
    end

    #acessando botao dentro de um table
    def select_button(elemento, xpath, texto, value)
        within(elemento) do
            selecionar = find(:xpath, xpath, text: texto)
            puts selecionar
            selecionar.hover
            find(value).click
        end
    end

    #acessando botao confirmação remover
    def confir_remover()
        within('div div div', text: 'Remover') do
            find('span[class="PlusButton pointer"]').click
        end
    end

    #Removendo Chat da tela
    def remove_chat()
        script_remove_chat = '$(".dt-chat-widget").attr("style", "display: none");'
        page.execute_script(script_remove_chat)
    end

    def validando_css(value, css)
        find(value).to have_css(css)
    end

end

class Common
    require './spec_helper'

    #inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
    include Capybara::DSL

    #Realizando o login BR
    def logon()
        fill_in 'LogOnModel_UserName', with: $user_br
        puts $user_br
        fill_in 'LogOnModel_Password', with: $senha
        puts $senha
        click_button 'Entrar'
    end

    #executando a navegacao das paginas
    def nav(value)
        selecionar = find('div[id="toggleUserDefinitions"]')
        selecionar.hover
        sleep 3
        find('div[class="pointer DropDownHeaderElement"]', text: value).click
        find('div[id="MenuEmpresas"]').click
    end

    #acessando botao dentro de um table
    def select_button(elemento, text)
        within(elemento , text: text) do
            selecionar = find('td[style="width: 45%;"]')
            selecionar.hover
            find('img[class="pointer icons editIcon"]').click
          end
    end

    #Removendo Chat da tela
    def remove_chat()
        script_remove_ana = '$(".dt-chat-widget").attr("style", "display: none");'
        page.execute_script(script_remove_ana)
    end



end

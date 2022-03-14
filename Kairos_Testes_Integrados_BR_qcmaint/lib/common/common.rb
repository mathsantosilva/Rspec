class Common

    #inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
    include Capybara::DSL
    include RSpec::Matchers

    #executando a navegacao das paginas
    def nav_def(text, value)
        selecionar = find('div[id="toggleUserDefinitions"]')
        selecionar.hover
        find('div[class="pointer DropDownHeaderElement"]', text: text).click
        find(value).click
    end

    def nav_mod(text)
        sleep 5
        selecionar = find('span[id="toogleModulos"]')
        selecionar.hover
        find('div[class="pointer DropDownHeaderElement"]', text: text).click
    end

    #acessando botao dentro de um table
    def select_button(elemento, button)
        @buscar = find(elemento)
        @buscar.hover
        find(button).click
  
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

    def botaosalvar 
        drop = find("input[type=button][value='Salvar']", match: :first)
        drop.click
    end

    def repeteco(max)
        num = 0
        while num < max.to_i do
            text = CPF.generate
            num = num + 1
            print("\n" + text)
        end
    end

end

class Common

    #inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
    include Capybara::DSL
    include RSpec::Matchers

    #executando a navegacao das paginas
    def nav_def(text, value)
        sleep 5
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

    def select_list_table(texto,button)
            @item = find('tr > td', text: texto)
            @item.hover
            find(button).click
    end

    def selecionarprimeiraocorrencia
        item = find('#MainTable > tbody > tr:nth-child(1) > td:nth-child(1) > div > label')
        item.click
    end

    #Clicando no botao para confirmar a remoção da filial
    def confir_remover()
        find('span[class="PlusButton pointer"]', text: 'Remover').click
    end

    #Removendo Chat da tela
    def remove_chat()
        script_remove_chat = '$(".dt-chat-widget").attr("style", "display: none");'
        page.execute_script(script_remove_chat)
    end

    def validando_css(value, css)
        find(value).to have_css(css)
    end

    #Clicando no botão salvar
    def botaosalvar 
        drop = find('input[type="button"][value="Salvar"]', match: :first)
        drop.click
    end

    #Clicando no botão cancelar
    def botaocancelar
        drop = find("input[type=button][value='Cancelar']", match: :first)
        drop.click
        find('span[class="PlusButton pointer"]', text: 'Sim').click
    end

    # obtem os dados da primeira empresa da lista
    def obterdadosempresa
        $codigoPrimeiraEmpresa = find('body > div.ZonaConteudo > div.Conteudo > table > tbody > tr:nth-child(1) > td:nth-child(1)', match: :first).text
        $razaoPrimeiraEmpresa = find('body > div.ZonaConteudo > div.Conteudo > table > tbody > tr:nth-child(1) > td:nth-child(2)', match: :first).text
        $cnpjPrimeiraEmpresa = find('body > div.ZonaConteudo > div.Conteudo > table > tbody > tr:nth-child(1) > td:nth-child(3)', match: :first).text
        $cpfQuartaEmpresa = find('body > div.ZonaConteudo > div.Conteudo > table > tbody > tr:nth-child(4) > td:nth-child(3)', match: :first).text
    end
end

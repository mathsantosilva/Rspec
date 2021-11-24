require 'faker'
require 'cpf_cnpj'

class Components

    include Capybara::DSL

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
    def select_button(elemento, caminho, value)
        within(elemento) do
            selecionar = find(:xpath, caminho)
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


    def botaosalvar 
        drop = find("input[type=button][value='Salvar']", match: :first)
        drop.click
    end
end



# Classe para guardar complementos dos testes
class Complements
  def varcommon
    $cnpj = CNPJ.generate
    $cpf = CPF.generate
    $time = Time.new
  end

  def varcadastro 
    $codigo_aleatorio = Faker::Number.number(digits: 9)
    $nome_aleatorio = Faker::Name.name
    $email_aleatorio = Faker::Internet.email
    $endereco_aleatorio = Faker::Address.full_address
    $bairro_aleatorio = Faker::Address.secondary_address
    $estado_aleatorio = Faker::Address.state
    $cidade_aleatoria = Faker::Address.city
    $pais_aleatorio = Faker::Address.country
    $nome_empresa_aleatoria = Faker::Company.name
    $chave_aleatoria = Faker::Crypto.md5
    $url_aleatoria = Faker::Internet.url
  end
end




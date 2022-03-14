class Login

    include Capybara::DSL
    include RSpec::Matchers 

    def logar(user, password)
        fill_in 'LogOnModel_UserName', with: user
        fill_in 'LogOnModel_Password', with: password
        find('button[id="btnFormLogin"]').click
    end


    #Realizando o login BR
    def logon_br()
        fill_in 'LogOnModel_UserName', with: $user_br
        fill_in 'LogOnModel_Password', with: $senha
        find('button[id="btnFormLogin"]').click 
        # find('input[id="btnFormLogin"]').click
    end

    #Realizando o login mx
    def logon_mx()
        fill_in 'LogOnModel_UserName', with: $user_es
        fill_in 'LogOnModel_Password', with: $senha
        find('button[id="btnFormLogin"]').click
    end

    #Realizando o login pt
    def logon_pt()
        fill_in 'LogOnModel_UserName', with: $user_pt
        fill_in 'LogOnModel_Password', with: $senha
        find('button[id="btnFormLogin"]').click
    end

    #Realizando o login en
    def logon_en()
        fill_in 'LogOnModel_UserName', with: $user_en
        fill_in 'LogOnModel_Password', with: $senha
        find('button[id="btnFormLogin"]').click
    end
end
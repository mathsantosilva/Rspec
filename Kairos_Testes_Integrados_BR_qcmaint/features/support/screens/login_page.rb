class Login 
    include Capybara::DSL

    def logar(user, password)
        fill_in 'LogOnModel_UserName', with: user
        fill_in 'LogOnModel_Password', with: password
        click_button 'Entrar'
    end

end
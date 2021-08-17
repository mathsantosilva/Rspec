describe "login" do
    it "login com sucesso" do
        visit "/Dimep/Account/LogOn?ReturnUrl=%2F"

        fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
        fill_in "LogOnModel_Password", with: "1"

        click_button "Entrar"

    end
end
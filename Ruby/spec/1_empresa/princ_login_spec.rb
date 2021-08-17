describe "login" do
    it "login com sucesso" do
        visit "/Dimep/Account/LogOn?ReturnUrl=%2F"

        fill_in "LogOnModel_UserName", with: "sprintbr08012021@dimep.com"
        fill_in "LogOnModel_Password", with: "dimep123"

        click_button "Entrar"

    end
end
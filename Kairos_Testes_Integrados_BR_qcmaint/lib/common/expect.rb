class Expect
    #inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
    include Capybara::DSL


    # Comparar se existe na pagina
    def comparecontent(value)
        expect(page).to have_content value
    end

        # Comparar se é igual na pagina 
    def compareeql(value)
        expect(page).to eql value
    end

end
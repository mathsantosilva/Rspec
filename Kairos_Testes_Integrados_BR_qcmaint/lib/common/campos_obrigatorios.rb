class Obrigatorios

    #inclui a biblioteca Capybara para conseguir usar seus elementos dentros das classes e métodos
    include Capybara::DSL
    include RSpec::Matchers

    #Campos obrigatorios na criação de empresas
    def camp_obrig_empresas()

        find('label[class="pointer"]').click
        drop = find("input[type=submit][value='Salvar']", match: :first)
        drop.click
        
        expect(page.assert_selector('input.input-validation-error', count: 9))

        expect(page).to have_content 'Por favor adicione um código'
        expect(page).to have_content 'Por favor introduza um telefone'
        expect(page).to have_content 'Por favor introduza uma razão social'
        expect(page).to have_content 'Por favor introduza um CNPJ/CPF'
        expect(page).to have_content 'Por favor introduza um endereço'
        expect(page).to have_content 'Por favor introduza uma cidade'
        expect(page).to have_content 'Por favor introduza o dia de abertura do período.'
        expect(page).to have_content 'Por favor introduza um bairro'
        expect(page).to have_content 'Por favor introduza um UF'

    end

    #Campos obrigatórios na criação de filiais
    def camp_obrig_filiais()

        # find('label[class="pointer"]').click
        # drop = find("input[type=submit][value='Salvar']", match: :first)
        # drop.click
        
        expect(page.assert_selector('input.input-validation-error', count: 8))

        expect(page).to have_content 'Por favor adicione um código'
        expect(page).to have_content 'Por favor introduza um telefone'
        expect(page).to have_content 'Por favor introduza uma razão social'
        expect(page).to have_content 'Por favor introduza um CNPJ/CPF'
        expect(page).to have_content 'Por favor introduza um endereço'
        expect(page).to have_content 'Por favor introduza uma cidade'
        expect(page).to have_content 'Por favor introduza um bairro'
        expect(page).to have_content 'Por favor introduza um UF'

    end

    def verificacao_campos_filiais()

        expect(find('#Filial_Telefone').value).to eql('11111111111111111111')
        expect(find('#Filial_Cidade').value).to eql('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
        expect(find('#Filial_Bairro').value).to eql('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
        expect(find('#Filial_UF').value).to eql('xx')
        expect(find('#Filial_Pais').value).to eql('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
        expect(find('#Filial_URL').value).to eql('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
        expect(find('#Filial_Email').value).to eql('xxxxxxxxxxxxxxxxxxxxxxxxxx@xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.com')
        expect(find('#ConnectChave_ChaveConnect').value).to eql('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')

    end

end
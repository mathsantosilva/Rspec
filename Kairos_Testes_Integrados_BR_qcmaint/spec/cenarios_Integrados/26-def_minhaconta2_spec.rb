describe 'empresa', :MinhaConta2 do
    before(:each) do
      visit '/'
      expect(page.title).to eql 'kairos'

      fill_in 'LogOnModel_UserName', with: @login
      fill_in 'LogOnModel_Password', with: @senha
      click_button 'Entrar'

      # Acessando a Minha Conta pela navegação de telas
      selecionar = find('div[id="toggleUserDefinitions"]')
      selecionar.hover
      sleep 3
      find('div[class="pointer DropDownHeaderElement"]', text: 'Minha Conta').click

    end

    #CEP valido - Preenche automaticamente os campos UF, endereço, bairro e cidade
    it 'CT0026 cadastrar informações no Minha Conta', :ct0026_MinhaConta2 do
      fill_in 'EmailRH', with: 'teste@rh.com'
      fill_in 'TelefoneRH', with: '12345678910'
      fill_in 'EmailFinanceiro', with: 'teste@financeiro.com'
      fill_in 'TelefoneFinanceiro', with: '12345678911'
      fill_in 'Cep', with: '06050330'
      sleep 1
      fill_in 'Address', with: ''
      fill_in 'District', with: ''
      select('Brasil', from: 'Pais').select_option
      sleep 1

      drop = find("input[type=submit][value='Salvar']", match: :first)
      drop.click

      expect(find('div[class=field-summary-success]')).to have_content 'Alterado com sucesso!'
      sleep 2
     end
    end
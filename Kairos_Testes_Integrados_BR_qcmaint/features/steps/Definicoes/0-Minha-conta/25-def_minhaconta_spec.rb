describe 'empresa', :MinhaConta do
    before(:each) do
      visit '/'
      @tecla = %i[enter]
      expect(page.title).to eql 'kairos'
  
      fill_in 'LogOnModel_UserName', with: $user_br
      fill_in 'LogOnModel_Password', with: $senha
      click_button 'Entrar'

      # Acessando a Minha Conta pela navegação de telas
      selecionar = find('div[id="toggleUserDefinitions"]')
      selecionar.hover
      sleep 3
      find('div[class="pointer DropDownHeaderElement"]', text: 'Minha Conta').click

    end
  
    #CEP invalido - Preenche os campos UF, endereço, bairro e cidade
    it 'CT0025 cadastrar informações no Minha Conta', :ct0025_MinhaConta do
      fill_in 'EmailRH', with: 'teste@rh.com'
      fill_in 'TelefoneRH', with: '12345678910'
      fill_in 'EmailFinanceiro', with: 'teste@financeiro.com'
      fill_in 'TelefoneFinanceiro', with: '12345678911'
      fill_in 'Cep', with: '12345678'
      select('SP', from: 'ufselecionado').select_option
      sleep 2
      fill_in 'Address', with: ''
      sleep 2
      fill_in 'Address', with: 'Rua nossa mesmo logo ali'
      fill_in 'District', with: 'Bairro das novas'
      fill_in 'citys', with: 'Cidade baixa'
      select('Brasil', from: 'Pais').select_option
      
      drop = find("input[type=submit][value='Salvar']", match: :first)
      drop.click
  
      expect(find('div[class=field-summary-success]')).to have_content 'Alterado com sucesso!'
      sleep 2
     end 
     
     #CEP valido - Preenche automaticamente os campos UF, endereço, bairro e cidade
    it 'CT0026 cadastrar informações no Minha Conta', :ct0026_MinhaConta2 do
      fill_in 'EmailRH', with: 'teste@rh.com'
      fill_in 'TelefoneRH', with: '12345678910'
      fill_in 'EmailFinanceiro', with: 'teste@financeiro.com'
      fill_in 'TelefoneFinanceiro', with: '12345678911'
      fill_in 'Cep', with: '06050330'
      sleep 1
      @tecla.each do |t|
      find('input[id="Cep"]').send_keys t
      end
      sleep 1
      # fill_in 'Address', with: ''
      # fill_in 'District', with: ''
      select('Brasil', from: 'Pais').select_option
      sleep 1

      drop = find("input[type=submit][value='Salvar']", match: :first)
      drop.click

      expect(find('div[class=field-summary-success]')).to have_content 'Alterado com sucesso!'
      sleep 2
     end

    end
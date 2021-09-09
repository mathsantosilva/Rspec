describe 'filial', :deletando_filial do
    before(:each) do
      visit '/'
  
      fill_in 'LogOnModel_UserName', with: @login
      fill_in 'LogOnModel_Password', with: @senha
      click_button 'Entrar'
  
      # Acessando a empresa filial pela navegação de telas
      selecionar = find('div[id="toggleUserDefinitions"]')
      selecionar.hover
      sleep 3
      find('div[class="pointer DropDownHeaderElement"]', text: 'Empresa').click
      find('div[id="MenuFiliais"]').click
  
    end

    it "Removendo a empresa filial" do
    puts 'Removendo filial'
        within('table tbody tr', text:'Empresa Filial') do
            selecionar = find('td[style="width: 55%;"]', text: 'Empresa Filial')
            selecionar.hover
            find('span[class="btnDeleteFilial pointer spanButton tooltip"]', text: 'Remover').click
        end

        within('div div div', text: 'Remover') do
        find('span[class="PlusButton pointer"]').click
        end

        msg = find('div[class="validation-summary-ok"]')
        expect(msg).to have_content 'A Filial foi removida com sucesso'

    end

end
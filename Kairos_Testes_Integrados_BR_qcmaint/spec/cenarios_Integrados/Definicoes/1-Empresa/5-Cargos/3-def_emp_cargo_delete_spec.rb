describe 'Cargos', :cargo_delete do
    before(:each) do
        visit '/'
        #Aceitando os cookies
        find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
        fill_in 'LogOnModel_UserName', with: $user_br
        fill_in 'LogOnModel_Password', with: $senha
        click_button 'Entrar'
        # Acessando o cadastro cargos pela navegação de telas
        selecionar = find('div[id="toggleUserDefinitions"]')
        selecionar.hover
        find('div[class="pointer DropDownHeaderElement"]', text: 'Empresa').click
        find('div[id="MenuCargos"]').click


    end
  
    it 'Alteração de cargo', :cargo_delete_direto do
        within('table tbody tr' , text: 'abcgdga') do
         selecionar = find('td[style="width: 270px; min-width: 280px;"]')
         selecionar.hover
         find('span[class="btnDeleteDeleteCargo pointer spanButton tooltip"]', text: 'Remover').click
        end

        find('span[class="PlusButton pointer"]').click
      expect(find('form[id=FormCargos]')).to have_content 'O Cargo foi removido com sucesso'
    end
  end
  
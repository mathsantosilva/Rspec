describe 'Cargos', :cargo_resource_ptpt do
    before(:each) do
      visit '/'
      #Aceitando os cookies
      find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click   
      fill_in 'LogOnModel_UserName', with: $user_pt
      fill_in 'LogOnModel_Password', with: $senha
      click_button 'Entrar'

  
      expect(find('form[id=FormCargos]')).to have_content 'O Cargo foi adicionado com sucesso'
    end
  end
  
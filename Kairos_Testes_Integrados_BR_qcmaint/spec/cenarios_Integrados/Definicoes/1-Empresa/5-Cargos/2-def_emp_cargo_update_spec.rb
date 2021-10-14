describe 'Cargos', :cargo_update do
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

  it 'Alteração de cargo', :cargo_update_direto do
    within('table tbody tr' , text: 'abcgdga') do
      selecionar = find('td[style="width: 270px; min-width: 280px;"]')
      selecionar.hover 

      find('span[class="spanButtonText"]', text: 'Alterar').click
    
    end
      
    fill_in 'Cargo_Codigo', with: '101'
    fill_in 'Cargo_Descricao', with: 'cargo alterado'
    drop = find('label[class="pointer"]', text: 'Alterar') 
    drop.click
    
    expect(find('form[id=FormCargos]')).to have_content 'Cargo editado com sucesso'
  end
end

  
Dado ('Acesso a tela de Filiais para verficar os resources') do
    
  #Logando
  @login.logon_br

  sleep 1
  
  #Acessando o cadastro da empresa filial pela navegação de telas
  @common.nav_def('Empresa','div[id="MenuFiliais"')

end


Quando ('Acesso o cadastro') do

  #acessar a criação de filiais
  find('label[class="pointer"]').click

end
        
Então ('Verifico os resources') do
    
  expect(page).to have_content 'Código:'
  expect(page).to have_content 'Telefone:'
  expect(page).to have_content 'Razão social:'
  expect(page).to have_content 'CNPJ/CPF:'
  expect(page).to have_content 'Endereço:'
  expect(page).to have_content 'Bairro:'
  expect(page).to have_content 'Cidade:'
  expect(page).to have_content 'UF:'
  expect(page).to have_content 'País:'
  expect(page).to have_content 'URL:'
  expect(page).to have_content 'Email:'
  expect(page).to have_content 'Fuso horário:'
  expect(page).to have_content 'Horário de verão:'
  expect(page).to have_content 'Início horário de verão:'
  expect(page).to have_content 'Fim horário de verão:'
  expect(page).to have_content 'Data de Previsão do Próximo Fechamento:'
  expect(page).to have_content 'Data Limite para Tratamento de Ponto:'
  expect(page).to have_content 'Chave do Kairos Connect :'

end

# describe 'Validando Resource em Inglês', :resource_filial_en do
#     before(:each) do
#       visit '/'
  
#       fill_in 'LogOnModel_UserName', with: $user_en
#       fill_in 'LogOnModel_Password', with: $senha
#       click_button 'Entrar'
      
#       # Acessando o cadastro da empresa filial pela navegação de telas
#       selecionar = find('div[id="toggleUserDefinitions"]')
#       selecionar.hover
#       sleep 3
#       find('div[class="pointer DropDownHeaderElement"]', text: 'Empresa').click
#       find('div[id="MenuFiliais"]').click

#     end
  
#     it 'No Create', :resource_criacao_filial_en do
#       #acessar a criação de filiais
#       find('label[class="pointer"]').click
      
#       expect(page).to have_content 'Code:'
#       expect(page).to have_content 'telephone:'
#       expect(page).to have_content 'Company name:'
#       expect(page).to have_content 'CNPJ/CPF:'
#       expect(page).to have_content 'Address:'
#       expect(page).to have_content 'Neighborhood:'
#       expect(page).to have_content 'City:'
#       expect(page).to have_content 'UF:'
#       expect(page).to have_content 'Country:'
#       expect(page).to have_content 'URL:'
#       expect(page).to have_content 'E-mail:'
#       expect(page).to have_content 'DST:'
#       expect(page).to have_content 'Home DST:'
#       expect(page).to have_content 'End Daylight Saving Time:'
#       expect(page).to have_content 'Next Closing Forecast Date:'
#       expect(page).to have_content 'Deadline for Point Treatment:' 
#       expect(page).to have_content 'Key of Kairos Connect :'
#       expect(page).to have_content 'Location:'
  
#     end  

# end
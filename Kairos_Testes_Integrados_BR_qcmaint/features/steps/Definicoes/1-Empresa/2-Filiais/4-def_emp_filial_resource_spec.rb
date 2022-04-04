Dado 'Logo para verficar os resources BR' do
    
  #Logando usuario BR
  @login.logon_br

end

Quando 'Navego ate a tela de filiais para verificar os resources BR' do
  
  #Acessando o cadastro da empresa filial pela navegação de telas
  @common.nav_def('Empresa','div[id="MenuFiliais"')

end


Quando 'Acesso o cadastro das filiais BR' do

  #acessar a criação de filiais
  find('label[class="pointer"]').click

end
        
Então 'Verifico os resources BR' do
    
  expect(page).to have_content 'Código:'
  expect(page).to have_content 'CEI/CNO/CAEPF:'
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


Dado 'Logo para verficar os resources EN' do
    
  #Logando usuario EN
  @login.logon_en

end


Quando 'Navego ate a tela de filiais para verificar os resources EN' do
  
  #Acessando o cadastro da empresa filial pela navegação de telas
  @common.nav_def('Company','div[id="MenuFiliais"')

end


Quando 'Acesso o cadastro das filiais EN' do

  #acessar a criação de filiais
  find('label[class="pointer"]').click

end
        
Então 'Verifico os resources EN' do
    
  expect(page).to have_content 'Code:'
  expect(page).to have_content 'CEI/CNO/CAEPF:'
  expect(page).to have_content 'telephone:'
  expect(page).to have_content 'Company name:'
  expect(page).to have_content 'CNPJ/CPF:'
  expect(page).to have_content 'Address:'
  expect(page).to have_content 'Neighborhood:'
  expect(page).to have_content 'City:'
  expect(page).to have_content 'UF:'
  expect(page).to have_content 'Country:'
  expect(page).to have_content 'URL:'
  expect(page).to have_content 'E-mail:'
  expect(page).to have_content 'Time zone:'
  expect(page).to have_content 'DST:'
  expect(page).to have_content 'Home DST:'
  expect(page).to have_content 'End Daylight Saving Time:'
  expect(page).to have_content 'Next Closing Forecast Date:'
  expect(page).to have_content 'Deadline for Point Treatment:' 
  expect(page).to have_content 'Key of Kairos Connect :'

end
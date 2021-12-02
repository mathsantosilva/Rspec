require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'faker'
require 'cpf_cnpj'
require  'webdrivers' 

Before do

  $user_br = 'teste75624@dimep.com.br'
  $user_mx = 'teste75624@dimep.com.mx'
  $user_pt = 'teste75624@dimep.com.pt'
  $user_en = 'teste75624@dimep.com.en'
  $senha = '1'
  page.current_window.maximize
  visit 'http://www.dimepkairos.com.br/'

  # Instanciando as Classes 
  @components = Components.new
  @complements = Complements.new
  @cadastros = Cadastros.new
  @login = Login.new

  
end
  
  After do |scenario|
    
  end
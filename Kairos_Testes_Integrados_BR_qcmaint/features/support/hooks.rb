require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'faker'
require 'cpf_cnpj'
require 'webdrivers'
require 'common\cadastros_empresas'
require 'common\campos_obrigatorios'

Before do

  $user_br = 'automacao@dimep.com.br'
  $user_mx = 'teste75624@dimep.com.mx'
  $user_pt = 'teste75624@dimep.com.pt'
  $user_en = 'teste75624@dimep.com.en'
  $senha = '1'
  page.current_window.maximize
  @page = 'https://www.dimepkairos.com.br/'
  @ambiente = 'Dimep'
  visit @page


  # Instanciando as Classes 
  
  @login = Login.new
  @common = Common.new
  @complements = Complements.new
  @cadastros = Cadastros.new
  @obrigatorio = Obrigatorios.new

  
end
  
  After do |scenario|
    
  end
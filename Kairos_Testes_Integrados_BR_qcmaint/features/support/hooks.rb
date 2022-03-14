require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'faker'
require 'cpf_cnpj'
require 'webdrivers'
require 'common/cadastros_empresas'
require 'common/campos_obrigatorios'

Before do

  $user_br = 'automacao@dimep.com.br'
  $user_es = 'automacao@dimep.com.es'
  $user_pt = 'automacao@dimep.com.pt'
  $user_en = 'automacao@dimep.com.en'
  $senha = '1'
  page.current_window.maximize
  @page = 'https://www.dimepkairos.com.br/'
  @ambiente = 'Dimep'
  visit @page


  # Instanciando as Classes 
  # @resources = Resources.new
  @login = Login.new
  @common = Common.new
  @complements = Complements.new
  @cadastros = Cadastros.new
  @obrigatorio = Obrigatorios.new

  
end

  After do |scenario|
    
  end
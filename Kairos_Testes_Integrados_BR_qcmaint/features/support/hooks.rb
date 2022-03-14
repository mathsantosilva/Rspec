require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'faker'
require 'cpf_cnpj'
require 'webdrivers'

Before do
    # Instanciando as Classes 
    @dadosusers = Dadosusers.new
    @common = Common.new
    @login = Login.new
    @complements = Complements.new
    @cadastros = Cadastros.new
  
    # solicitar os dados de login no console
    @login.base()
    
  # abrir o navegador maximixado e visitar a pagina solicitada no console 
  page.current_window.maximize
  visit $page
    
end

  After do |scenario|
    
  end
require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'faker'
require 'cpf_cnpj'

Before do
  # Capybara.configure do |config|
  #   config.default_driver = :selenium_chrome
  #   config.default_max_wait_time = 25
  #   config.app_host = 'https://www.dimepkairos.com.br/'
  # end
  # Variaveis do ambiente
  $user_br = 'teste18695@dimep.com.br'
  $user_mx = 'teste75624@dimep.com.mx'
  $user_pt = 'teste75624@dimep.com.pt'
  $user_en = 'teste75624@dimep.com.en'
  $senha = '1'
    
  # Instanciando as classes
  @components = Components.new

end
  
  After do |scenario|

  end
  
require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'faker'
require 'cpf_cnpj'


RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include Capybara::DSL
  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:example) do
    #WatirSpec::RakeTasks.new
    page.current_window.maximize
    @user_br = 'teste75624@dimep.com.br'
    @user_mx = 'teste75624@dimep.com.mx'
    @user_pt = 'teste75624@dimep.com.pt'
    @user_en = 'teste75624@dimep.com.en'
    @senha = '1'
    @cnpj = CNPJ.generate
    @cpf = CPF.generate
    @time = Time.new()
    @codigo_aleatorio = Faker::Number.number(digits: 9)
    @nome_aleatorio = Faker::Name.name
    @email_aleatorio = Faker::Internet.email
    @endereco_aleatorio = Faker::Address.full_address
    @bairro_aleatorio = Faker::Address.secondary_address
    @estado_aleatorio = Faker::Address.state
    @cidade_aleatoria = Faker::Address.city
    @pais_aleatorio = Faker::Address.country 
    @nome_empresa_aleatorio = Faker::Company.name
    @chave_aleatoria = Faker::Crypto.md5

  end

  Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.default_max_wait_time = 25
    config.app_host = 'https://www.dimepkairos.com.br/'
   end

  config.after(:example) do |e|
    nome = e.description.gsub(/[^A-Za-z0-9 ]/, '').tr('', '_')
    page.save_screenshot('log/' + nome + '.png')     # este código mostra as evidências em print.
  end
end
  


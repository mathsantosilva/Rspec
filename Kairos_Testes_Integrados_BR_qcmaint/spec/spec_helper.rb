require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'faker'
#require 'watirspec/rake_tasks'


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
    @login = 'teste75624@dimep.com.br'
    @user_mx = 'teste75624@dimep.com.mx'
    @user_pt = 'teste75624@dimep.com.pt'
    @user_en = 'teste75624@dimep.com.en'
    @senha = '1'
    @cnpj = '43.829.323/0001-03'
    #@cpf = CpfUtils.cpf
    @cnpj_cpf_filial = '68644523000104'
    @cpf_relogio_smart = '47537056846'
    @cpf_relogio_pp3 = '47537056846'
    @nome_aleatorio = Faker::Name.name
    @email_aleatorio = Faker::Internet.email
    #@ip_aleatorio = Faker::Internet.ip
    @cidade_aleatoria = Faker::Address.city
    @rua_aleatoria = Faker::Address.street_address
    @pais_aleatorio = Faker::Address.country
    @estado_aleatorio = Faker::Address.state
    @nome_empresa_aleatoria = Faker::Company.name
    @codigo = 'Código:'
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
  


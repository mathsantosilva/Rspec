require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'

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
    page.current_window.resize_to(1360, 768)
  end

  Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.app_host = 'http://qcmaint.dimepkairos.pt/'
  end

  config.after(:example) do |e|
    nome = e.description.gsub(/[^A-Za-z0-9 ]/, '').tr('', '_')
    page.save_screenshot('log/' + nome + '.png')     # este código mostra as evidências em print.
  end
end
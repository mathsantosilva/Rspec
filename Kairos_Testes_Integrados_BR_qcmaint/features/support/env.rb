require "allure-cucumber"
require "appium_lib"
require "fileutils"
require "capybara"
require "capybara/cucumber"
require "cucumber"
# require "report_builder"
require "capybara/rspec"
# require "gherkin"



# Limpa os logs e os screenshots
FileUtils.rm_f(Dir.glob("logs/*.json"))
FileUtils.rm_f(Dir.glob("logs/*.png"))

# Tentatica de retirar logs desnecessarios do console
Capybara.register_driver :chrome_custom do |app|
    caps = Selenium::WebDriver::Remote::Capabilities.chrome(
      "chromeOptions" => {
        "args" => ["--headless", "--disable-site-isolation-trials", "--disable-gpu"],
        "excludeSwitches" => ["enable-logging"],
      },
    )
    Capybara::Selenium::Driver.new(app, :browser => :chrome, :desired_capabilities => caps)
  end
  

Capybara.configure do |config|
    config.default_driver = :chrome_custom
    config.default_max_wait_time = 3
    #config.default_driver = :selenium_chrome_headless #roda com o nageador em background

end
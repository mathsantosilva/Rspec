require "allure-cucumber"
require "appium_lib"

require "fileutils"

# Limpa os logs e os screenshots
FileUtils.rm_f(Dir.glob("logs/*.json"))
FileUtils.rm_f(Dir.glob("logs/*.png"))
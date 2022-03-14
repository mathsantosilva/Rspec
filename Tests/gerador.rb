require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'faker'
require 'cpf_cnpj'
require "fileutils"
require 'nif'

def gerador_cpf(max)
    num = 0
    time = Time.new.strftime("%Y-%m-%d-%H-%M")
    nome = "CPF-" + time.to_s
    while num < max.to_i do
        text = CPF.generate
        num = num + 1
        File.open("#{nome}.txt", "a+") do |f|     
            f.write(text + "\n")   
          end
    end
end

def gerador_cnpj(max)
    num = 0
    time = Time.new.strftime("%Y-%m-%d-%H-%M")
    nome = "CNPJ-" + time.to_s
    while num < max.to_i do
        text = CNPJ.generate
        num = num + 1
        File.open("#{nome}.txt", "a+") do |f|     
            f.write(text + "\n")   
        end
    end
end

def gerador_nif(max)
    num = 0
    time = Time.new.strftime("%Y-%m-%d-%H-%M")
    nome = "NIF-" + time.to_s
    while num < max.to_i do
        text = Nif::Generator.generate
        num = num + 1
        File.open("#{nome}.txt", "a+") do |f|     
            f.write(text + "\n")   
        end
    end
end

def base(max)
    gerador_cpf(max)
    gerador_cnpj(max)
    gerador_nif(max)
    print("Arquivos Criados com sucesso")
end

base(2000)
require 'faker'
require 'cpf_cnpj'

# Classe para guardar complementos dos testes
class Complements
  def varcommon
    $cnpj = CNPJ.generate
    $cpf = CPF.generate
    $time = Time.new
  end

  def varcadastro 
    $codigo_aleatorio = Faker::Number.number(digits: 10)
    $nome_aleatorio = Faker::Name.name
    $email_aleatorio = Faker::Internet.email
    $endereco_aleatorio = Faker::Address.full_address
    $bairro_aleatorio = Faker::Address.secondary_address
    $estado_aleatorio = Faker::Address.state
    $cidade_aleatoria = Faker::Address.city
    $pais_aleatorio = Faker::Address.country
    $nome_empresa_aleatoria = Faker::Company.name
    $chave_aleatoria = Faker::Crypto.md5
    $url_aleatoria = Faker::Internet.url
    $text_aleatorio = Faker::Lorem.sentence
  end
end
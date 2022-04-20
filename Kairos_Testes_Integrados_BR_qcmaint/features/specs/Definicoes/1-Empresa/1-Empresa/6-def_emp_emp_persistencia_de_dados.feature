#language: pt

@empresa_persistencia_all
Funcionalidade: Validação do cadastro da empresa com informações repetidas

    @empresa_persistencia_cadastro_codigo
    Cenario: Validando o cadastro de empresa com codigo repetido
        Dado entro na tela de empresa
        Quando inicio a criação de empresa
        Quando coloco um codigo repetido e preencho o restante dos dados
        Quando clico em salvar para apresentar a mensagem
        Então devera apresentar a mensagem do codigo "Já existe uma Empresa com o código inserido"


    @empresa_persistencia_cadastro_razaosocial
    Cenario: Validando o cadastro de empresa com razão social repetida
        Dado entro na tela de empresa
        Quando inicio a criação de empresa
        Quando coloco uma razão social repetida e preencho o restante dos dados
        Quando clico em salvar para apresentar a mensagem
        Então devera apresentar a mensagem da razão social "A Razão Social escolhida já está em uso."


    @empresa_persistencia_cadastro_cnpj
    Cenario: Validando o cadastro de empresa com CNPJ repetido
        Dado entro na tela de empresa
        Quando inicio a criação de empresa
        Quando coloco um CNPJ repetido e preencho o restante dos dados
        Quando clico em salvar para apresentar a mensagem
        Então devera apresentar a mensagem do CNPJ "Já existe uma Empresa com o CNPJ/CPF inserido"

    @empresa_persistencia_cadastro_cpf
    Cenario: Validando o cadastro de empresa com CPF repetido
        Dado entro na tela de empresa
        Quando inicio a criação de empresa
        Quando coloco um CPF repetido e preencho o restante dos dados
        Quando clico em salvar para apresentar a mensagem
        Então devera apresentar a mensagem do CPF "Já existe uma Empresa com o CNPJ/CPF inserido"
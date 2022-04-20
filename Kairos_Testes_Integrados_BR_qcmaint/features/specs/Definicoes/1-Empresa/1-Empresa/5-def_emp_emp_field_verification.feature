#language: pt

@empresa_verifica_all
Funcionalidade: Verificação de campos

    @empresa_verifica_obrigatoriedade
    Cenario: Validando a obrigatoriedade dos campos
        Dado que entro na tela de empresa
        Quando vou na criação de empresa
        Quando clico em salvar sem preencher nada
        Então devera apresentar as mensagens de obrigatoriedade de campos 

    @empresa_verifica_valores_limite
    Cenario: Validando os valores limites dos campos
        Dado que entro na tela de empresa
        Quando vou na criação de empresa
        Quando preencho os campos com o valor limite
        Quando clico em salvar o cadastro
        Quando Acesso a empresa criada com limite nos campos
        Então devera conter somente a quantidade de caracteres aceitos pelos campos 

    @empresa_verifica_tipos_caracteres
    Cenario: Validando os tipos de caracteres dos campos
        Dado que entro na tela de empresa
        Quando vou na criação de empresa
        Quando preencho os campos com varios tipos de caracteres
        Quando clico em salvar
        Quando Acesso a empresa criada com caracteres aceitos
        Então devera conter somente os caracteres aceitos pelos campos 
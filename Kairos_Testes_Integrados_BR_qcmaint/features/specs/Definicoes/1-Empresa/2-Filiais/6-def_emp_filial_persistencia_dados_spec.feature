#language: pt

@filial_persistencia
Funcionalidade: Validação da persistencia dos dados das filiais

    @filial_persistencia_cod_repetido
    Cenario: Validação de codigo repetido

        Dado Faço login no sistema
        Quando Vou navegando até a tela de filiais
        Quando Clico em nova filial
        Então Tento criar outra filial com o mesmo codigo


    @filial_persistencia_cnpj_repetido
    Cenario: Validação de cnpj repetido

        Dado Faço login no sistema
        Quando Navego até a tela de filiais
        Quando Clico na nova filial
        Então Tento criar uma filial com o mesmo CNPJ


    
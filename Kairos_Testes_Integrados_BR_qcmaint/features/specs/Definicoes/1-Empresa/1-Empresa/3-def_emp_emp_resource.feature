#language: pt

@empresa_resource_all
Funcionalidade: Resource empresas

    @empresa_resource_create_ptbr 
    Cenario: Validando Resource no Create PTbr
        Dado que acesso a tela de empresa PTbr
        Quando acesso a criação de empresa PTbr
        Então todos os campos do create serão validados em portugues

    @empresa_resource_update_ptbr
    Cenario: Validando Resource no update PTbr
        Dado que acesso a tela de empresa PTbr
        Quando acesso o update de empresa PTbr
        Então todos os campos do update serão validados em portugues

    @empresa_resource_create_en 
    Cenario: Validando Resource no Create EN
        Dado que acesso a tela de empresa EN
        Quando acesso a criação de empresa EN
        Então todos os campos do create serão validados em Ingles

    @empresa_resource_update_en
    Cenario: Validando Resource no update EN
        Dado que acesso a tela de empresa EN
        Quando acesso o update de empresa EN
        Então todos os campos do update serão validados em Ingles

    @empresa_resource_create_es 
    Cenario: Validando Resource no Create espanhol
        Dado que acesso a tela de empresa espanhol
        Quando acesso a criação de empresa espanhol
        Então todos os campos do create serão validados em Espanhol

    @empresa_resource_update_es
    Cenario: Validando Resource no update espanhol
        Dado que acesso a tela de empresa espanhol
        Quando acesso o update de empresa espanhol
        Então todos os campos do update serão validados em Espanhol

    @empresa_resource_create_pt
    Cenario: Validando Resource no Create PTpt
        Dado que acesso a tela de empresa PTpt
        Quando acesso a criação de empresa PTpt
        Então todos os campos do create serão validados em portugues de portugal

    @empresa_resource_update_pt
    Cenario: Validando Resource no update PTpt
        Dado que acesso a tela de empresa PTpt
        Quando acesso o update de empresa PTpt
        Então todos os campos do update serão validados em portugues de portugal

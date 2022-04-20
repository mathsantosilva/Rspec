#language: pt

@empresa_resource_all
Funcionalidade: Resource empresas

    @empresa_resource_create_ptbr 
    Cenario: Validando Resource no Create PTbr
        Dado que acesso a tela de empresas-PTbr
        Quando acesso a criação de empresas-PTbr
        Então todos os campos do create serão validados em portugues

    @empresa_resource_update_ptbr
    Cenario: Validando Resource no update PTbr
        Dado que acesso a tela de empresas-PTbr
        Quando acesso o update de empresas-PTbr
        Então todos os campos do update serão validados em portugues

    @empresa_resource_create_en 
    Cenario: Validando Resource no Create EN
        Dado que acesso a tela de empresa-EN
        Quando acesso a criação de empresas-EN
        Então todos os campos do create serão validados em Ingles

    @empresa_resource_update_en
    Cenario: Validando Resource no update EN
        Dado que acesso a tela de empresas-EN
        Quando acesso o update de empresas-EN
        Então todos os campos do update serão validados em Ingles

    @empresa_resource_create_es 
    Cenario: Validando Resource no Create espanhol
        Dado que acesso a tela de empresas-espanhol
        Quando acesso a criação de empresas-espanhol
        Então todos os campos do create serão validados em Espanhol

    @empresa_resource_update_es
    Cenario: Validando Resource no update espanhol
        Dado que acesso a tela de empresas-espanhol
        Quando acesso o update de empresas-espanhol
        Então todos os campos do update serão validados em Espanhol

    @empresa_resource_create_pt
    Cenario: Validando Resource no Create PTpt
        Dado que acesso a tela de empresas-PTpt
        Quando acesso a criação de empresas-PTpt
        Então todos os campos do create serão validados em portugues de portugal

    @empresa_resource_update_pt
    Cenario: Validando Resource no update PTpt
        Dado que acesso a tela de empresas-PTpt
        Quando acesso o update de empresas-PTpt
        Então todos os campos do update serão validados em portugues de portugal

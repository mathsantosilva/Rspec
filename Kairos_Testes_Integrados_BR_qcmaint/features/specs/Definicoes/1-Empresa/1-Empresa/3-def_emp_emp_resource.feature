#language: pt

@empresa_resource_all
Funcionalidade: Resource empresas

    @resource_create_ptbr 
    Cenario: Validando Resource no Create PTbr
        Dado que acesso a tela de empresa PTbr
        Quando acesso a criação de empresa PTbr
        Então todos os campos do create serão validados em portugues

    @resource_update_ptbr
    Cenario: Validando Resource no update PTbr
        Dado que acesso a tela de empresa PTbr
        Quando acesso o update de empresa PTbr
        Então todos os campos do update serão validados em portugues

    @resource_crate_en 
    Cenario: Validando Resource no Create EN
        Dado que acesso a tela de empresa EN
        Quando acesso a criação de empresa EN
        Então todos os campos do create serão validados em Ingles

    @resource_update_en
    Cenario: Validando Resource no update EN
        Dado que acesso a tela de empresa EN
        Quando acesso o update de empresa EN
        Então todos os campos do update serão validados em Ingles

    @resource_crate_mx 
    Cenario: Validando Resource no Create MX
        Dado que acesso a tela de empresa MX
        Quando acesso a criação de empresa MX
        Então todos os campos do create serão validados em Espanhol

    @resource_update_mx
    Cenario: Validando Resource no update MX
        Dado que acesso a tela de empresa MX
        Quando acesso o update de empresa MX
        Então todos os campos do update serão validados em Espanhol

    @resource_crate_pt
    Cenario: Validando Resource no Create PTpt
        Dado que acesso a tela de empresa PTpt
        Quando acesso a criação de empresa PTpt
        Então todos os campos do create serão validados em portugues de portugal

    @resource_update_pt
    Cenario: Validando Resource no update PTpt
        Dado que acesso a tela de empresa PTpt
        Quando acesso o update de empresa PTpt
        Então todos os campos do update serão validados em portugues de portugal

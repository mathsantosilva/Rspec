#language: pt

@empresa_create
Funcionalidade: Criação de empresa

    @empresa_create_cnpj
    Cenario: Criação de Subempresa com CNPJ
        Dado que acesso a tela de empresas
        Quando preencho os dados e uso cnpj
        Quando aperto no botão salvar
        Então deverá apresentar uma mensagem "A Empresa foi criada com sucesso"

    @empresa_create_cpf
    Cenario: Criação de Subempresa com CPF
        Dado que acesso a tela de empresas
        Quando preencho os dados e uso cpf
        Quando clico no botão salvar
        Então devo receber uma mensagem "A Empresa foi criada com sucesso"
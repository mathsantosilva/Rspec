#language: pt

@empresa_update
Funcionalidade: Alteração de Empresa

    @empresa_update_cnpj
    Cenario: Alteração da empresa criada com CNPJ
        Dado que acesso a empresa criada com cnpj
        E altero os dados da empresa
        Quando for salvar o cadastro
        Então ira demonstrar a mensagem "Empresa editada com sucesso"

    @empresa_update_cnpj
    Cenario: Alteração da empresa criada com CPF
        Dado que acesso a empresa criada com cpf
        E altero os dados da empresa
        Quando for salvar o cadastro
        Então ira demonstrar a mensagem "Empresa editada com sucesso"
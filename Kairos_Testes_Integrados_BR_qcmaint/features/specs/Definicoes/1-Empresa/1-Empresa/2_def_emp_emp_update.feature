#language: pt

@empresa_update
Funcionalidade: Alteração de Empresa

    @empresa_update_cnpj
    Cenario: Alteração da empresa criada com CNPJ
        Dado que acesso a empresa criada com cnpj
        Quando altero os dados da empresa com cnpj
        Quando for salvar o cadastro com cnpj
        Então ira demonstrar a mensagem "Empresa editada com sucesso"

    @empresa_update_cnpj
    Cenario: Alteração da empresa criada com CPF
        Dado que acesso a empresa criada com cpf
        Quando altero os dados da empresa com cpf
        Quando for salvar o cadastro com cpf
        Então ira informar a mensagem "Empresa editada com sucesso"
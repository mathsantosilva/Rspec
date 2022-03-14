#language: pt

@filial_verificacao
Funcionalidade: Verificação dos campos das filiais

    @filial_campos_obrigatorios
    Cenario: Validação dos campos obrigatorios

        Dado Logo no sistema
        Quando Acesso a tela de filiais e clico em nova filial
        Quando Clico no botão para salvar
        Então Verifico os campos obrigatorios para cadastro


    @filial_valores_limites
    Cenario: Validação dos valores limites

        Dado Logo no sistema
        Quando Navego até a tela de filiais
        Quando Preencho os campos com o maximo de caracteres permitidos e clico para salvar
        Então Clico para alterar e verifico se foi cadastrada a quantidade correta de caracteres


    @filial_caracteres_especiais
    Cenario: Validação dos caracteres especiais

        Dado Logo no sistema
        Quando Vou até a tela de filiais
        Quando Preencho os campos com caracteres especiais , aguardo mensagens de erro e preencho os campos corretamente
        Então Espero uma mensagem de confirmação "A Filial foi criada com sucesso"
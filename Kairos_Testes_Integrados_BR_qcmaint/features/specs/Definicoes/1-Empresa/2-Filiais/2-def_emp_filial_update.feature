#language: pt

@filial_update
Funcionalidade: Alteração de filiais

    @filial_alteração
    Cenario: Alteração da empresa filial

        Dado Acesso a tela de filiais e clico para alterar
        Quando Realizo a alteração da filial
        Quando Aperto no botão salvar
        Então Aguardo uma mensagem de alteração "Filial editada com sucesso"
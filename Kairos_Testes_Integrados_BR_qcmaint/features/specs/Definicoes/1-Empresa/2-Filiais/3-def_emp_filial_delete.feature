#language: pt

@filial_delete
Funcionalidade: Remoção de de filiais

    @filial_remocao
    Cenario: Removendo a empresa filial

        Dado Acesso a tela de filiais para deletar
        Quando Clico para remover a filial
        Quando Confirmo a remoção da filial
        Então Aguardo uma mensagem de remoção "A Filial foi removida com sucesso"
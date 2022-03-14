#language: pt

@obras_create
Funcionalidade: Criação de obras

    @obras_create_looping
    Cenario: criando uma nova obra
        Dado que acesso a tela de obras
        Quando inicio o cadastro de uma nova obra
        Então ela deverá apresentar a mensagem "Obra cadastrada com sucesso."


    @obras_delete
    Cenario: deletando todos as obras
        Dado que acesso as obras cadsatradas
        Quando inicio a exclusão
        Então deverá remover corretamente todas as obras
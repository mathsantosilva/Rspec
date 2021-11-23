#language: pt

Funcionalidade: Login

    Cenario: Login com sucesso

        Dado que acesso a tela de Login
        Quando submeto minhas credencias
            |email|eu@matheus.io|
            |senha|qaninja|
        Então devo ver a notificação: "Show! Suas credenciais são validas."
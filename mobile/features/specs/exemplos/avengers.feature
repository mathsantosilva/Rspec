#language: pt

Funcionalidade: Avengers

    Cenario: Remover o Capitão America

        Dado que acesso a tela Avengers
        Quando eu apago o Capitão America
        Então devo ver a seguinte mensagem: "Item removido! (posição = 0)"
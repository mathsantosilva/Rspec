#language: pt

@login
Funcionalidade: Login

    @login_dados_correto
    Cenario: Login com dados corretos

        Dado que acesso a tela de Login
        Quando insiro os dados de email e senha corretos
            |email|teste17865@dimep.com.br|
            |senha|1|
        Então deverá logar com sucesso 

    @login_senha_incorreta
    Cenario: Login com a senha incorreta

        Dado que acesso a tela de Login
        Quando insiro os dados de email e senha incorretos
            |email|teste17865@dimep.com.br|
            |senha|123456789|
        Então devera informar a mensagem "Usuário e/ou senha estão incorretos."

    @login_email_incorreto
    Cenario: Login com a email incorreto

        Dado que acesso a tela de Login
        Quando insiro os dados de email incorreto e senha
            |email|testeincorreto@dimep.com.br|
            |senha|1|
        Então devera informar a mensagem "Usuário e/ou senha estão incorretos."

    @login_senha_alterada
    Cenario: Login com a senha incorreta

        Dado que acesso a tela de Login
        E acesso a tela de alteração de senha
        E Inseri os dados atuais de login e senha 
            |email|teste16578@dimep.com.br|
            |senha|1|
        Quando insiro os dados de email e nova senha
            |email|teste16578@dimep.com.br|
            |senha|2|
        Então deverá logar com sucesso 
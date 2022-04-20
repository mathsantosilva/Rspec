#language: pt

@falta_atraso_tratamento_all
Funcionalidade: tratamento de falta e atraso

    @falta_atraso_tratamento_falta
    Cenario: Tratando ocorrencia de falta
        Dado que acesso a tela de faltas e atrasos
        Quando seleciono uma ocorrencia de falta
        Quando clico em justificar e seleciono uma justificativa
        Quando no popup clico em salvar
        Quando devo ver o popup de "Realizando Tratamento"
        Quando devo ver o segundo popup "Realizando Cálculo..."
        Então devo retornar para a tela de Faltas e atrasos

    @falta_atraso_tratamento_atraso
    Cenario: Tratando ocorrencia de atraso
        Dado que acesso a tela de faltas e atrasos
        Quando seleciono uma ocorrencia de atraso
        Quando clico em justificar e seleciono uma justificativa
        Quando no popup clico em salvar
        Quando devo ver o popup de "Realizando Tratamento"
        Quando devo ver o segundo popup "Realizando Cálculo..."
        Então devo retornar para a tela de Faltas e atrasos

    @falta_atraso_validando_valores_e_layout
    Cenario: Validando se quando é tratado a ocorrencia os valores e tela são atualizados
        Dado que acesso a tela de faltas e atrasos
        Quando pego os valores de Ocorrencias Por tratar e tratadas
        Quando seleciono uma ocorrencia de falta
        Quando clico em justificar e seleciono uma justificativa
        Quando no popup clico em salvar
        Quando devo ver o popup de "Realizando Tratamento"
        Quando devo ver o segundo popup "Realizando Cálculo..."
        Então Deve não deve constar o dia para tratamento e os valores devem ter sido alterados
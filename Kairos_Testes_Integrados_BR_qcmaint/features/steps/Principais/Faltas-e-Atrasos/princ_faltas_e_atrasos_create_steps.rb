Dado('que acesso a tela de faltas e atrasos') do
    # Realiza login
    @login.logon_br
    # Acessando a empresa pela navegacao de telas
    @common.nav_mod('Pessoas')
    find('span[id="Tab3"]').click
end

Quando('seleciono uma ocorrencia de falta') do
  @common.selecionarprimeiraocorrencia
end

Quando('clico em justificar e seleciono uma justificativa') do
    find('input[id="Justificar"]').click
    select('Saída a Serviço', from: 'JustificativaList').select_option
    find('label[id="HorasRadioLabel"]').click
    label = find('#horas > div:nth-child(1)')
    expect(label).to have_content 'Horas :'

end

Quando('no popup clico em salvar') do
  find('span[id="SaveHorarios"]').click
end

Quando('devo ver o popup de {string}') do |title|
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('devo ver o segundo popup {string}') do |title|
  pending # Write code here that turns the phrase above into concrete actions
end

Então('devo retornar para a tela de Faltas e atrasos') do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('seleciono uma ocorrencia de atraso') do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('pego os valores de Ocorrencias Por tratar e tratadas') do
  pending # Write code here that turns the phrase above into concrete actions
end

Então('Deve não deve constar o dia para tratamento e os valores devem ter sido alterados') do
  pending # Write code here that turns the phrase above into concrete actions
end
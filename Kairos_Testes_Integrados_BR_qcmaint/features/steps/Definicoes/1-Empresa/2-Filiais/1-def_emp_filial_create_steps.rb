Dado('Acesso a tela de filiais') do

  #logando
  components.logon_br

  #Acessando o cadastro da empresa filial pela navegação de telas
  components.nav('Empresa','div[id="MenuFiliais"')

  @complements.varcommon
  @complements.varcadastro

  find('label[class="pointer"]').click

end

Quando('Cadastrando uma nova filial') do

  @cadastros.cadas_emp_filial()

end

E('Apertando no botão salvar') do

  drop = find("input[type=submit][value='Salvar']", match: :first)
  drop.click
    
end

Então('Aguardo uma mensagem de confirmação') do |message|
  expect(find('div[class=validation-summary-ok]')).to have_content message
end
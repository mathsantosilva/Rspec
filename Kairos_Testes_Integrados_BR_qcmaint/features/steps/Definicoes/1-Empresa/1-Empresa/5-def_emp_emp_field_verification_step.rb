# O Dado e o primeiro quando são utilizados em todos os cenarios
# Primeiro cenario
Dado('que entro na tela de empresa') do
    # Realiza login
    @login.logon_br
    # Acessando a empresa pela navegacao de telas
    @common.nav_def('Empresa', 'div[id="MenuEmpresas"]')
    @complements.varcommon
    @complements.varcadastro
    @common.obtercodigoempresa
end

Quando('vou na criação de empresa') do
    @common.remove_chat
    find('label[class="pointer"]').click  
end

Quando('clico em salvar sem preencher nada') do
    @common.botaosalvar
end

Então('devera apresentar as mensagens de obrigatoriedade de campos') do
    expect(page.assert_selector('input.input-validation-error', count: 9))
    @resources.valida_mensagem_campos($resources_mensagem_obrigacao_empresa)  
end

# Segundo cenario
Quando('preencho os campos com o valor limite') do
    @codigoAtual = $codigo_aleatorio.to_s.slice(0,9)
    fill_in 'Empresa_Codigo', with: $codigo_aleatorio
    fill_in 'Empresa_CEI', with: '294226088484'
    fill_in 'Empresa_Telefone', with: '11111111111111111111111111111111111111111111111111'
    fill_in 'Empresa_RazaoSocial', with: 'Não tem Limite' << ' ' << $time.to_s
    fill_in 'Empresa_CnpjCpf', with: $cnpj
    fill_in 'Empresa_Endereco', with: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    fill_in 'Empresa_Bairro', with: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    fill_in 'Empresa_Cidade', with: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    fill_in 'Empresa_UF', with: 'xxxxxxxxxx'
    fill_in 'Empresa_Pais', with: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    fill_in 'Empresa_URL', with: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    fill_in 'Empresa_Email', with: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx@xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.com.brrrrrrrrrrr'
    fill_in 'Empresa_DataAbertura', with: '01012021'
    fill_in 'connectChave_ChaveConnect', with: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
end

Quando('clico em salvar o cadastro') do
    @common.botaosalvar 
end

Quando('Acesso a empresa criada com limite nos campos') do
    @common.select_list_table(@codigoAtual, 'img[class="pointer icons editIcon"]') 
end

Então('devera conter somente a quantidade de caracteres aceitos pelos campos') do
    expect(find('input[id="Empresa_Codigo"]')).to have_attributes(:value => @codigoAtual)
    expect(find('input[id="Empresa_Telefone"]')).to have_attributes(:value => '11111111111111111111')
    expect(find('input[id="Empresa_Endereco"]')).to have_attributes(:value => 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
    expect(find('input[id="Empresa_Bairro"]')).to have_attributes(:value => 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
    expect(find('input[id="Empresa_Cidade"]')).to have_attributes(:value => 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
    expect(find('input[id="Empresa_UF"]')).to have_attributes(:value => 'xx')
    expect(find('input[id="Empresa_Pais"]')).to have_attributes(:value => 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
    expect(find('input[id="Empresa_URL"]')).to have_attributes(:value => 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
    expect(find('input[id="Empresa_Email"]')).to have_attributes(:value => 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx@xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.com.br')
    expect(find('input[id="connectChave_ChaveConnect"]')).to have_attributes(:value => 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx') 
end

# Terceiro cenario
Quando('preencho os campos com varios tipos de caracteres') do
    @codigoAtual = $codigo_aleatorio.to_s.slice(0,9)
    fill_in 'Empresa_Codigo', with: @codigoAtual
    fill_in 'Empresa_CEI', with: '294226088484'
    fill_in 'Empresa_Telefone', with: '11111111111111111111'
    fill_in 'Empresa_RazaoSocial', with: 'Não tem limite de caracteres' << ' ' << $time.to_s
    fill_in 'Empresa_CnpjCpf', with: $cnpj
    fill_in 'Empresa_Endereco', with: "1a2b3c4d5e6f7g8h9i1j0k1l1m1n1o1p1q1r1s1t1u1v1x1w1y1z1!@#$%¨&*()?:><^}{`|'11111111111111111111111111111111111111111111111111111222222222222222222222222222222222222222222222222222222222222222222223333"
    fill_in 'Empresa_Bairro', with: "1a2b3c4d5e6f7g8h9i1j0k1l1m1n1o1p1q1r1s1t1u1v1x1w1y1z1!@#$%¨&*()?:><^}{`|'11111"
    fill_in 'Empresa_Cidade', with: "1a2b3c4d5e6f7g8h9i1j0k1l1m1n1o1p1q1r1s1t1u1v1x1w1y1z1!@#$%¨&*()?:><^}{`|'11111"
    fill_in 'Empresa_UF', with: "1a"
    fill_in 'Empresa_Pais', with: "1a2b3c4d5e6f7g8h9i1j0k1l1m1n1o1p1q1r1s1t1u1v1x1w1y"
    fill_in 'Empresa_URL', with: "1a2b3c4d5e6f7g8h9i1j0k1l1m1n1o1p1q1r1s1t1u1v1x1w1y1z1!@#$%¨&*()?:><^}{`|'11111111111111111111111111111111111111111111111111111222222222222222222222222222222222222222222222222222222222222222222223333"
    fill_in 'Empresa_Email', with: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx@xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.com.br"
    fill_in 'Empresa_DataAbertura', with: '01012021'
    fill_in 'connectChave_ChaveConnect', with: "1a2b3c4d5e6f7g8h9i1j0k1l1m1n1o1p"   
end

Quando('clico em salvar') do
    @common.botaosalvar 
end

Quando('Acesso a empresa criada com caracteres aceitos') do
    @common.select_list_table(@codigoAtual, 'img[class="pointer icons editIcon"]') 
end

Então('devera conter somente os caracteres aceitos pelos campos') do
    expect(find('input[id="Empresa_Codigo"]')).to have_attributes(:value => @codigoAtual)					
    expect(find('input[id="Empresa_Telefone"]')).to have_attributes(:value => '11111111111111111111') 					
    expect(find('input[id="Empresa_Endereco"]')).to have_attributes(:value => "1a2b3c4d5e6f7g8h9i1j0k1l1m1n1o1p1q1r1s1t1u1v1x1w1y1z1!@#$%¨&*()?:><^}{`|'11111111111111111111111111111111111111111111111111111222222222222222222222222222222222222222222222222222222222222222222223333")				
    expect(find('input[id="Empresa_Bairro"]')).to have_attributes(:value => "1a2b3c4d5e6f7g8h9i1j0k1l1m1n1o1p1q1r1s1t1u1v1x1w1y1z1!@#$%¨&*()?:><^}{`|'11111")				
    expect(find('input[id="Empresa_Cidade"]')).to have_attributes(:value => "1a2b3c4d5e6f7g8h9i1j0k1l1m1n1o1p1q1r1s1t1u1v1x1w1y1z1!@#$%¨&*()?:><^}{`|'11111")				
    expect(find('input[id="Empresa_UF"]')).to have_attributes(:value => '1a')				
    expect(find('input[id="Empresa_Pais"]')).to have_attributes(:value => '1a2b3c4d5e6f7g8h9i1j0k1l1m1n1o1p1q1r1s1t1u1v1x1w1y')					
    expect(find('input[id="Empresa_URL"]')).to have_attributes(:value => "1a2b3c4d5e6f7g8h9i1j0k1l1m1n1o1p1q1r1s1t1u1v1x1w1y1z1!@#$%¨&*()?:><^}{`|'11111111111111111111111111111111111111111111111111111222222222222222222222222222222222222222222222222222222222222222222223333")					
    expect(find('input[id="Empresa_Email"]')).to have_attributes(:value => 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx@xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.com.br')					
    expect(find('input[id="connectChave_ChaveConnect"]')).to have_attributes(:value => '1a2b3c4d5e6f7g8h9i1j0k1l1m1n1o1p')
end
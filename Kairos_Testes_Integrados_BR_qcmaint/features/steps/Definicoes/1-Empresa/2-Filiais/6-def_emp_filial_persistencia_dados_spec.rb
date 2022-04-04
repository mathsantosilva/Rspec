Dado 'Faço login no sistema' do

    #Faço login no sistema
    @login.logon_br

end

Quando 'Vou navegando até a tela de filiais' do

     # Acessando o cadastro da empresa filial pela navegação de telas
     @common.nav_def('Empresa','div[id="MenuFiliais"')


end

Quando 'Clico em nova filial' do

    #Clico em nova filial
    find('label[class="pointer"]').click

end

Então 'Tento criar outra filial com o mesmo codigo' do

    @cadastros.cadas_emp_cod_repetido()

end




Quando 'Navego para a tela de filiais' do

    # Acessando o cadastro da empresa filial pela navegação de telas
    @common.nav_def('Empresa','div[id="MenuFiliais"')

end

Quando 'Clico na nova filial' do

    #Clico em nova filial
    find('label[class="pointer"]').click

end

Então 'Tento criar uma filial com o mesmo CNPJ' do

    @cadastros.cadas_emp_cnpj_repetido()

end
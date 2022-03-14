Dado('que acesso as obras cadsatradas') do
    # Realiza login
    @login.logon_br
    # Acessando a empresa pela navegacao de telas
    @common.nav_mod('Obras')
    # Carrega as variaveis utilizadas nas spec
    @complements.varcommon
    @complements.varcadastro
end

Quando('inicio a exclusão') do

    within('table[class="ContentTable"]') do
        itens = find("tbody > tr").size
        puts itens
    end

end

Então('deverá remover corretamente todas as obras') do

end
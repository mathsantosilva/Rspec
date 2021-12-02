Dado('que acesso a tela de Login') do
    #acessando a tela de login kairos
end

Quando('insiro os dados de email e senha corretos') do |table|
    user = table.rows_hash
    @login.logar(user[:email], user[:senha])
end

Então('deverá logar com sucesso') do
    expect(page).to have_current_path('https://www.dimepkairos.com.br/Dimep/Dashboard')
end

Quando('insiro os dados de email e senha incorretos') do |table|
    user = table.rows_hash
    @login.logar(user[:email], user[:senha])
end

Então('devera informar a mensagem ') do |message_success|
    expect(find('span[style="display:inline-block;"]')).to have_content message_success
end


Quando('insiro os dados de email incorreto e senha') do |table|
    user = table.rows_hash
    @login.logar(user[:email], user[:senha])
end

Então('devera informar a mensagem') do |message_success|
    expect(find('span[style="display:inline-block;"]')).to have_content message_success
end

E ('acesso a tela de alteração de senha') do
    find('a[style="font-size: 0.9em;"]', text: "Alterar a senha").click
end

E ('Insiro os dados atuais de login e senha ') do |table|
    user = table.rows_hash
    @login.logar(user[:email], user[:senha])
    within('div[class="links-acesso"]') do
    sleep 10
    find('a[style="font-size: 0.9em;"]', text: "Alterar a senha", visible: false).click
    end
    fill_in 'Username', with: user[:email]
    fill_in 'Password', with: user[:senha]
    fill_in 'NewPassword', with: '2'
    fill_in 'RepeatNewPassword', with: '2'
    find('input[class="Pointer submitLogin"]').click
end

Quando('insiro os dados de email e nova senha') do |table|
    user = table.rows_hash
    @login.logar(user[:email], user[:senha])
end


# describe 'escalas de folgas', :folgas do
#   before(:each) do
#     visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

#      fill_in 'LogOnModel_UserName', with: 'teste24052021@teste.com'
#     fill_in 'LogOnModel_Password', with: '1'
#     click_button 'Entrar'
    
#     visit '/admin/EscalasFolgas'
#    end

#   it 'CT024 Inserir uma nova folga', :ct024_folgas do
#     select('07/04/2021 - 09/04/2021 (Atual)', from: 'select_periodos').select_option
#     find('label[for="1"]', visible: false).set(true)
#     sleep 5

#     drop = find("input[type=button][value='Pesquisar Escalas de Folgas']", match: :first)
#     drop.click
#   end
# end

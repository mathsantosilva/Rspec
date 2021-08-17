# describe 'escalas de horario', :escalas do
#   before(:each) do
#     visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

#     fill_in 'LogOnModel_UserName', with: 'teste24052021@teste.com'
#     fill_in 'LogOnModel_Password', with: '1'
#     click_button 'Entrar'
    
#     visit '/admin/EscalasHorario'
#   end

#   it 'CT023 Inserir uma nova escala', :ct023_escalas do
#     select('07/04/2021 - 09/04/2021 (Atual)', from: 'select_periodos').select_option
#     find('label[for="1"]', visible: false).set(true)
#     drop = find("input[type=submit][value='Pesquisar Escalas de Horário']", match: :first)
#     drop.click
#     find('label[for="#1073"]', visible: false).set(true)
#     drop = find("input[type=button][value='Atualizar Escalas']", match: :first)
#     sleep 5
#   end
# end

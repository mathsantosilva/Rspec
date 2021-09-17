describe 'filial', :alterando_filial do
    before(:each) do
      visit '/'
  
      fill_in 'LogOnModel_UserName', with: @login
      fill_in 'LogOnModel_Password', with: @senha
      click_button 'Entrar'
  
      # Acessando a empresa filial pela navegação de telas
      selecionar = find('div[id="toggleUserDefinitions"]')
      selecionar.hover
      sleep 3
      find('div[class="pointer DropDownHeaderElement"]', text: 'Empresa').click
      find('div[id="MenuFiliais"]').click
        within('table tbody tr', text:'Empresa Filial') do
            sleep 2
            #button = browser.scroll.to :center
            selecionar = find('td[style="width: 55%;"]', text: 'Empresa Filial')
            sleep 2
            selecionar.hover
            sleep 2
            find('span[class="spanButtonText"]', text: 'Alterar').click
        end
    end
        # msg = find('div[class="validation-summary-ok"]')
        # expect(msg).to have_content 'A Filial foi removida com sucesso'


    it 'Realizando a alteração da filial' do
        fill_in 'Filial_Codigo', with: '6969'
        fill_in 'Filial_Telefone', with: '888888888'
        fill_in 'Filial_Descricao', with: 'Empresa Filial Alterada'
        fill_in 'Filial_CnpjCpf', with: @cnpj_cpf_filial
        fill_in 'Filial_Endereco', with: @rua_aleatoria
        fill_in 'Filial_Cidade', with: @cidade_aleatoria
        fill_in 'Filial_Bairro', with: 'Vila Nossa Senhora'
        fill_in 'Filial_UF', with: 'RJ'
        fill_in 'Filial_Pais', with: @pais_aleatorio
        fill_in 'Filial_URL', with: 'http://filialalterada.com.br'
        fill_in 'Filial_Email', with: @email_aleatorio
        select('UTC (GMT)', from: 'Filial_FusoHorario_Id').select_option
        find('label[for="checkHabilitaHorarioVerao"]', visible: false).set(true)
        fill_in 'Filial.InicioHorarioVerao', with: '13102021'
        fill_in 'Filial_FimHorarioVerao', with: '13112021'
        fill_in 'Filial_DataPrevisaoProximoFechamento', with: '13042021'
        fill_in 'Filial_DataLimiteTratamentoPonto', with: '13052021'
        fill_in 'ConnectChave_ChaveConnect', with: 'CHAVE ALTERADA'
    
        drop = find("input[type=submit][value='Salvar']", match: :first)
        drop.click
        sleep 2
    
        expect(find('div[class=validation-summary-ok]')).to have_content 'Filial editada com sucesso'
    
    end
    

end
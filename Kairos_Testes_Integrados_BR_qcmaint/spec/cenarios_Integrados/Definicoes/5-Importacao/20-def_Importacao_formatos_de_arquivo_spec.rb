describe 'Cadastro de formato de arquivo', :formatos_br do
    before(:each) do
        visit '/'
        fill_in 'LogOnModel_UserName', with: $user_br
        fill_in 'LogOnModel_Password', with: $senha
        click_button 'btnFormLogin'
        card = find('label[class="labelDefinitions pointer"]')
        card.hover
        find('div[class="pointer DropDownHeaderElement"]', text: 'Importação').click
        sleep 5
        # Fechar Popup chato
        # find('div[class="close-button-modular"]').click
        
    end
 
    it 'Todos os cadastros', :cadastrando_todos_formatos do
        #Estruturas
        puts 'Criando Estruturas'
        find('label[class="pointer"]').click
        find('input[name="FormatoArquivoColetaApontamentos.Codigo"]').set '10'
        find('input[id="FormatoArquivoColetaApontamentos_Descricao"]').set 'Teste - Formato Estruturas'
        find('input[id="tbInicio2011"]').set '1'
        find('input[id="tbFim2011"]').set '3'
        find('input[id="tbInicio2012"]').set '4'
        find('input[id="tbFim2012"]').set '10'
        drop = find("input[type=button][value='Salvar']", match: :first)
        drop.click
        msg = find('div[class="validation-summary-ok"]')
        expect(msg).to have_content 'O Formato de arquivo de importação de estruturas foi adicionado com sucesso'

        #Cargos
        puts 'Criando Cargos'
        find('span[id="TabCargo"]').click
        find('label[class="pointer"]').click
        find('input[id="FormatoArquivoColetaApontamentos_Codigo"]').set '10'
        find('input[id="FormatoArquivoColetaApontamentos_Descricao"]').set 'Teste - Formato Cargos'
        find('input[id="tbInicio3501"]').set '1'
        find('input[id="tbFim3501"]').set '3'
        find('input[id="tbInicio3502"]').set '4'
        find('input[id="tbFim3502"]').set '10' 
        drop = find("input[type=button][value='Salvar']", match: :first)
        drop.click
        msg = find('div[class="validation-summary-ok"]')
        expect(msg).to have_content 'O Formato de arquivo de importação de cargos foi adicionado com sucesso'

        #inclusão de pessoas
        puts 'Criando inclusão de pessoas'
        find('span[id="TabFuncionarios"]').click
        find('label[class="pointer"]').click
        find('input[id="FormatoArquivoColetaApontamentos_Codigo"]').set '10'
        find('input[id="FormatoArquivoColetaApontamentos_Descricao"]').set 'Teste - Formato Pessoa - Inclusão - Alteração'
        find('input[id="tbInicio1101"]').set '1'
        find('input[id="tbFim1101"]').set '3'
        find('input[id="tbInicio1102"]').set '4'
        find('input[id="tbFim1102"]').set '14'
        find('input[id="tbInicio1103"]').set '15'
        find('input[id="tbFim1103"]').set '17'
        find('input[id="tbInicio1104"]').set '18'
        find('input[id="tbFim1104"]').set '25'
        find('input[id="tbInicio1107"]').set '26'
        find('input[id="tbFim1107"]').set '33'
        find('input[id="tbInicio1113"]').set '34'
        find('input[id="tbFim1113"]').set '34'
        find('input[id="tbInicio1114"]').set '35'
        find('input[id="tbFim1114"]').set '37'
        drop = find("input[type=button][value='Salvar']", match: :first)
        drop.click
        msg = find('div[class="validation-summary-ok"]')
        expect(msg).to have_content 'O Formato de arquivo de importação de pessoas foi adicionado com sucesso'
 
        #Desligamento de pessoas
        puts 'Criando Desligamento de pessoas'
        find('span[id="TabFuncionarios"]').click
        find('span[id="TabDesligamento"]').click
        find('label[class="pointer"]').click
        find('input[id="FormatoArquivoColetaApontamentos_Codigo"]').set '10'
        find('input[id="FormatoArquivoColetaApontamentos_Descricao"]').set 'Teste - Formato Pessoa - Desligamento'
        find('input[id="tbInicio3201"]').set '1'
        find('input[id="tbFim3201"]').set '3'
        find('input[id="tbInicio3202"]').set '4'
        find('input[id="tbFim3202"]').set '14'
        find('input[id="tbInicio3203"]').set '15'
        find('input[id="tbFim3203"]').set '17'
        find('input[id="tbInicio3204"]').set '18'
        find('input[id="tbFim3204"]').set '25'
        drop = find("input[type=button][value='Salvar']", match: :first)
        drop.click
        msg = find('div[class="validation-summary-ok"]')
        expect(msg).to have_content 'O Formato de arquivo de importação de desligamentos foi adicionado com sucesso'

        #Ferias pessoas
        puts 'Criando Ferias pessoas'
        find('span[id="TabFuncionarios"]').click
        find('span[id="TabFerias"]').click
        find('label[class="pointer"]').click
        find('input[id="FormatoArquivoColetaApontamentos_Codigo"]').set '10'
        find('input[id="FormatoArquivoColetaApontamentos_Descricao"]').set 'Teste - Formato Pessoa - Ferias'
        find('input[id="tbInicio3401"]').set '1'
        find('input[id="tbFim3401"]').set '3'
        find('input[id="tbInicio3402"]').set '4'
        find('input[id="tbFim3402"]').set '14'
        find('input[id="tbInicio3403"]').set '15'
        find('input[id="tbFim3403"]').set '22'
        find('input[id="tbInicio3404"]').set '23'
        find('input[id="tbFim3404"]').set '30'
        find('input[id="tbInicio3405"]').set '31'
        find('input[id="tbFim3405"]').set '31'
        find('input[id="tbInicio3406"]').set '32'
        find('input[id="tbFim3406"]').set '32'
        drop = find("input[type=button][value='Salvar']", match: :first)
        drop.click
        msg = find('div[class="validation-summary-ok"]')
        expect(msg).to have_content 'Formato de arquivo de importação de férias editado com sucesso'

        #Afastamento pessoas
        puts 'Criando Afastamento pessoas'
        find('span[id="TabFuncionarios"]').click
        find('span[id="TabAfastamento"]').click
        find('label[class="pointer"]').click
        find('input[id="FormatoArquivoColetaApontamentos_Codigo"]').set '10'
        find('input[id="FormatoArquivoColetaApontamentos_Descricao"]').set 'Teste - Formato Pessoa - Afastamento'
        find('input[id="tbInicio3301"]').set '1'
        find('input[id="tbFim3301"]').set '3'
        find('input[id="tbInicio3302"]').set '4'
        find('input[id="tbFim3302"]').set '14'
        find('input[id="tbInicio3303"]').set '15'
        find('input[id="tbFim3303"]').set '17'
        find('input[id="tbInicio3304"]').set '18'
        find('input[id="tbFim3304"]').set '25'
        find('input[id="tbInicio3305"]').set '26'
        find('input[id="tbFim3305"]').set '33'
        drop = find("input[type=button][value='Salvar']", match: :first)
        drop.click
        msg = find('div[class="validation-summary-ok"]')
        expect(msg).to have_content 'O Formato de arquivo de importação de afastamentos foi adicionado com sucesso'

        #Coleta de marcações 
        puts 'Criando Coleta de marcações'
        find('span[id="TabColetaApontamentos"]').click
        find('label[class="pointer"]').click
        find('input[id="FormatoArquivoColetaApontamentos_Codigo"]').set '10'
        find('input[id="FormatoArquivoColetaApontamentos_Descricao"]').set 'Teste - Formato Coleta de Marcações'
        select('Formato REP', from: 'ddlTipoArquivo')
        find('input[id="FormatoArquivoColetaApontamentos_LinhaComecoImportacao"]').set '1'
        find('input[id="tbInicio1001"]').set '1'
        find('input[id="tbFim1001"]').set '11'
        find('input[id="tbInicio1002"]').set '12'
        find('input[id="tbFim1002"]').set '13'
        find('input[id="tbInicio1003"]').set '14'
        find('input[id="tbFim1003"]').set '15'
        find('input[id="tbInicio1004"]').set '16'
        find('input[id="tbFim1004"]').set '19'
        find('input[id="tbInicio1005"]').set '20'
        find('input[id="tbFim1005"]').set '21'
        find('input[id="tbInicio1006"]').set '22'
        find('input[id="tbFim1006"]').set '23'
        find('input[id="tbInicio1007"]').set '24'
        find('input[id="tbFim1007"]').set '24'
        drop = find("input[type=button][value='Salvar']", match: :first)
        drop.click
        msg = find('div[class="validation-summary-ok"]')
        expect(msg).to have_content 'O Formato de arquivo de Importação de Marcações foi adicionado com sucesso'

        #Escala de Folga
        puts 'Criando Escala de Folga'
        find('span[id="TabColetaEscalas"]').click
        find('label[class="pointer"]').click
        find('input[id="FormatoArquivoColetaApontamentos_Codigo"]').set '10'
        find('input[id="FormatoArquivoColetaApontamentos_Descricao"]').set 'Teste - Formato Escalas - Folgas'
        find('input[id="tbInicio3701"]').set '1'
        find('input[id="tbFim3701"]').set '3'
        find('input[id="tbInicio3702"]').set '4'
        find('input[id="tbFim3702"]').set '14'
        find('input[id="tbInicio3703"]').set '15'
        find('input[id="tbFim3703"]').set '22'
        drop = find("input[type=button][value='Salvar']", match: :first)
        drop.click
        msg = find('div[class="validation-summary-ok"]')
        expect(msg).to have_content 'O Formato de arquivo de importação de escalas de folgas foi adicionado com sucesso'

        #Escala de Horario
        puts 'Criando Escala de Horario'
        find('span[id="TabColetaEscalas"]').click
        find('span[id="TabEscalasHorarios"]').click
        find('label[class="pointer"]').click
        find('input[id="FormatoArquivoColetaApontamentos_Codigo"]').set '10'
        find('input[id="FormatoArquivoColetaApontamentos_Descricao"]').set 'Teste - Formato Escalas - Horarios'
        find('input[id="tbInicio3801"]').set '1'
        find('input[id="tbFim3801"]').set '3'
        find('input[id="tbInicio3802"]').set '4'
        find('input[id="tbFim3802"]').set '14'
        find('input[id="tbInicio3803"]').set '15'
        find('input[id="tbFim3803"]').set '22'
        find('input[id="tbInicio3804"]').set '23'
        find('input[id="tbFim3804"]').set '23'
        drop = find("input[type=button][value='Salvar']", match: :first)
        drop.click
        msg = find('div[class="validation-summary-ok"]')
        expect(msg).to have_content 'O Formato de arquivo de importação de escalas de horários foi adicionado com sucesso'

        #Usuarios
        puts 'Criando Usuarios'
        find('span[id="TabUsuarios"]').click
        find('label[class="pointer"]').click
        find('input[id="FormatoArquivoColetaApontamentos_Codigo"]').set '10'
        find('input[id="FormatoArquivoColetaApontamentos_Descricao"]').set 'Teste - Formato Usuario'
        find('input[id="tbInicio3901"]').set '1'
        find('input[id="tbFim3901"]').set '7'
        find('input[id="tbInicio3902"]').set '8'
        find('input[id="tbFim3902"]').set '10'
        find('input[id="tbInicio3904"]').set '11'
        find('input[id="tbFim3904"]').set '13'
        find('input[id="tbInicio3905"]').set '14'
        find('input[id="tbFim3905"]').set '14'
        find('input[id="tbInicio3906"]').set '15'
        find('input[id="tbFim3906"]').set '15'
        find('input[id="tbInicio3907"]').set '16'
        find('input[id="tbFim3907"]').set '37'
        find('input[id="tbInicio3913"]').set '38'
        find('input[id="tbFim3913"]').set '43'
        drop = find("input[type=button][value='Salvar']", match: :first)
        drop.click
        msg = find('div[class="validation-summary-ok"]')
        expect(msg).to have_content 'O Formato de arquivo de importação de usuários foi adicionado com sucesso'
    end

    it 'excluindo formatos', :excluindo_todos_formatos do 
                #Estruturas
                puts 'Excluindo Estruturas'
                within('table tbody tr', text: 'Teste - Formato Estruturas') do
                    selecionar = find('td[class="coletaDescricao"]', text: 'Teste - Formato Estruturas')
                    selecionar.hover
                    find('span[class="spanButtonText"]', text: 'Remover').click
                end
                within('div div div', text: 'Remover') do
                find('span[class="PlusButton pointer"]').click
                end
                msg = find('div[class="validation-summary-ok"]')
                expect(msg).to have_content 'Formato de arquivo excluído com sucesso'
        

                #Cargos
                puts 'Excluindo Cargos'
                find('span[id="TabCargo"]').click
                within('table tbody tr', text: 'Teste - Formato Cargos') do
                    selecionar = find('td[class="coletaDescricao"]', text: 'Teste - Formato Cargos')
                    selecionar.hover
                    find('span[class="spanButtonText"]', text: 'Remover').click
                end
                within('div div div', text: 'Remover') do
                    find('span[class="PlusButton pointer"]').click
                end
                msg = find('div[class="validation-summary-ok"]')
                expect(msg).to have_content 'Formato de arquivo excluído com sucesso'
        
                #inclusão de pessoas
                puts 'Excluindo inclusão de pessoas'
                find('span[id="TabFuncionarios"]').click
                within('table tbody tr', text: 'Teste - Formato Pessoa - Inclusão - Alteração') do
                    selecionar = find('td[class="coletaDescricao"]', text: 'Teste - Formato Pessoa - Inclusão - Alteração')
                    selecionar.hover
                    find('span[class="spanButtonText"]', text: 'Remover').click
                end
                within('div div div', text: 'Remover') do
                    find('span[class="PlusButton pointer"]').click
                end
                msg = find('div[class="validation-summary-ok"]')
                expect(msg).to have_content 'Formato de arquivo excluído com sucesso'
         
                #Desligamento de pessoas
                puts 'Excluindo Desligamento de pessoas'
                find('span[id="TabFuncionarios"]').click
                find('span[id="TabDesligamento"]').click
                within('table tbody tr', text: 'Teste - Formato Pessoa - Desligamento') do
                    selecionar = find('td[class="coletaDescricao"]', text: 'Teste - Formato Pessoa - Desligamento')
                    selecionar.hover
                    find('span[class="spanButtonText"]', text: 'Remover').click
                end
                within('div div div', text: 'Remover') do
                    find('span[class="PlusButton pointer"]').click
                end
                msg = find('div[class="validation-summary-ok"]')
                expect(msg).to have_content 'Formato de arquivo excluído com sucesso'
        
                #Ferias pessoas
                puts 'Excluindo Ferias pessoas'
                find('span[id="TabFuncionarios"]').click
                find('span[id="TabFerias"]').click
                within('table tbody tr', text: 'Teste - Formato Pessoa - Ferias') do
                    selecionar = find('td[class="coletaDescricao"]', text: 'Teste - Formato Pessoa - Ferias')
                    selecionar.hover
                    find('span[class="spanButtonText"]', text: 'Remover').click
                end
                within('div div div', text: 'Remover') do
                    find('span[class="PlusButton pointer"]').click
                end
                msg = find('div[class="validation-summary-ok"]')
                expect(msg).to have_content 'Formato de arquivo excluído com sucesso'
         
                #Afastamento pessoas
                puts 'Excluindo Afastamento pessoas'
                find('span[id="TabFuncionarios"]').click
                find('span[id="TabAfastamento"]').click
                within('table tbody tr', text: 'Teste - Formato Pessoa - Afastamento') do
                    selecionar = find('td[class="coletaDescricao"]', text: 'Teste - Formato Pessoa - Afastamento')
                    selecionar.hover
                    find('span[class="spanButtonText"]', text: 'Remover').click
                end
                within('div div div', text: 'Remover') do
                    find('span[class="PlusButton pointer"]').click
                end
                msg = find('div[class="validation-summary-ok"]')
                expect(msg).to have_content 'Formato de arquivo excluído com sucesso'
        
                #Coleta de marcações 
                puts 'Excluindo Coleta de marcações'
                find('span[id="TabColetaApontamentos"]').click
                within('table tbody tr', text: 'Teste - Formato Coleta de Marcações') do
                    selecionar = find('td[class="coletaDescricao"]', text: 'Teste - Formato Coleta de Marcações')
                    selecionar.hover
                    find('span[class="spanButtonText"]', text: 'Remover').click
                end
                within('div div div', text: 'Remover') do
                    find('span[class="PlusButton pointer"]').click
                end
                msg = find('div[class="validation-summary-ok"]')
                expect(msg).to have_content 'Formato de arquivo excluído com sucesso'
        
                #Escala de Folga
                puts 'Excluindo Escala de Folga'
                find('span[id="TabColetaEscalas"]').click
                within('table tbody tr', text: 'Teste - Formato Escalas - Folgas') do
                    selecionar = find('td[class="coletaDescricao"]', text: 'Teste - Formato Escalas - Folgas')
                    selecionar.hover
                    find('span[class="spanButtonText"]', text: 'Remover').click
                end
                within('div div div', text: 'Remover') do
                    find('span[class="PlusButton pointer"]').click
                end
                msg = find('div[class="validation-summary-ok"]')
                expect(msg).to have_content 'Formato de arquivo excluído com sucesso'
        
                #Escala de Horario
                puts 'Excluindo Escala de Horario'
                find('span[id="TabColetaEscalas"]').click
                find('span[id="TabEscalasHorarios"]').click
                within('table tbody tr', text: 'Teste - Formato Escalas - Horarios') do
                    selecionar = find('td[class="coletaDescricao"]', text: 'Teste - Formato Escalas - Horarios')
                    selecionar.hover
                    find('span[class="spanButtonText"]', text: 'Remover').click
                end
                within('div div div', text: 'Remover') do
                    find('span[class="PlusButton pointer"]').click
                end
                msg = find('div[class="validation-summary-ok"]')
                expect(msg).to have_content 'Formato de arquivo excluído com sucesso'
        
                #Usuarios
                puts 'Excluindo Usuarios'
                find('span[id="TabUsuarios"]').click
                within('table tbody tr', text: 'Teste - Formato Usuario') do
                    selecionar = find('td[class="coletaDescricao"]', text: 'Teste - Formato Usuario')
                    selecionar.hover
                    find('span[class="spanButtonText"]', text: 'Remover').click
                end
                within('div div div', text: 'Remover') do
                    find('span[class="PlusButton pointer"]').click
                end
                msg = find('div[class="validation-summary-ok"]')
                expect(msg).to have_content 'Formato de arquivo excluído com sucesso'

    end
end
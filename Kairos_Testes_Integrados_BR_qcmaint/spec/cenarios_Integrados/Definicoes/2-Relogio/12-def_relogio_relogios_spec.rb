describe 'relógios', :relogios do
  before(:each) do
    visit '/'

    #Aceitando os cookies
    # find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
    # sleep 2 

    fill_in 'LogOnModel_UserName', with: $user_br
    fill_in 'LogOnModel_Password', with: $senha
    click_button 'Entrar'

    # Acessando o cadastro de Relógio pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 3
    find('div[class="pointer DropDownHeaderElement"]', text: 'Relógios').click
    find('div[id="MenuRelogios"]').click
    


  end

  it 'Cadastrando relogios', :Cadastros_relogios do
    #Cadastrando BioPoint II - Sensor 3
      puts 'Cadastrando BioPoint II - Sensor 3'
      find('label[class="pointer"]', text: 'Adicionar').click
      fill_in 'Relogio_Codigo', with: '101'
      fill_in 'Relogio_Descricao', with: 'Relogio - BioPoint II - Sensor 3'
      select('BioPoint II - Sensor 3', from: 'DdlModeloId').select_option
      select('Teste automático - BioPoint II - Sensor 3', from: 'DdlConfiguracaoId').select_option
      fill_in 'enderecoIP', with: '192.168.173.1'
      fill_in 'Relogio_VersaoFirmware', with: '03.00.00'
      select('UTC -3', from: 'Relogio_FusoHorarioId').select_option
      find('label[for="checkHabilitaHorarioVerao"]', visible: false).set(true)
      fill_in 'Relogio_InicioHorarioVerao', with: '06042021'
      fill_in 'Relogio_FimHorarioVerao', with: '10052021'

      drop = find("input[type=button][value='Salvar']", match: :first)
      drop.click
      expect(find('div[id=Summary-Field-Index]')).to have_content 'O Relógio foi adicionado com sucesso'

    #Cadastrando Micro Point Exportação
      puts 'Cadastrando Micro Point Exportação'
      find('label[class="pointer"]', text: 'Adicionar').click
      fill_in 'Relogio_Codigo', with: '102'
      fill_in 'Relogio_Descricao', with: 'Relogio - Micro Point Exportação'
      select('Micro Point Exportação', from: 'DdlModeloId').select_option
      select('Teste automático - Micro Point Exportação', from: 'DdlConfiguracaoId').select_option
      fill_in 'enderecoIP', with: '192.168.173.2'
      fill_in 'Relogio_VersaoFirmware', with: '03.00.00'
      select('UTC -3', from: 'Relogio_FusoHorarioId').select_option
      find('label[for="checkHabilitaHorarioVerao"]', visible: false).set(true)
      fill_in 'Relogio_InicioHorarioVerao', with: '06042021'
      fill_in 'Relogio_FimHorarioVerao', with: '10052021'

      drop = find("input[type=button][value='Salvar']", match: :first)
      drop.click
      expect(find('div[id=Summary-Field-Index]')).to have_content 'O Relógio foi adicionado com sucesso'

    #Cadastrando PrintPoint II
      puts 'Cadastrando PrintPoint II'
      find('label[class="pointer"]', text: 'Adicionar').click
      fill_in 'Relogio_Codigo', with: '103'
      fill_in 'Relogio_Descricao', with: 'Relogio - PrintPoint 2'
      select('PrintPoint II', from: 'DdlModeloId').select_option
      select('Teste automático - Printpoint 2', from: 'DdlConfiguracaoId').select_option
      fill_in 'enderecoIP', with: '192.168.173.3'
      fill_in 'Relogio_VersaoFirmware', with: '03.00.00'
      fill_in 'Relogio_NumeroFabricacao', with: '00300000000000001'
      select('UTC -3', from: 'Relogio_FusoHorarioId').select_option
      find('label[for="checkHabilitaHorarioVerao"]', visible: false).set(true)
      fill_in 'Relogio_InicioHorarioVerao', with: '06042021'
      fill_in 'Relogio_FimHorarioVerao', with: '10052021'
      
      drop = find("input[type=button][value='Salvar']", match: :first)
      drop.click
      expect(find('div[id=Summary-Field-Index]')).to have_content 'O Relógio foi adicionado com sucesso'

    #Cadastrando MiniPrint
      puts 'Cadastrando MiniPrint'
      find('label[class="pointer"]', text: 'Adicionar').click
      fill_in 'Relogio_Codigo', with: '104'
      fill_in 'Relogio_Descricao', with: 'Relogio - MiniPrint'
      select('MiniPrint', from: 'DdlModeloId').select_option
      select('Teste automático - Mini Print', from: 'DdlConfiguracaoId').select_option
      fill_in 'enderecoIP', with: '192.168.173.4'
      fill_in 'Relogio_VersaoFirmware', with: '03.00.00'
      fill_in 'Relogio_NumeroFabricacao', with: '00300000000000002'
      select('UTC -3', from: 'Relogio_FusoHorarioId').select_option
      find('label[for="checkHabilitaHorarioVerao"]', visible: false).set(true)
      fill_in 'Relogio_InicioHorarioVerao', with: '06042021'
      fill_in 'Relogio_FimHorarioVerao', with: '10052021'
      
      drop = find("input[type=button][value='Salvar']", match: :first)
      drop.click
      expect(find('div[id=Summary-Field-Index]')).to have_content 'O Relógio foi adicionado com sucesso'


    # #Cadastrando Face / FaceAccess II
      puts 'Cadastrando Face / FaceAccess II'
      find('label[class="pointer"]', text: 'Adicionar').click
      fill_in 'Relogio_Codigo', with: '105'
      fill_in 'Relogio_Descricao', with: 'Relogio - Face / FaceAccess II'
      select('Face / FaceAccess II', from: 'DdlModeloId').select_option
      select('Teste automático - Face / FaceAccess II', from: 'DdlConfiguracaoId').select_option
      fill_in 'enderecoIP', with: '192.168.173.5'
      fill_in 'Relogio_VersaoFirmware', with: '03.00.00'
      select('UTC -3', from: 'Relogio_FusoHorarioId').select_option
      find('label[for="checkHabilitaHorarioVerao"]', visible: false).set(true)
      fill_in 'Relogio_InicioHorarioVerao', with: '06042021'
      fill_in 'Relogio_FimHorarioVerao', with: '10052021'
      
      drop = find("input[type=button][value='Salvar']", match: :first)
      drop.click
      expect(find('div[id=Summary-Field-Index]')).to have_content 'O Relógio foi adicionado com sucesso'

    #Cadastrando Face Access S
      puts 'Cadastrando Face Access S'
      find('label[class="pointer"]', text: 'Adicionar').click
      fill_in 'Relogio_Codigo', with: '106'
      fill_in 'Relogio_Descricao', with: 'Relogio - Face Access S'
      select('Face Access S', from: 'DdlModeloId').select_option
      select('Teste automático - Face Access S', from: 'DdlConfiguracaoId').select_option
      fill_in 'enderecoIP', with: '192.168.173.6'
      fill_in 'Relogio_NumeroFabricacaoSemMinimo', with: '00300000000000004'
      select('UTC -3', from: 'Relogio_FusoHorarioId').select_option
      find('label[for="checkHabilitaHorarioVerao"]', visible: false).set(true)
      fill_in 'Relogio_InicioHorarioVerao', with: '06042021'
      fill_in 'Relogio_FimHorarioVerao', with: '10052021'
      
      drop = find("input[type=button][value='Salvar']", match: :first)
      drop.click
      expect(find('div[id=Summary-Field-Index]')).to have_content 'O Relógio foi adicionado com sucesso'


    #Cadastrando Biolite normal
      puts 'Cadastrando Biolite normal'
      find('label[class="pointer"]', text: 'Adicionar').click
      fill_in 'Relogio_Codigo', with: '107'
      fill_in 'Relogio_Descricao', with: 'Relogio - Biolite normal'
      select('Biolite', from: 'DdlModeloId').select_option
      select('Teste automático - Biolite Normal', from: 'DdlConfiguracaoId').select_option
      fill_in 'enderecoIP', with: '192.168.173.7'
      fill_in 'Relogio_VersaoFirmware', with: '03.00.00'
      select('UTC -3', from: 'Relogio_FusoHorarioId').select_option
      find('label[for="checkHabilitaHorarioVerao"]', visible: false).set(true)
      fill_in 'Relogio_InicioHorarioVerao', with: '06042021'
      fill_in 'Relogio_FimHorarioVerao', with: '10052021'
      
      drop = find("input[type=button][value='Salvar']", match: :first)
      drop.click
      expect(find('div[id=Summary-Field-Index]')).to have_content 'O Relógio foi adicionado com sucesso'

    #Cadastrando PrintPoint III
      puts 'Cadastrando PrintPoint III'
      find('label[class="pointer"]', text: 'Adicionar').click
      fill_in 'Relogio_Codigo', with: '108'
      fill_in 'Relogio_Descricao', with: 'Relogio - PrintPoint 3'
      select('PrintPoint III', from: 'DdlModeloId').select_option
      select('Teste automático - PrintPoint 3', from: 'DdlConfiguracaoId').select_option
      fill_in 'enderecoIP', with: '192.168.173.8'
      fill_in 'Relogio_VersaoFirmware', with: '03.00.00'
      fill_in 'Relogio_NumeroFabricacao', with: '00300000000000006'
      select('UTC -3', from: 'Relogio_FusoHorarioId').select_option
      find('label[for="checkHabilitaHorarioVerao"]', visible: false).set(true)
      fill_in 'Relogio_InicioHorarioVerao', with: '06042021'
      fill_in 'Relogio_FimHorarioVerao', with: '10052021'
      fill_in 'Relogio_ChaveRSA', with: 'D9E8BBE449F94F85D225DD404D0581182F52C297E2390F43A9913B29CD51B01DF9D1889ADBEA57528DD15A7BAF7FBAC893499CA9BF4C09A5D0DB9D409818C1CA7ED667D569EF4A44AF1DE5D5DB62F72B2F02FE64A8AEAB2B04005D55121BDDA96A1127142EFC15F173023DB9272F4E74B9E3B70DD45E067646048F91AD75C303'
      fill_in 'Relogio_ExponenteRSA', with: '010001'
      fill_in 'Relogio_CPF', with: @cpf
      find('label[for="checkLogMonitoracao"]').set(true)
      drop = find("input[type=button][value='Salvar']", match: :first)
      drop.click
      expect(find('div[id=Summary-Field-Index]')).to have_content 'O Relógio foi adicionado com sucesso'

    #Cadastrando FaceAccess
      puts 'Cadastrando FaceAccess'
      find('label[class="pointer"]', text: 'Adicionar').click
      fill_in 'Relogio_Codigo', with: '109'
      fill_in 'Relogio_Descricao', with: 'Relogio - FaceAccess'
      select('FaceAccess', from: 'DdlModeloId').select_option
      select('Teste automático - FaceAccess normal', from: 'DdlConfiguracaoId').select_option
      fill_in 'enderecoIP', with: '192.168.173.9'
      fill_in 'Relogio_VersaoFirmware', with: '03.00.00'
      drop = find("input[type=button][value='Salvar']", match: :first)
      drop.click
      expect(find('div[id=Summary-Field-Index]')).to have_content 'O Relógio foi adicionado com sucesso'

    #Cadastrando PrintPoint LI
      puts 'Cadastrando PrintPoint LI'
      find('label[class="pointer"]', text: 'Adicionar').click
      fill_in 'Relogio_Codigo', with: '110'
      fill_in 'Relogio_Descricao', with: 'Relogio - PrintPoint LI'
      select('PrintPoint LI', from: 'DdlModeloId').select_option
      select('Teste automático - Printpoint li', from: 'DdlConfiguracaoId').select_option
      fill_in 'enderecoIP', with: '192.168.173.10'
      fill_in 'Relogio_NumeroFabricacao', with: '00300000000000007'
      select('UTC -3', from: 'Relogio_FusoHorarioId').select_option
      find('label[for="checkHabilitaHorarioVerao"]', visible: false).set(true)
      fill_in 'Relogio_InicioHorarioVerao', with: '06042021'
      fill_in 'Relogio_FimHorarioVerao', with: '10052021'
      drop = find("input[type=button][value='Salvar']", match: :first)
      drop.click
      expect(find('div[id=Summary-Field-Index]')).to have_content 'O Relógio foi adicionado com sucesso'

    #Cadastrando Biolite NG
      puts 'Cadastrando Biolite NG'
      find('label[class="pointer"]', text: 'Adicionar').click
      fill_in 'Relogio_Codigo', with: '111'
      fill_in 'Relogio_Descricao', with: 'Relogio - Biolite NG'
      select('Biolite NG', from: 'DdlModeloId').select_option
      select('Teste automático - Biolite NG', from: 'DdlConfiguracaoId').select_option
      fill_in 'enderecoIP', with: '192.168.173.11'
      fill_in 'Relogio_VersaoFirmware', with: '03.00.00'
      fill_in 'Relogio_ChaveComunicacao', with: '12345678'
      drop = find("input[type=button][value='Salvar']", match: :first)
      drop.click
      expect(find('div[id=Summary-Field-Index]')).to have_content 'O Relógio foi adicionado com sucesso'

    #Cadastrando Smart
      puts 'Cadastrando Smart'
      find('label[class="pointer"]', text: 'Adicionar').click
      fill_in 'Relogio_Codigo', with: '112'
      fill_in 'Relogio_Descricao', with: 'Relogio - Smart'
      select('Smart', from: 'DdlModeloId').select_option
      select('Teste automático - Smart', from: 'DdlConfiguracaoId').select_option
      fill_in 'enderecoIP', with: '192.168.173.12'
      fill_in 'Relogio_VersaoFirmware', with: '03.00.00'
      fill_in 'Relogio_NumeroFabricacao', with: '00300000000001234'
      select('UTC -3', from: 'Relogio_FusoHorarioId').select_option
      find('label[for="checkHabilitaHorarioVerao"]', visible: false).set(true)
      fill_in 'Relogio_InicioHorarioVerao', with: '06042021'
      fill_in 'Relogio_FimHorarioVerao', with: '10052021'
      fill_in 'Relogio_ChaveRSA', with: 'D9E8BBE449F94F85D225DD404D0581182F52C297E2390F43A9913B29CD51B01DF9D1889ADBEA57528DD15A7BAF7FBAC893499CA9BF4C09A5D0DB9D409818C1CA7ED667D569EF4A44AF1DE5D5DB62F72B2F02FE64A8AEAB2B04005D55121BDDA96A1127142EFC15F173023DB9272F4E74B9E3B70DD45E067646048F91AD75C303'
      fill_in 'Relogio_ExponenteRSA', with: '010001'
      fill_in 'Relogio_CPF', with: @cpf
      find('label[for="checkLogMonitoracao"]').set(true)
      drop = find("input[type=button][value='Salvar']", match: :first)
      drop.click
      expect(find('div[id=Summary-Field-Index]')).to have_content 'O Relógio foi adicionado com sucesso'



    #Cadastrando Henry
      puts 'Cadastrando Henry'
      find('label[class="pointer"]', text: 'Adicionar').click
      fill_in 'Relogio_Codigo', with: '113'
      fill_in 'Relogio_Descricao', with: 'Relogio - Henry'
      select('Henry', from: 'DdlModeloId').select_option
      select('Teste automático - Henry', from: 'DdlConfiguracaoId').select_option
      fill_in 'enderecoIP', with: '192.168.173.13'
      fill_in 'Relogio_VersaoFirmware', with: '03.00.00'
      fill_in 'Relogio_NumeroFabricacao', with: '00300000000000008'
      select('UTC -3', from: 'Relogio_FusoHorarioId').select_option
      find('label[for="checkHabilitaHorarioVerao"]', visible: false).set(true)
      fill_in 'Relogio_InicioHorarioVerao', with: '06042021'
      fill_in 'Relogio_FimHorarioVerao', with: '10052021'
      select('Sinatra', from: 'SelectedTipoDigital')
      select('Hexa | Prisma Inmetro', from: 'SelectedModeloRelogioHenry')
      fill_in 'Relogio_NomeUsuario', with: 'usuario' 
      fill_in 'Relogio_SenhaUsuario', with: 'senha' 
      drop = find("input[type=button][value='Salvar']", match: :first)
      drop.click
      expect(find('div[id=Summary-Field-Index]')).to have_content 'O Relógio foi adicionado com sucesso'

    #Cadastrando Control ID
      puts 'Cadastrando Control ID'
      find('label[class="pointer"]', text: 'Adicionar').click
      fill_in 'Relogio_Codigo', with: '114'
      fill_in 'Relogio_Descricao', with: 'Relogio - Control ID'
      select('Control ID', from: 'DdlModeloId').select_option
      select('Teste automático - Control ID', from: 'DdlConfiguracaoId').select_option
      fill_in 'enderecoIP', with: '192.168.173.14'
      fill_in 'Relogio_VersaoFirmware', with: '03.00.00'
      fill_in 'Relogio_NumeroFabricacao', with: '00300000000000009'
      select('UTC -3', from: 'Relogio_FusoHorarioId').select_option
      find('label[for="checkHabilitaHorarioVerao"]', visible: false).set(true)
      fill_in 'Relogio_InicioHorarioVerao', with: '06042021'
      fill_in 'Relogio_FimHorarioVerao', with: '10052021'
      select('500 DPi', from: 'SelectedTipoDigital')
      fill_in 'Relogio_NomeUsuario', with: 'usuario' 
      fill_in 'Relogio_SenhaUsuario', with: 'senha' 
      drop = find("input[type=button][value='Salvar']", match: :first)
      drop.click
      expect(find('div[id=Summary-Field-Index]')).to have_content 'O Relógio foi adicionado com sucesso'

  end
  
  it 'Deletando relogios', :deletando_relogios do
    # Deletando BioPoint II - Sensor 3
      puts 'Deletando BioPoint II - Sensor 3'
      within('table tbody tr', text: 'Relogio - BioPoint II - Sensor 3') do
        selecionar = find('td[class="relogioDescricao"]', text: 'Relogio - BioPoint II - Sensor 3')
        selecionar.hover
        find('img[alt="Remover"]').click
      end
      within('div div div', text: 'Remover') do
      find('span[class="PlusButton pointer"]').click
      end
      msg = find('div[class="validation-summary-ok"]')
      expect(msg).to have_content 'O Relógio foi removido com sucesso'

    # Deletando Micro Point Exportação
      puts 'Deletando Micro Point Exportação'
      within('table tbody tr', text: 'Relogio - Micro Point Exportação') do
        selecionar = find('td[class="relogioDescricao"]', text: 'Relogio - Micro Point Exportação')
        selecionar.hover
        find('img[alt="Remover"]').click
      end
      within('div div div', text: 'Remover') do
      find('span[class="PlusButton pointer"]').click
      end
      msg = find('div[class="validation-summary-ok"]')
      expect(msg).to have_content 'O Relógio foi removido com sucesso'

    # Deletando PrintPoint II
      puts 'Deletando PrintPoint II'
      within('table tbody tr', text: 'Relogio - PrintPoint 2') do
        selecionar = find('td[class="relogioDescricao"]', text: 'Relogio - PrintPoint 2')
        selecionar.hover
        find('img[alt="Remover"]').click
      end
      within('div div div', text: 'Remover') do
      find('span[class="PlusButton pointer"]').click
      end
      msg = find('div[class="validation-summary-ok"]')
      expect(msg).to have_content 'O Relógio foi removido com sucesso'

    # Deletando MiniPrint
      puts 'Deletando MiniPrint'
      within('table tbody tr', text: 'Relogio - MiniPrint') do
        selecionar = find('td[class="relogioDescricao"]', text: 'Relogio - MiniPrint')
        selecionar.hover
        find('img[alt="Remover"]').click
      end
      within('div div div', text: 'Remover') do
      find('span[class="PlusButton pointer"]').click
      end
      msg = find('div[class="validation-summary-ok"]')
      expect(msg).to have_content 'O Relógio foi removido com sucesso'

    # Deletando Face / FaceAccess II
      puts 'Deletando Face FaceAccess II'
      within('table tbody tr', text: 'Relogio - Face FaceAccess II') do
        selecionar = find('td[class="relogioDescricao"]', text: 'Relogio - Face FaceAccess II')
        selecionar.hover
        find('img[alt="Remover"]').click
      end
      within('div div div', text: 'Remover') do
      find('span[class="PlusButton pointer"]').click
      end
      msg = find('div[class="validation-summary-ok"]')
      expect(msg).to have_content 'O Relógio foi removido com sucesso'
      
    # Deletando Face Access S
      puts 'Deletando Face Access S'
      within('table tbody tr', text: 'Relogio - Face Access S') do
        selecionar = find('td[class="relogioDescricao"]', text: 'Relogio - Face Access S')
        selecionar.hover
        find('img[alt="Remover"]').click
      end
      within('div div div', text: 'Remover') do
      find('span[class="PlusButton pointer"]').click
      end
      msg = find('div[class="validation-summary-ok"]')
      expect(msg).to have_content 'O Relógio foi removido com sucesso'

    # Deletando Biolite normal
      puts 'Deletando Micro Point Exportação'
      within('table tbody tr', text: 'Relogio - Biolite normal') do
        selecionar = find('td[class="relogioDescricao"]', text: 'Relogio - Biolite normal')
        selecionar.hover
        find('img[alt="Remover"]').click
      end
      within('div div div', text: 'Remover') do
      find('span[class="PlusButton pointer"]').click
      end
      msg = find('div[class="validation-summary-ok"]')
      expect(msg).to have_content 'O Relógio foi removido com sucesso'

    # Deletando PrintPoint III
      puts 'Deletando PrintPoint III'
      within('table tbody tr', text: 'Relogio - PrintPoint 3') do
        selecionar = find('td[class="relogioDescricao"]', text: 'Relogio - PrintPoint 3')
        selecionar.hover
        find('img[alt="Remover"]').click
      end
      within('div div div', text: 'Remover') do
      find('span[class="PlusButton pointer"]').click
      end
      msg = find('div[class="validation-summary-ok"]')
      expect(msg).to have_content 'O Relógio foi removido com sucesso'

    # Deletando FaceAccess
      puts 'Deletando FaceAccess'
      within('table tbody tr', text: 'Relogio - FaceAccess') do
        selecionar = find('td[class="relogioDescricao"]', text: 'Relogio - FaceAccess')
        selecionar.hover
        find('img[alt="Remover"]').click
      end
      within('div div div', text: 'Remover') do
      find('span[class="PlusButton pointer"]').click
      end
      msg = find('div[class="validation-summary-ok"]')
      expect(msg).to have_content 'O Relógio foi removido com sucesso'

    # Deletando PrintPoint LI
      puts 'Deletando PrintPoint LI'
      within('table tbody tr', text: 'Relogio - PrintPoint LI') do
        selecionar = find('td[class="relogioDescricao"]', text: 'Relogio - PrintPoint LI')
        selecionar.hover
        find('img[alt="Remover"]').click
      end
      within('div div div', text: 'Remover') do
      find('span[class="PlusButton pointer"]').click
      end
      msg = find('div[class="validation-summary-ok"]')
      expect(msg).to have_content 'O Relógio foi removido com sucesso'

    # Deletando Biolite NG
      puts 'Deletando Biolite NG'
      within('table tbody tr', text: 'Relogio - Biolite NG') do
        selecionar = find('td[class="relogioDescricao"]', text: 'Relogio - Biolite NG')
        selecionar.hover
        find('img[alt="Remover"]').click
      end
      within('div div div', text: 'Remover') do
      find('span[class="PlusButton pointer"]').click
      end
      msg = find('div[class="validation-summary-ok"]')
      expect(msg).to have_content 'O Relógio foi removido com sucesso'

    # Deletando Smart
      puts 'Deletando Smart'
      within('table tbody tr', text: 'Relogio - Smart') do
        selecionar = find('td[class="relogioDescricao"]', text: 'Relogio - Smart')
        selecionar.hover
        find('img[alt="Remover"]').click
      end
      within('div div div', text: 'Remover') do
      find('span[class="PlusButton pointer"]').click
      end
      msg = find('div[class="validation-summary-ok"]')
      expect(msg).to have_content 'O Relógio foi removido com sucesso'


    # Deletando Henry
      puts 'Deletando Henry'
      within('table tbody tr', text: 'Relogio - Henry') do
        selecionar = find('td[class="relogioDescricao"]', text: 'Relogio - Henry')
        selecionar.hover
        find('img[alt="Remover"]').click
      end
      within('div div div', text: 'Remover') do
      find('span[class="PlusButton pointer"]').click
      end
      msg = find('div[class="validation-summary-ok"]')
      expect(msg).to have_content 'O Relógio foi removido com sucesso'

    # Deletando Control ID
      puts 'Deletando Control ID'
      within('table tbody tr', text: 'Relogio - Control ID') do
        selecionar = find('td[class="relogioDescricao"]', text: 'Relogio - Control ID')
        selecionar.hover
        find('img[alt="Remover"]').click
      end
      within('div div div', text: 'Remover') do
      find('span[class="PlusButton pointer"]').click
      end
      msg = find('div[class="validation-summary-ok"]')
      expect(msg).to have_content 'O Relógio foi removido com sucesso'

  end
end

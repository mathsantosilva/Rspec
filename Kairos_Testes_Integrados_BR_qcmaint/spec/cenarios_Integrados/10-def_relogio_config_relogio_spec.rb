describe 'configuração', :config_relogio do
  before(:each) do
    visit '/'
    #Aceitando os cookies
    find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
    sleep 2 

    fill_in 'LogOnModel_UserName', with: @login
    fill_in 'LogOnModel_Password', with: @senha
    click_button 'Entrar'

    # Acessando o cadastro de Configuração de relógio pela navegação de telas
    selecionar = find('div[id="toggleUserDefinitions"]')
    selecionar.hover
    sleep 3
    find('div[class="pointer DropDownHeaderElement"]', text: 'Relógios').click
   
 
  end

  it 'Inserindo as configurações dos relogios', :cadastros_config_relogios do
    
    #BioPoint II - Sensor 3
    puts 'Cadastrando BioPoint II - Sensor 3'
    find('label[class="pointer"]', text: 'Adicionar').click
    find('label[for="radioModelo1"]').click
    find('input[id="Codigo"]').set '10'
    find('input[id="Descricao"]').set 'Teste automatico - BioPoint II - Sensor 3'
    find('label[for="GSM"]').click
    find('input[id="ipServidorGSM"]').set '192.168.173.100'
    find('input[id="portaServidorGSM"]').set '8019'
    find('label[for="radioTipoAcionamento703"]').click
    select('50', from: 'TaxaAmostragem')
    find('input[id="TempoAcionamento"]').set '5,5'
    sleep 5
    find('label[for="TerminalAtivado"]').click
    sleep 5
    find('label[for="PrimeiroLeitor"]').click
    sleep 5
    find('label[for="SegundoLeitor"]').click
    sleep 5
    drop = find('input[type="submit"][value="Salvar"]', match: :first)
    drop.click
    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Configuração Relógio foi criada com sucesso'

    #Micro Point Exportação
    puts 'Cadastrando Micro Point Exportação'
    find('label[class="pointer"]', text: 'Adicionar').click
    find('label[for="radioModelo2"]').click
    find('input[id="Codigo"]').set '11'
    find('input[id="Descricao"]').set 'Teste automatico - Micro Point Exportação'
    find('label[for="GSM"]').click
    find('input[id="ipServidorGSM"]').set '192.168.173.100'
    find('input[id="portaServidorGSM"]').set '8019'
    find('label[for="radioTipoAcionamento703"]').click
    select('50', from: 'TaxaAmostragem')
    find('input[id="TempoAcionamento"]').set '5,5'
    find('label[for="TerminalAtivado"]').click
    drop = find('input[type="submit"][value="Salvar"]', match: :first)
    drop.click
    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Configuração Relógio foi criada com sucesso'

    #Micro PrintPoint II
    puts 'Cadastrando PrintPoint II'
    find('label[class="pointer"]', text: 'Adicionar').click
    find('label[for="radioModelo9"]').click
    find('input[id="Codigo"]').set '12'
    find('input[id="Descricao"]').set 'Teste automatico - Micro Point Exportação'
    find('label[for="GSM"]').click
    find('input[id="ipServidorGSM"]').set '192.168.173.100'
    find('input[id="portaServidorGSM"]').set '8019'
    find('span[id="TabGeral"]').click
    find('label[for="checkLeituraViaTeclado"]').click
    find('label[for="radioTecladoAutenticacaoBiometriaOuSenha"]').click
    find('label[for="checkLeituraViaCartao"]').click
    find('label[for="radioCartaoPis"]').click
    find('label[for="radioCartaoAutenticacaoBiometriaOuSenha"]').click
    find('label[for="radioPersonalizacaoEspecial1"]').click
    find('input[id="ConfiguracaoREP.NumeroDigitosPersonalizacao"]').set '12'
    find('input[id="ConfiguracaoREP.CodigoPersonalizacao"]').set '1234'
    find('label[for="checkHabilita1ParaN"]').click
    find('label[for="radioIdentificacaoApenasSenha"]').click
    find('label[for="radioAutenticacaoParcial"]').click
    select('9', from: 'ConfiguracaoREP_BiometriaNivelSegurancaSagem')
    find('span[id="TabTipoLeitura"]').click
    find('div[id="DivMenuV2de5dimep"]').click
    find('[for="checkHabilitaV2de5dimep"]').click
    find('input[id="textboxDigitsV2de5dimepInformacao"]').set '10'
    find('input[id="textboxDigitsV2de5dimepIgnorar"]').set '15'
    find('input[id="textboxDigitsV2de5dimepChecagem"]').set '20'
    find('input[id="textboxDigitsV2de5dimepInformacaoOpcional"]').set '25'
    find('input[id="textboxDigitsV2de5dimepNumeroDaVia"]').set '30'
    #incompleto

    drop = find('input[type="submit"][value="Salvar"]', match: :first)
    drop.click
    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Configuração Relógio foi criada com sucesso'


    
  end
end

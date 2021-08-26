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
    #Configuração de relógio
    ##'BioPoint II - Sensor 3' , 
    puts 'Cadastrando BioPoint II - Sensor 3'
    find('label[class="pointer"]', text: 'Adicionar').click
    find('label[for="radioModelo1"]').click
    find('input[id="Codigo"]').set '101'
    find('input[id="Descricao"]').set 'Teste automático - BioPoint II - Sensor 3'
    find('label[for="GSM"]').click
    find('input[id="ipServidorGSM"]').set '192.168.173.100'
    find('input[id="portaServidorGSM"]').set '8019'
    find('label[for="radioTipoAcionamento703"]').click
    select('50', from: 'TaxaAmostragem')
    find('input[id="TempoAcionamento"]').set '5,5'
    find('label[for="TerminalAtivado"]').click
    #falta Configuração de Função
    find('label[for="PrimeiroLeitor"]').click
    find('label[for="SegundoLeitor"]').click
    drop = find('input[type="submit"][value="Salvar"]', match: :first)
    drop.click
    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Configuração Relógio foi criada com sucesso'
  
    ##Configuração de relógio
    #Micro Point Exportação
    puts 'Cadastrando Micro Point Exportação'
    find('label[class="pointer"]', text: 'Adicionar').click
    find('label[for="radioModelo2"]').click
    find('input[id="Codigo"]').set '102'
    find('input[id="Descricao"]').set 'Teste automático - Micro Point Exportação'
    find('label[for="GSM"]').click
    find('input[id="ipServidorGSM"]').set '192.168.173.100'
    find('input[id="portaServidorGSM"]').set '8019'
    find('label[for="radioTipoAcionamento703"]').click
    select('50', from: 'TaxaAmostragem')
    find('input[id="TempoAcionamento"]').set '5,5'
    find('label[for="TerminalAtivado"]').click
    #falta Configuração de Função
    drop = find('input[type="submit"][value="Salvar"]', match: :first)
    drop.click
    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Configuração Relógio foi criada com sucesso'

    ##Configuração de relógio
    #PrintPoint II
    puts 'Cadastrando PrintPoint II'
    find('label[class="pointer"]', text: 'Adicionar').click
    find('label[for="radioModelo9"]').click
    find('input[id="Codigo"]').set '103'
    find('input[id="Descricao"]').set 'Teste automático - Printpoint 2'
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

    #v 2 de 5 Dimep
    find('div[id="DivMenuV2de5dimep"]').click
    find('[for="checkHabilitaV2de5dimep"]').click
    find('input[id="textboxDigitsV2de5dimepInformacao"]').set '1'
    find('input[id="textboxDigitsV2de5dimepIgnorar"]').set '2'
    find('input[id="textboxDigitsV2de5dimepChecagem"]').set '3'
    find('input[id="textboxDigitsV2de5dimepInformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsV2de5dimepNumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click

    #v 2 de 5 intercalado
    find('div[id="DivMenuV2de5intercalado"]').click
    find('[for="checkHabilitaV2de5intercalado"]').click
    find('input[id="textboxDigitsV2de5intercaladoInformacao"]').set '1'
    find('input[id="textboxDigitsV2de5intercaladoIgnorar"]').set '2'
    find('input[id="textboxDigitsV2de5intercaladoChecagem"]').set '3'
    find('input[id="textboxDigitsV2de5intercaladoInformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsV2de5intercaladoNumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click

    #Criptografia
    find('div[id="DivMenuCriptografia"]').click
    find('[for="radio8Digitos"]').click
    find('input[id="ConfiguracaoREP.Vetor1"]').set '1'
    find('input[id="ConfiguracaoREP.Verificador1"]').set '2'
    find('input[id="ConfiguracaoREP.Vetor2"]').set '3'
    find('input[id="ConfiguracaoREP.Verificador2"]').set '4'
  
    #v 3 de 9
    find('div[id="DivMenuV3de9"]').click
    find('[for="checkHabilitaV3de9"]').click
    find('input[id="textboxDigitsV3de9Informacao"]').set '1'
    find('input[id="textboxDigitsV3de9Ignorar"]').set '2'
    find('input[id="textboxDigitsV3de9Checagem"]').set '3'
    find('input[id="textboxDigitsV3de9InformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsV3de9NumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click

    #Magnético Dimep
    find('div[id="DivMenuMagneticoDimep"]').click
    find('[for="checkHabilitaMagnetico"]').click
    find('input[id="textboxDigitsMagneticoInformacao"]').set '1'
    find('input[id="textboxDigitsMagneticoIgnorar"]').set '2'
    find('input[id="textboxDigitsMagneticoChecagem"]').set '3'
    find('input[id="textboxDigitsMagneticoInformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsMagneticoNumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click
    find('[for="checkFormatoMagneticoEspecial1"]').click

    #ABA
    find('div[id="DivMenuAba"]').click
    find('[for="checkHabilitaABA"]').click
    find('input[id="textboxDigitsABAInformacao"]').set '1'
    find('input[id="textboxDigitsABAIgnorar"]').set '2'
    find('input[id="textboxDigitsABAChecagem"]').set '3'
    find('input[id="textboxDigitsABAInformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsABANumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click
    find('[for="checkFormatoABAEspecial1"]').click

    #Wiegand
    find('div[id="DivMenuWiegand"]').click
    find('[for="checkHabilitaWiegand"]').click
    find('input[id="textboxDigitsWiegandInformacao"]').set '1'
    find('input[id="textboxDigitsWiegandIgnorar"]').set '2'
    find('input[id="textboxDigitsWiegandChecagem"]').set '3'
    find('input[id="textboxDigitsWiegandInformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsWiegandNumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click
    
    #Wiegand 32
    find('div[id="DivMenuWiegand32"]').click
    find('[for="checkHabilitaWiegand32"]').click
    
    #Wiegand 34
    find('div[id="DivMenuWiegand34"]').click
    find('[for="checkHabilitaWiegand34"]').click
    find('input[id="textboxDigitsWiegand34Informacao"]').set '1'
    find('input[id="textboxDigitsWiegand34Ignorar"]').set '2'
    find('input[id="textboxDigitsWiegand34Checagem"]').set '3'
    find('input[id="textboxDigitsWiegand34InformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsWiegand34NumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click

    #Wiegand 35
    find('div[id="DivMenuWiegand35"]').click
    find('[for="checkHabilitaWiegand35"]').click
    find('input[id="textboxDigitsWiegand35Informacao"]').set '1'
    find('input[id="textboxDigitsWiegand35Ignorar"]').set '2'
    find('input[id="textboxDigitsWiegand35Checagem"]').set '3'
    find('input[id="textboxDigitsWiegand35InformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsWiegand35NumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click

    #Wiegand 37
    find('div[id="DivMenuWiegand37"]').click
    find('[for="checkHabilitaWiegand37"]').click
    find('input[id="textboxDigitsWiegand37Informacao"]').set '1'
    find('input[id="textboxDigitsWiegand37Ignorar"]').set '2'
    find('input[id="textboxDigitsWiegand37Checagem"]').set '3'
    find('input[id="textboxDigitsWiegand37InformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsWiegand37NumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    find('input[value="Limpar"]').click
    #find('[for="radioLeMatricula"]').click

    #Smart Card
    find('div[id="DivMenuSmartCard"]').click
    find('[for="checkHabilitaSmartCard"]').click
    find('input[id="textboxDigitsSmartCardInformacao"]').set '1'
    find('input[id="textboxDigitsSmartCardIgnorar"]').set '2'
    find('input[id="textboxDigitsSmartCardChecagem"]').set '3'
    find('input[id="textboxDigitsSmartCardInformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsSmartCardNumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click

    #Impressora
    find('span[id="TabImpressora"]').click
    find('[for="radioMedio"]').click
    find('[for="radioTotal"]').click

    #Dados empregador
    find('span[id="TabDadosEmpregador"]').click
    find('input[id="DadosEmpregador_CampoLinha1"]').set 'Teste automacao Razao relogio'
    find('input[id="DadosEmpregador_CampoLinha1Endereco"]').set 'Teste automacao endereco relogio'

    drop = find('input[type="submit"][value="Salvar"]', match: :first)
    drop.click
    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Configuração Relógio foi criada com sucesso'


    ##Configuração de relógio
    #Mini Print
    puts 'Cadastrando Mini Print'
    find('label[class="pointer"]', text: 'Adicionar').click
    find('label[for="radioModelo11"]').click
    find('input[id="Codigo"]').set '104'
    find('input[id="Descricao"]').set 'Teste automático - Mini Print'
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

    #v 2 de 5 Dimep
    find('div[id="DivMenuV2de5dimep"]').click
    find('[for="checkHabilitaV2de5dimep"]').click
    find('input[id="textboxDigitsV2de5dimepInformacao"]').set '1'
    find('input[id="textboxDigitsV2de5dimepIgnorar"]').set '2'
    find('input[id="textboxDigitsV2de5dimepChecagem"]').set '3'
    find('input[id="textboxDigitsV2de5dimepInformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsV2de5dimepNumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click

    #v 2 de 5 intercalado
    find('div[id="DivMenuV2de5intercalado"]').click
    find('[for="checkHabilitaV2de5intercalado"]').click
    find('input[id="textboxDigitsV2de5intercaladoInformacao"]').set '1'
    find('input[id="textboxDigitsV2de5intercaladoIgnorar"]').set '2'
    find('input[id="textboxDigitsV2de5intercaladoChecagem"]').set '3'
    find('input[id="textboxDigitsV2de5intercaladoInformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsV2de5intercaladoNumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click

    #Criptografia
    find('div[id="DivMenuCriptografia"]').click
    find('[for="radio8Digitos"]').click
    find('input[id="ConfiguracaoREP.Vetor1"]').set '1'
    find('input[id="ConfiguracaoREP.Verificador1"]').set '2'
    find('input[id="ConfiguracaoREP.Vetor2"]').set '3'
    find('input[id="ConfiguracaoREP.Verificador2"]').set '4'
  
    #v 3 de 9
    find('div[id="DivMenuV3de9"]').click
    find('[for="checkHabilitaV3de9"]').click
    find('input[id="textboxDigitsV3de9Informacao"]').set '1'
    find('input[id="textboxDigitsV3de9Ignorar"]').set '2'
    find('input[id="textboxDigitsV3de9Checagem"]').set '3'
    find('input[id="textboxDigitsV3de9InformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsV3de9NumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click

    #Magnético Dimep
    find('div[id="DivMenuMagneticoDimep"]').click
    find('[for="checkHabilitaMagnetico"]').click
    find('input[id="textboxDigitsMagneticoInformacao"]').set '1'
    find('input[id="textboxDigitsMagneticoIgnorar"]').set '2'
    find('input[id="textboxDigitsMagneticoChecagem"]').set '3'
    find('input[id="textboxDigitsMagneticoInformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsMagneticoNumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click
    find('[for="checkFormatoMagneticoEspecial1"]').click

    #ABA
    find('div[id="DivMenuAba"]').click
    find('[for="checkHabilitaABA"]').click
    find('input[id="textboxDigitsABAInformacao"]').set '1'
    find('input[id="textboxDigitsABAIgnorar"]').set '2'
    find('input[id="textboxDigitsABAChecagem"]').set '3'
    find('input[id="textboxDigitsABAInformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsABANumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click
    find('[for="checkFormatoABAEspecial1"]').click

    #Wiegand
    find('div[id="DivMenuWiegand"]').click
    find('[for="checkHabilitaWiegand"]').click
    find('input[id="textboxDigitsWiegandInformacao"]').set '1'
    find('input[id="textboxDigitsWiegandIgnorar"]').set '2'
    find('input[id="textboxDigitsWiegandChecagem"]').set '3'
    find('input[id="textboxDigitsWiegandInformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsWiegandNumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click
    
    #Wiegand 32
    find('div[id="DivMenuWiegand32"]').click
    find('[for="checkHabilitaWiegand32"]').click
    
    #Wiegand 34
    find('div[id="DivMenuWiegand34"]').click
    find('[for="checkHabilitaWiegand34"]').click
    find('input[id="textboxDigitsWiegand34Informacao"]').set '1'
    find('input[id="textboxDigitsWiegand34Ignorar"]').set '2'
    find('input[id="textboxDigitsWiegand34Checagem"]').set '3'
    find('input[id="textboxDigitsWiegand34InformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsWiegand34NumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click

    #Wiegand 35
    find('div[id="DivMenuWiegand35"]').click
    find('[for="checkHabilitaWiegand35"]').click
    find('input[id="textboxDigitsWiegand35Informacao"]').set '1'
    find('input[id="textboxDigitsWiegand35Ignorar"]').set '2'
    find('input[id="textboxDigitsWiegand35Checagem"]').set '3'
    find('input[id="textboxDigitsWiegand35InformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsWiegand35NumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click

    #Wiegand 37
    find('div[id="DivMenuWiegand37"]').click
    find('[for="checkHabilitaWiegand37"]').click
    find('input[id="textboxDigitsWiegand37Informacao"]').set '1'
    find('input[id="textboxDigitsWiegand37Ignorar"]').set '2'
    find('input[id="textboxDigitsWiegand37Checagem"]').set '3'
    find('input[id="textboxDigitsWiegand37InformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsWiegand37NumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    find('input[value="Limpar"]').click
    #find('[for="radioLeMatricula"]').click

    #Smart Card
    find('div[id="DivMenuSmartCard"]').click
    find('[for="checkHabilitaSmartCard"]').click
    find('input[id="textboxDigitsSmartCardInformacao"]').set '1'
    find('input[id="textboxDigitsSmartCardIgnorar"]').set '2'
    find('input[id="textboxDigitsSmartCardChecagem"]').set '3'
    find('input[id="textboxDigitsSmartCardInformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsSmartCardNumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click

    #Impressora
    find('span[id="TabImpressora"]').click
    find('[for="radioMedio"]').click
    find('[for="radioElevado"]').click

    #Dados empregador
    find('span[id="TabDadosEmpregador"]').click
    find('input[id="DadosEmpregador_CampoLinha1"]').set 'Teste automacao Razao relogio'
    find('input[id="DadosEmpregador_CampoLinha1Endereco"]').set 'Teste automacao endereco relogio'


    drop = find('input[type="submit"][value="Salvar"]', match: :first)
    drop.click
    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Configuração Relógio foi criada com sucesso'

    ##Configuração de relógio
    #Face / FaceAccess II
    puts 'Cadastrando Face / FaceAccess II'
    find('label[class="pointer"]', text: 'Adicionar').click
    find('label[for="radioModelo13"]').click
    find('input[id="Codigo"]').set '105'
    find('input[id="Descricao"]').set 'Teste automático - Face / FaceAccess II'
    find('label[for="radioConfiguracao1ParaN"]').click

    drop = find('input[type="submit"][value="Salvar"]', match: :first)
    drop.click
    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Configuração Relógio foi criada com sucesso'


    ##Configuração de relógio   
    #Face Access S
    puts 'Cadastrando Face Access S'
    find('label[class="pointer"]', text: 'Adicionar').click
    find('label[for="radioModelo27"]').click
    find('input[id="Codigo"]').set '106'
    find('input[id="Descricao"]').set 'Teste automático - Face Access S'
    find('input[id="enderecoIP"]').set '192.168.173.100'
    find('input[id="PortaServidor"]').set '8019'
    find('label[for="radioConfiguracao1ParaN"]').click

    drop = find('input[type="submit"][value="Salvar"]', match: :first)
    drop.click
    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Configuração Relógio foi criada com sucesso'


    ##Configuração de relógio
    #Biolite
    puts 'Cadastrando Biolite'
    find('label[class="pointer"]', text: 'Adicionar').click
    find('label[for="radioModelo14"]').click
    find('input[id="Codigo"]').set '107'
    find('input[id="Descricao"]').set 'Teste automático - Biolite'
    select('BW', from: 'BioliteType')
    find('label[for="BioliteTemplateVersion9"]').click

    drop = find('input[type="submit"][value="Salvar"]', match: :first)
    drop.click
    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Configuração Relógio foi criada com sucesso'

    ##Configuração de relógio
    #PrintPoint III
    puts 'Cadastrando PrintPoint III'
    find('label[class="pointer"]', text: 'Adicionar').click
    find('label[for="radioModelo15"]').click
    find('input[id="Codigo"]').set '108'
    find('input[id="Descricao"]').set 'Teste automático - PrintPoint III'
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

    #v 2 de 5 Dimep
    find('div[id="DivMenuV2de5dimep"]').click
    find('[for="checkHabilitaV2de5dimep"]').click
    find('input[id="textboxDigitsV2de5dimepInformacao"]').set '1'
    find('input[id="textboxDigitsV2de5dimepIgnorar"]').set '2'
    find('input[id="textboxDigitsV2de5dimepChecagem"]').set '3'
    find('input[id="textboxDigitsV2de5dimepInformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsV2de5dimepNumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click

    #v 2 de 5 intercalado
    find('div[id="DivMenuV2de5intercalado"]').click
    find('[for="checkHabilitaV2de5intercalado"]').click
    find('input[id="textboxDigitsV2de5intercaladoInformacao"]').set '1'
    find('input[id="textboxDigitsV2de5intercaladoIgnorar"]').set '2'
    find('input[id="textboxDigitsV2de5intercaladoChecagem"]').set '3'
    find('input[id="textboxDigitsV2de5intercaladoInformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsV2de5intercaladoNumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click

    #Criptografia
    find('div[id="DivMenuCriptografia"]').click
    find('[for="radio8Digitos"]').click
    find('input[id="ConfiguracaoREP.Vetor1"]').set '1'
    find('input[id="ConfiguracaoREP.Verificador1"]').set '2'
    find('input[id="ConfiguracaoREP.Vetor2"]').set '3'
    find('input[id="ConfiguracaoREP.Verificador2"]').set '4'
  
    #v 3 de 9
    find('div[id="DivMenuV3de9"]').click
    find('[for="checkHabilitaV3de9"]').click
    find('input[id="textboxDigitsV3de9Informacao"]').set '1'
    find('input[id="textboxDigitsV3de9Ignorar"]').set '2'
    find('input[id="textboxDigitsV3de9Checagem"]').set '3'
    find('input[id="textboxDigitsV3de9InformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsV3de9NumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click

    #Magnético Dimep
    find('div[id="DivMenuMagneticoDimep"]').click
    find('[for="checkHabilitaMagnetico"]').click
    find('input[id="textboxDigitsMagneticoInformacao"]').set '1'
    find('input[id="textboxDigitsMagneticoIgnorar"]').set '2'
    find('input[id="textboxDigitsMagneticoChecagem"]').set '3'
    find('input[id="textboxDigitsMagneticoInformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsMagneticoNumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click
    find('[for="checkFormatoMagneticoEspecial1"]').click

    #ABA
    find('div[id="DivMenuAba"]').click
    find('[for="checkHabilitaABA"]').click
    find('input[id="textboxDigitsABAInformacao"]').set '1'
    find('input[id="textboxDigitsABAIgnorar"]').set '2'
    find('input[id="textboxDigitsABAChecagem"]').set '3'
    find('input[id="textboxDigitsABAInformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsABANumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click
    find('[for="checkFormatoABAEspecial1"]').click

    #Wiegand
    find('div[id="DivMenuWiegand"]').click
    find('[for="checkHabilitaWiegand"]').click
    find('input[id="textboxDigitsWiegandInformacao"]').set '1'
    find('input[id="textboxDigitsWiegandIgnorar"]').set '2'
    find('input[id="textboxDigitsWiegandChecagem"]').set '3'
    find('input[id="textboxDigitsWiegandInformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsWiegandNumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click
    
    #Wiegand 32
    find('div[id="DivMenuWiegand32"]').click
    find('[for="checkHabilitaWiegand32"]').click
    
    #Wiegand 34
    find('div[id="DivMenuWiegand34"]').click
    find('[for="checkHabilitaWiegand34"]').click
    find('input[id="textboxDigitsWiegand34Informacao"]').set '1'
    find('input[id="textboxDigitsWiegand34Ignorar"]').set '2'
    find('input[id="textboxDigitsWiegand34Checagem"]').set '3'
    find('input[id="textboxDigitsWiegand34InformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsWiegand34NumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click

    #Wiegand 35
    find('div[id="DivMenuWiegand35"]').click
    find('[for="checkHabilitaWiegand35"]').click
    find('input[id="textboxDigitsWiegand35Informacao"]').set '1'
    find('input[id="textboxDigitsWiegand35Ignorar"]').set '2'
    find('input[id="textboxDigitsWiegand35Checagem"]').set '3'
    find('input[id="textboxDigitsWiegand35InformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsWiegand35NumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click

    #Wiegand 37
    find('div[id="DivMenuWiegand37"]').click
    find('[for="checkHabilitaWiegand37"]').click
    find('input[id="textboxDigitsWiegand37Informacao"]').set '1'
    find('input[id="textboxDigitsWiegand37Ignorar"]').set '2'
    find('input[id="textboxDigitsWiegand37Checagem"]').set '3'
    find('input[id="textboxDigitsWiegand37InformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsWiegand37NumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    find('input[value="Limpar"]').click
    #find('[for="radioLeMatricula"]').click

    #Smart Card
    find('div[id="DivMenuSmartCard"]').click
    find('[for="checkHabilitaSmartCard"]').click
    find('input[id="textboxDigitsSmartCardInformacao"]').set '1'
    find('input[id="textboxDigitsSmartCardIgnorar"]').set '2'
    find('input[id="textboxDigitsSmartCardChecagem"]').set '3'
    find('input[id="textboxDigitsSmartCardInformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsSmartCardNumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click

    #Impressora
    find('span[id="TabImpressora"]').click
    find('[for="radioMedio"]').click
    find('[for="radioTotal"]').click
    find('input[id="ConfiguracaoREP_TamanhoBobina"]').set '100'

    #Dados empregador
    find('span[id="TabDadosEmpregador"]').click
    find('input[id="DadosEmpregador_CampoLinha1"]').set 'Teste automacao Razao relogio'
    find('input[id="DadosEmpregador_CampoLinha1Endereco"]').set 'Teste automacao endereco relogio'

    #Conexão do usuario
    find('span[id="TabConexaoCliente"]').click
    find('[for="checkHabilitaConexaoUsuario"]').click
    select('Client (HTTP REST)', from: 'TipoConexao')
    find('input[id="TempoConexao"]').set '69'
    find('input[id="TempoDesconexao"]').set '69'
    find('input[id="IdentificacaoEquipamento"]').set '69'
    find('[for="checkHabilitaDNS"]').click
    find('input[id="ServidorDNS"]').set '1.1.1.1'
    find('input[id="ServidorDNSSecundario"]').set '2.2.2.2'
    find('input[id="EnderecoDNS"]').set 'equipamentos@teste.com'
    find('input[id="Port"]').set '6969'


    drop = find('input[type="submit"][value="Salvar"]', match: :first)
    drop.click
    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Configuração Relógio foi criada com sucesso'


    ##Configuração de relógio
    #FaceAccess
    puts 'Cadastrando FaceAccess'
    find('label[class="pointer"]', text: 'Adicionar').click
    find('label[for="radioModelo17"]').click
    find('input[id="Codigo"]').set '109'
    find('input[id="Descricao"]').set 'Teste automático - FaceAccess normal'
    find('input[id="enderecoIP"]').set '192.168.173.100'
    find('input[id="PortaServidor"]').set '8019'
    find('input[id="ChaveCriptografia"]').set '0000000000-0000000000-0000000000-0000000000'

    #Basico
    select('7', from: 'ConfiguracaoFace_SelectedVolume')

    #Log de Dados
    find('span[id="TabLog"]').click
    find('input[id="ConfiguracaoFace_AlertaLogSistema"]').set '13'
    find('input[id="ConfiguracaoFace_AlertaLogVerificacao"]').set '13'

    #Energia
    find('span[id="TabEnergia"]').click
    find('input[id="ConfiguracaoFace_TempoHibernacao"]').set '13'

    #Autenticação
    find('span[id="TabAutenticacao"]').click
    select('Face', from: 'ConfiguracaoFace_SelectedModo')
    find('input[id="ConfiguracaoFace_TempoReverificacao"]').set '13'

    #Segurança
    find('span[id="TabSeguranca"]').click
    find('input[id="ConfiguracaoFace_PinMaster"]').set 'teste'

    #Outros
    find('span[id="TabOutros"]').click
    select('UserPhoto', from: 'ConfiguracaoFace_SelectedModoCaptura')
    select('Wiegand34', from: 'ConfiguracaoFace_SelectedTipoLeitura')
    find('[for="checkAssistirInterferencia"]').click
    find('[for="checkLigarCameraLeds"]').click
    find('input[id="ConfiguracaoFace_TempoDesbloqueio"]').set '13'
    find('input[id="ConfiguracaoFace_TempoLimitePortaAberta"]').set '13'
    select('Normalmente Fechado', from: 'ConfiguracaoFace_SelectedTipoSensor')
    

    drop = find('input[type="submit"][value="Salvar"]', match: :first)
    drop.click
    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Configuração Relógio foi criada com sucesso'


    ##Configuração de relógio
    #Printpoint LI
    puts 'Cadastrando configuração de Printpoint LI'
    find('label[class="pointer"]', text: 'Adicionar').click
    find('label[for="radioModelo19"]').click
    fill_in 'Codigo', with: '110'
    fill_in 'Descricao', with: 'Teste automático - Printpoint li'

    #Dados empregador
    find('span[id="TabDadosEmpregador"]').click
    find('input[id="DadosEmpregador_CampoLinha1"]').set 'Teste automacao Razao relogio'
    find('input[id="DadosEmpregador_CampoLinha1Endereco"]').set 'Teste automacao endereco relogio'
    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click
  
    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Configuração Relógio foi criada com sucesso'

    ##Configuração de relógio
    ##Biolite NG
    puts 'Cadastrando configuração de Biolite NG'
    find('label[class="pointer"]', text: 'Adicionar').click
    find('label[for="radioModelo21"]').click
    fill_in 'Codigo', with: '111'
    fill_in 'Descricao', with: 'Teste automático - Biolite NG'
    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    ##Configuração de relógio
    ##Smart
    puts 'Cadastrando configuração de Smart'
    find('label[class="pointer"]', text: 'Adicionar').click
    find('label[for="radioModelo22"]').click
    
    find('input[id="Codigo"]').set '112'
    find('input[id="Descricao"]').set 'Teste automático - Smart'
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

    #v 2 de 5 Dimep
    find('div[id="DivMenuV2de5dimep"]').click
    find('[for="checkHabilitaV2de5dimep"]').click
    find('input[id="textboxDigitsV2de5dimepInformacao"]').set '1'
    find('input[id="textboxDigitsV2de5dimepIgnorar"]').set '2'
    find('input[id="textboxDigitsV2de5dimepChecagem"]').set '3'
    find('input[id="textboxDigitsV2de5dimepInformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsV2de5dimepNumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click

    #v 2 de 5 intercalado
    find('div[id="DivMenuV2de5intercalado"]').click
    find('[for="checkHabilitaV2de5intercalado"]').click
    find('input[id="textboxDigitsV2de5intercaladoInformacao"]').set '1'
    find('input[id="textboxDigitsV2de5intercaladoIgnorar"]').set '2'
    find('input[id="textboxDigitsV2de5intercaladoChecagem"]').set '3'
    find('input[id="textboxDigitsV2de5intercaladoInformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsV2de5intercaladoNumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click

    #Criptografia
    find('div[id="DivMenuCriptografia"]').click
    find('[for="radio8Digitos"]').click
    find('input[id="ConfiguracaoREP.Vetor1"]').set '1'
    find('input[id="ConfiguracaoREP.Verificador1"]').set '2'
    find('input[id="ConfiguracaoREP.Vetor2"]').set '3'
    find('input[id="ConfiguracaoREP.Verificador2"]').set '4'

    #v 3 de 9
    find('div[id="DivMenuV3de9"]').click
    find('[for="checkHabilitaV3de9"]').click
    find('input[id="textboxDigitsV3de9Informacao"]').set '1'
    find('input[id="textboxDigitsV3de9Ignorar"]').set '2'
    find('input[id="textboxDigitsV3de9Checagem"]').set '3'
    find('input[id="textboxDigitsV3de9InformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsV3de9NumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click

    #Magnético Dimep
    find('div[id="DivMenuMagneticoDimep"]').click
    find('[for="checkHabilitaMagnetico"]').click
    find('input[id="textboxDigitsMagneticoInformacao"]').set '1'
    find('input[id="textboxDigitsMagneticoIgnorar"]').set '2'
    find('input[id="textboxDigitsMagneticoChecagem"]').set '3'
    find('input[id="textboxDigitsMagneticoInformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsMagneticoNumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click
    find('[for="checkFormatoMagneticoEspecial1"]').click

    #ABA
    find('div[id="DivMenuAba"]').click
    find('[for="checkHabilitaABA"]').click
    find('input[id="textboxDigitsABAInformacao"]').set '1'
    find('input[id="textboxDigitsABAIgnorar"]').set '2'
    find('input[id="textboxDigitsABAChecagem"]').set '3'
    find('input[id="textboxDigitsABAInformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsABANumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click
    find('[for="checkFormatoABAEspecial1"]').click

    #Wiegand
    find('div[id="DivMenuWiegand"]').click
    find('[for="checkHabilitaWiegand"]').click
    find('input[id="textboxDigitsWiegandInformacao"]').set '1'
    find('input[id="textboxDigitsWiegandIgnorar"]').set '2'
    find('input[id="textboxDigitsWiegandChecagem"]').set '3'
    find('input[id="textboxDigitsWiegandInformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsWiegandNumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click
    
    #Wiegand 32
    find('div[id="DivMenuWiegand32"]').click
    find('[for="checkHabilitaWiegand32"]').click
    
    #Wiegand 34
    find('div[id="DivMenuWiegand34"]').click
    find('[for="checkHabilitaWiegand34"]').click
    find('input[id="textboxDigitsWiegand34Informacao"]').set '1'
    find('input[id="textboxDigitsWiegand34Ignorar"]').set '2'
    find('input[id="textboxDigitsWiegand34Checagem"]').set '3'
    find('input[id="textboxDigitsWiegand34InformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsWiegand34NumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click

    #Wiegand 35
    find('div[id="DivMenuWiegand35"]').click
    find('[for="checkHabilitaWiegand35"]').click
    find('input[id="textboxDigitsWiegand35Informacao"]').set '1'
    find('input[id="textboxDigitsWiegand35Ignorar"]').set '2'
    find('input[id="textboxDigitsWiegand35Checagem"]').set '3'
    find('input[id="textboxDigitsWiegand35InformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsWiegand35NumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click

    #Wiegand 37
    find('div[id="DivMenuWiegand37"]').click
    find('[for="checkHabilitaWiegand37"]').click
    find('input[id="textboxDigitsWiegand37Informacao"]').set '1'
    find('input[id="textboxDigitsWiegand37Ignorar"]').set '2'
    find('input[id="textboxDigitsWiegand37Checagem"]').set '3'
    find('input[id="textboxDigitsWiegand37InformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsWiegand37NumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    find('input[value="Limpar"]').click
    #find('[for="radioLeMatricula"]').click

    #Smart Card
    find('div[id="DivMenuSmartCard"]').click
    find('[for="checkHabilitaSmartCard"]').click
    find('input[id="textboxDigitsSmartCardInformacao"]').set '1'
    find('input[id="textboxDigitsSmartCardIgnorar"]').set '2'
    find('input[id="textboxDigitsSmartCardChecagem"]').set '3'
    find('input[id="textboxDigitsSmartCardInformacaoOpcional"]').set '4'
    find('input[id="textboxDigitsSmartCardNumeroDaVia"]').set '5'
    find('input[value="Informação com"]').click
    find('input[value="Ignorar Dígito com"]').click
    find('input[value="Checagem com"]').click
    find('input[value="Informação Opcional com"]').click
    find('input[value="Número da Via com"]').click
    #find('input[value="Limpar"]').click

    #Impressora
    find('span[id="TabImpressora"]').click
    find('[for="radioMedio"]').click
    find('[for="radioTotal"]').click
    find('input[id="ConfiguracaoREP_TamanhoBobina"]').set '100'

    #Dados empregador
    find('span[id="TabDadosEmpregador"]').click
    find('input[id="DadosEmpregador_CampoLinha1"]').set 'Teste automacao Razao relogio'
    find('input[id="DadosEmpregador_CampoLinha1Endereco"]').set 'Teste automacao endereco relogio'

    #Conexão do usuario
    find('span[id="TabConexaoCliente"]').click
    find('[for="checkHabilitaConexaoUsuario"]').click
    select('Client (HTTP REST)', from: 'TipoConexao')
    find('input[id="TempoConexao"]').set '69'
    find('input[id="TempoDesconexao"]').set '69'
    find('input[id="IdentificacaoEquipamento"]').set '69'
    find('[for="checkHabilitaDNS"]').click
    find('input[id="ServidorDNS"]').set '1.1.1.1'
    find('input[id="ServidorDNSSecundario"]').set '2.2.2.2'
    find('input[id="EnderecoDNS"]').set 'equipamentos@teste.com'
    find('input[id="Port"]').set '6969'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Configuração Relógio foi criada com sucesso'
    
    
    ##Configuração de relógio
    #HENRY
    puts 'Cadastrando configuração de Henry'
    find('label[class="pointer"]', text: 'Adicionar').click
    find('label[for="radioModelo23"]').click
    find('input[id="Codigo"]').set '113'
    find('input[id="Descricao"]').set 'Teste automático - Henry'
    find('label[for="LeitoresVerificamDigital"]', visible: false).set(true) 
    find('input[id="TamanhoBobinaHenry"]').set '50'
    #Dados empregador
    find('input[id="DadosEmpregador_CampoLinha1"]').set 'Teste automacao Razao relogio'
    find('input[id="DadosEmpregador_CampoLinha1Endereco"]').set 'Teste automacao endereco relogio'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Configuração Relógio foi criada com sucesso'


    ##Configuração de relógio
    #Control ID
    puts 'Cadastrando configuração de Henry'
    find('label[class="pointer"]', text: 'Adicionar').click
    find('label[for="radioModelo26"]').click
    find('input[id="Codigo"]').set '114'
    find('input[id="Descricao"]').set 'Teste automático - Control ID'
    find('label[for="LeitoresVerificamDigital"]', visible: false).set(true) 
    find('input[id="TamanhoBobinaControlID"]').set '50'
    #Dados empregador
    find('input[id="DadosEmpregador_CampoLinha1"]').set 'Teste automacao Razao relogio'
    find('input[id="DadosEmpregador_CampoLinha1Endereco"]').set 'Teste automacao endereco relogio'

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click

    expect(find('div[id=Summary-Field-Index]')).to have_content 'A Configuração Relógio foi criada com sucesso'
   
  end
end

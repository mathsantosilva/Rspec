describe 'importacao pessoas', :pessoas do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr08012021@dimep.com'
    fill_in 'LogOnModel_Password', with: 'dimep123'
    click_button 'Entrar'
    visit '/FormatosArquivoColetaApontamentos'
    visit '/FormatosArquivoColetaApontamentos/EditPessoa'
  end

  
  it 'CT001 inserir campos na importacao pessoas inclusao/alteracao', :ct001_inclusao_alteracao do

  end

  it 'CT002 validar a insercao dos campos obrigatorios na importacao pessoas inclusao/alteracao', :ct002_inclusao_alteracao do

    fill_in '', with: ''
    
    drop = find('', text: '')
    drop.click

    expect(find('')).to have_content ''

  end


  it 'CT001 inserir campos na importacao pessoas desligamentos', :ct001_desligamentos do

    visit '/FormatosArquivoColetaApontamentos'
    visit '/FormatosArquivoColetaApontamentos/EditPessoaDesligamentos'

  end

  it 'CT002 validar a insercao dos campos obrigatorios na importacao pessoas desligamentos', :ct002_desligamentos do


  end

  it 'CT001 inserir campos na importacao pessoas ferias', :ct001_ferias do

    visit '/FormatosArquivoColetaApontamentos'
    visit '/FormatosArquivoColetaApontamentos/EditPessoaFerias'

  end

  it 'CT002 validar a insercao dos campos obrigatorios na importacao pessoas ferias', :ct002_ferias do

  end

  it 'CT001 inserir campos na importacao pessoas afastamentos', :ct001_afastamentos do

    visit '/FormatosArquivoColetaApontamentos'
    visit '/FormatosArquivoColetaApontamentos/EditPessoaAfastamentos'

  end

  it 'CT002 validar a insercao dos campos obrigatorios na importacao pessoas ferias', :ct002_afastamentos do

  end
end


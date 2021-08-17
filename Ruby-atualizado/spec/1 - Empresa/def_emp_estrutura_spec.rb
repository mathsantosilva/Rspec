describe 'estrutura', :estrutura do
  # repete sempre a primeira instrucao antes de cada caso de teste
  before(:each) do
    visit 'http://qcdev.dimepkairos.com.br/admin/Account/LogOn?ReturnUrl=%2Fadmin%2FFormatosArquivoColetaApontamentos%2FEditUsuario'
    fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    visit '/admin/Estrutura'
  end

  it 'CT001 Inserir uma nova estrutura organizacional', :ct001_estrutura do
    fill_in 'ModelEstruturaOrganizacional_Descricao', with: 'Estrutura B'
    fill_in 'ModelEstruturaOrganizacional_Codigo', with: '1002'
    
    drop = find('.DivDescricaoEstrutura', text: 'Principal')
    drop.click

    drop = find('.pointer', text: 'Adicionar', match: :first)
    drop.click

    expect(find('form[id=FormEstruturas]')).to have_content 'A Estrutura Organizacional foi criada com sucesso'
  end

  it 'CT002 Validar insercao de campos obrigatórios no cadastro de estrutura', :ct002_estrutura do
    drop = find('.DivDescricaoEstrutura', text: 'Principal')
    drop.click

    drop = find('.pointer', text: 'Adicionar', match: :first)
    drop.click
    fill_in 'ModelEstruturaOrganizacional_Descricao', with: ''
    fill_in 'ModelEstruturaOrganizacional_Codigo', with: ''

    expect(find('span[data-valmsg-for="ModelEstruturaOrganizacional.Descricao"]')).to have_content 'Por favor adicione uma descrição'
    expect(find('span[data-valmsg-for="ModelEstruturaOrganizacional.Codigo"]')).to have_content 'Por favor adicione um código'
  end

  it 'CT003 Validar insercao de estrutura com codigo existente', :ct003_estrutura do
    drop = find('.DivDescricaoEstrutura', text: 'Principal')
    drop.click

    fill_in 'ModelEstruturaOrganizacional_Descricao', with: 'Estrutura B'
    fill_in 'ModelEstruturaOrganizacional_Codigo', with: '1001'
  
    drop = find('.pointer', text: 'Adicionar', match: :first)
    drop.click

    expect(find('form[id=FormEstruturas]')).to have_content 'Já existe uma Estrutura Organizacional com o código inserido'
  end

  it 'CT004 Validar insercao de estrutura com descricao existente', :ct004_estrutura do
    drop = find('.DivDescricaoEstrutura', text: 'Principal')
    drop.click

    fill_in 'ModelEstruturaOrganizacional_Descricao', with: 'Estrutura A'
    fill_in 'ModelEstruturaOrganizacional_Codigo', with: '1002'

    drop = find('.pointer', text: 'Adicionar', match: :first)
    drop.click

    expect(find('form[id=FormEstruturas]')).to have_content 'Já existe uma Estrutura Organizacional com essa descrição'

  end

  # it 'CT005 Validar insercao da remoção da estrutura', :ct005_estrutura do
  #   drop = find('.DivDescricaoEstrutura', text: 'Estrutura A')
  #   drop.click

  #  drop = (find('img[class=pointer icons deleteIcon]'))
  #  drop.click


  #   drop = find('#dialog-confirm-Estrutura', text: 'Remover', match: :first)
  #   drop.click

  #    expect(find('form[id=FormEstruturas]')).to have_content 'A Estrutura Organizacional foi removida com sucesso'
  # end
end

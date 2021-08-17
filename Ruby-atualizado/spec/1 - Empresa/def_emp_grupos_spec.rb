describe 'grupos', :grupos do
  before(:each) do
    visit '/Dimep/Account/LogOn?ReturnUrl=%2F'

    fill_in 'LogOnModel_UserName', with: 'sprintbr16042021@dimep.com'
    fill_in 'LogOnModel_Password', with: '1'
    click_button 'Entrar'
    visit '/admin/Grupos'
  end

  it 'CT001 Inserir uma nova estrutura organizacional', :ct001_grupos do
    fill_in 'Grupo_Codigo', with: '1231231'
    fill_in 'Grupo_Descricao', with: 'abca'

    drop = find('.pointer', text: 'Adicionar', match: :first) # precisa manter o match para identificar o botão
    drop.click

    expect(find('form[id=FormGrupos]')).to have_content 'O Grupo foi adicionado com sucesso'
    end

  it 'CT002 Validar inserção de campos obrigatórios no grupo empresa', :ct002_grupos do
    fill_in 'Grupo.Codigo', with: ''
    fill_in 'Grupo.Descricao', with: ''

    drop = find('.pointer', text: 'Adicionar', match: :first)
    drop.click

    expect(find('form[id=FormGrupos]')).to have_content 'Por favor adicione uma descrição'
    expect(find('form[id=FormGrupos]')).to have_content 'Por favor adicione um código'  
   end

  it 'CT003 Validar insercao de estrutura com código existente ', :ct003_grupos do
    fill_in 'Grupo.Codigo', with: '1231231'
    fill_in 'Grupo.Descricao', with: 'fsa62¨#&!'

    drop = find('.pointer', text: 'Adicionar', match: :first)
    drop.click

    expect(find('form[id=FormGrupos]')).to have_content 'Já existe um Grupo com o código inserido'
  end
end

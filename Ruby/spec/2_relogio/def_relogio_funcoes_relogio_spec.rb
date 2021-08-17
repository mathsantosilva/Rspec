;describe 'funcoes do relógio', :funcoes_relogio do
  before(:each) do
      visit '/Dimep/Account/LogOn?ReturnUrl=%2F'
      
    fill_in 'LogOnModel_UserName', with: 'sprintbr08012021@dimep.com'
    fill_in 'LogOnModel_Password', with: 'dimep123'
    click_button 'Entrar'
     
      visit '/admin/FuncaoRelogio'
      visit '/admin/FuncaoRelogio/Create'
  end

      it 'CT001 valida os campos obrigatórios das funções relógio', :ct001_funcoes do

      fill_in 'FuncaoRelogio_Codigo', with: '1110'
      fill_in 'FuncaoRelogio_Descricao', with: 'abczzz'

      drop = find("input[type=submit][value='Salvar']", match: :first)
      drop.click

      expect(find('div[id=Summary-Field-Index]')).to have_content 'A Função do Relógio foi criada com sucesso'
    end
    
  it 'CT002 validar inserção de campos obrigatórios no grupo existente', :ct002_funcoes do
   
    fill_in 'FuncaoRelogio_Codigo', with: ''
    fill_in 'FuncaoRelogio_Descricao', with: ''

    drop = find("input[type=submit][value='Salvar']", match: :first)
    drop.click
    
    expect(find("span[class=field-validation-error][data-valmsg-for='FuncaoRelogio.Codigo']")).to have_content 'O código tem de ser um número'
    expect(find("span[class=field-validation-error][data-valmsg-for='FuncaoRelogio.Descricao']")).to have_content 'Por favor adicione uma descrição'
    end

    it 'CT003  Validar a existência de itens nos campos no grupo existente', :ct003_funcoes do
   
      fill_in 'FuncaoRelogio_Codigo', with: '1110'
      fill_in 'FuncaoRelogio_Descricao', with: 'abczazz'

      drop = find("input[type=submit][value='Salvar']", match: :first)
      drop.click    
  
      expect(find('form[id=FormFuncaoRelogio]')).to have_content 'Já existe uma Função do Relógio com o código inserido'
   end
end
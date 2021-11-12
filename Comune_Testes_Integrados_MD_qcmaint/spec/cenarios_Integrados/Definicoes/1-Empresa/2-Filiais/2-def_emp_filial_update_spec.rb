require 'common\common'
common = Common.new

describe 'filial', :filial_update do
    before(:each) do
      visit '/'

      find('div[class="cc-compliance"]', text: 'Aceitar e fechar').click
      sleep 1
  
      # Acessando a empresa filial pela navegação de telas
      common.logon_br
  
      # Acessando o cadastro da empresa filial pela navegação de telas
      common.nav('Empresa','div[id="MenuFiliais"')

      common.remove_chat

      common.select_button('table[class="ContentTable"]', '/html/body/div[1]/div[3]/table/tbody/tr', 'img[class="pointer icons editIcon"]')

    end


    it 'Realizando a alteração da filial' do
        fill_in 'Filial_Codigo', with: $codigo_aleatorio
        fill_in 'Filial_Telefone', with: '888888888'
        fill_in 'Filial_Descricao', with: $nome_empresa_aleatoria
        fill_in 'Filial_CnpjCpf', with: $cnpj
        fill_in 'Filial_Endereco', with: $endereco_aleatorio
        fill_in 'Filial_Cidade', with: $cidade_aleatoria
        fill_in 'Filial_Bairro', with: 'Vila Nossa Senhora'
        fill_in 'Filial_UF', with: 'RJ'
        fill_in 'Filial_Pais', with: $pais_aleatorio
        fill_in 'Filial_URL', with: 'http://filialalterada.com.br'
        fill_in 'Filial_Email', with: $email_aleatorio
        select('UTC (GMT)', from: 'Filial_FusoHorario_Id').select_option
        #find('label[for="checkHabilitaHorarioVerao"]', visible: false).set(true)
        fill_in 'Filial.InicioHorarioVerao', with: '13102021'
        fill_in 'Filial_FimHorarioVerao', with: '13112021'
        fill_in 'Filial_DataPrevisaoProximoFechamento', with: '13042021'
        fill_in 'Filial_DataLimiteTratamentoPonto', with: '13052021'
        fill_in 'ConnectChave_ChaveConnect', with: $chave_aleatoria
    
        drop = find("input[type=submit][value='Salvar']", match: :first)
        drop.click
        sleep 2
    
        expect(find('div[class=validation-summary-ok]')).to have_content 'Filial editada com sucesso'
    
    end
    

end
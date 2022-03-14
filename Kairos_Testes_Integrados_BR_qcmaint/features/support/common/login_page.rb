class Login

    include Capybara::DSL
    include RSpec::Matchers 

        # prod
        $prod_br = "https://www.dimepkairos.com.br/"
        $prod_pt = "https://www.dimepkairos.pt/"
        $prod_mx = "https://www.dimepkairos.com.mx/"
        $prod_md = "https://www.mdcomune.com.br/"

        # qcmaint
        $qcmaint_br = "http://qcmaint.dimepkairos.com.br/"
        $qcmaint_pt = "https://qcmaint.dimepkairos.pt/"
        $qcmaint_mx = "https://qcmaint.dimepkairos.com.mx/"
        $qcmaint_md = "https://qcmaint.mdcomune.com.br/"

        # qcdev 
        $qcdev_br = "http://qcdev.dimepkairos.com.br/"
        $qcdev_pt = "https://qcdev.dimepkairos.pt/"
        $qcdev_mx = "https://qcdev.dimepkairos.com.mx/"
        $qcdev_md = "https://qcdev.mdcomune.com.br/"

        $user_ptbr = "teste185246@dimep.com.br"
        $user_es = "teste75624@dimep.com.mx"
        $user_ptpt = "teste75624@dimep.com.pt"
        $user_en = "teste75624@dimep.com.en"
        $senha = "1"



    def ambiente()
        print("\nProd: 1 / Qcmaint: 2 / Qcdev: 3\n")
        print("Escolha um ambiente: ")
        @@ambiente = $stdin.gets.strip
        projeto()
    end


    def projeto()
        case @@ambiente.to_i
        when 1
            print("\n| Mdcomune:  1 | \n| Kairos BR: 2 | \n| Kairos PT: 3 | \n| Kairos MX: 4 | \n| Retornar:  5 |\n")
            print("Escolha o Projeto: ")
            @projeto = $stdin.gets.strip
            if  @projeto.to_i == 1 
                $page = $prod_md
                $empresa = "Madis"
            elsif @projeto.to_i == 2 
                $page = $prod_br
                $empresa = "Dimep"
            elsif @projeto.to_i == 3 
                $page = $prod_pt
                $empresa = "Dimep"
            elsif @projeto.to_i == 4
                $page = $prod_mx
                $empresa = "Dimep"
            elsif @projeto.to_i == 5
                ambiente()
            else
                print("\nValor invalido, escolha novamente")
                print("\n")
                projeto()
            end
        when 2
            print("\n| Mdcomune:  1 | \n| Kairos BR: 2 | \n| Kairos PT: 3 | \n| Kairos MX: 4 | \n| Retornar:  5 |\n")
            print("Escolha o Projeto: ")
            @projeto = $stdin.gets.strip
            if @projeto.to_i == 1 
                $page = $qcmaint_md
                $empresa = "Madis"
            elsif @projeto.to_i == 2 
                $page = $qcmaint_br
                $empresa = "Dimep"
            elsif @projeto.to_i == 3 
                $page = $qcmaint_pt
                $empresa = "Dimep"
            elsif @projeto.to_i == 4
                $page = $qcmaint_mx
                $empresa = "Dimep"
            elsif @projeto.to_i == 5
                ambiente()
            else
                print("\nValor invalido, escolha novamente")
                print("\n")
                projeto()
            end
        when 3
            print("\n| Mdcomune:  1 | \n| Kairos BR: 2 | \n| Kairos PT: 3 | \n| Kairos MX: 4 | \n| Retornar:  5 |\n")
            print("Escolha o Projeto: ")
            @projeto = $stdin.gets.strip
            if @projeto.to_i == 1
                $page = $qcdev_md
                $empresa = "Madis"
                print("qcdev: " + $qcdev_md.to_s + " :")
            elsif @projeto.to_i == 2 
                $page = $qcdev_br
                $empresa = "Dimep"
            elsif @projeto.to_i == 3 
                $page = $qcdev_pt
                $empresa = "Dimep"
            elsif @projeto.to_i == 4
                $page = $qcdev_mx
                $empresa = "Dimep"
            elsif @projeto.to_i == 5
                ambiente()
            else
                print("\nValor invalido, escolha novamente")
                print("\n")
                projeto()
            end
        else
            print("\nValor invalido, escolha novamente")
            print("\n")
            ambiente()
        end
    end

    # def user()
    #     print("\nInsira o usuario: ")
    #     $user_br = $stdin.gets.strip
    #     print("Insira a senha: ")
    #     $senha = $stdin.gets.strip
    # end
    
    def base()
        ambiente()
        # user()
    end

    def logar(user, password)
        fill_in 'LogOnModel_UserName', with: user
        fill_in 'LogOnModel_Password', with: password
        find('button[id="btnFormLogin"]').click
    end


    #Realizando o login BR
    def logon_br()
        fill_in 'LogOnModel_UserName', with: $user_ptbr
        fill_in 'LogOnModel_Password', with: $senha
        find('button[id="btnFormLogin"]').click 
        # find('input[id="btnFormLogin"]').click
    end

    #Realizando o login mx
    def logon_mx()
        fill_in 'LogOnModel_UserName', with: $user_es
        fill_in 'LogOnModel_Password', with: $senha
        find('button[id="btnFormLogin"]').click
    end

    #Realizando o login pt
    def logon_pt()
        fill_in 'LogOnModel_UserName', with: $user_ptpt
        fill_in 'LogOnModel_Password', with: $senha
        find('button[id="btnFormLogin"]').click
    end

    #Realizando o login en
    def logon_en()
        fill_in 'LogOnModel_UserName', with: $user_en
        fill_in 'LogOnModel_Password', with: $senha
        find('button[id="btnFormLogin"]').click
    end
end
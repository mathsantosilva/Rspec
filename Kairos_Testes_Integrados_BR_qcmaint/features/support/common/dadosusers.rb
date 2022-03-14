class Dadosusers
    include Capybara::DSL
    include RSpec::Matchers 
    def urls()
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

    end

    def listauser()
        $user_ptbr = "automacao@dimep.com.br"
        $user_es = "teste75624@dimep.com.mx"
        $user_ptpt = "teste75624@dimep.com.pt"
        $user_en = "teste75624@dimep.com.en"
        $senha = "1"
    end
end
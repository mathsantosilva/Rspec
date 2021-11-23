Dado('que acesso a tela Click Simples') do
    @nav.tap_hamburger
    @nav.tap_by_text("BOTÕES")
    @nav.tap_by_text("CLIQUE SIMPLES")
  end
  
  Quando('faço um click Simples') do
    find_element(:id, "io.qaninja.android.twp:id/short_click").click
  end
  
  Então('devo ver o texto {string}') do |expect_text|
    expect(@toaster.toast.text).to eql expect_text
  end

  Dado ('que acesso a tela click Longo') do
    @nav.tap_hamburger
    @nav.tap_by_text("BOTÕES")
    @nav.tap_by_text("CLIQUE LONGO")
  end

  Quando ('faço um click Longooo') do
    @button = find_element(:id, "io.qaninja.android.twp:id/long_click")
    Appium::TouchAction.new.press(element: @button).wait(2000).release.perform
  end

  Então ('devo ver o votão com o texto: {string}') do |expect_text|
    expect(@button.text).to eql expect_text
  end
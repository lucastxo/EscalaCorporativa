require 'pry'
Dado("que eu esteja na tela de incluir regime") do
    RealizaLogin.escalaCorporativa()
    find('[class="main-menu-button workplan"]').click
end
  
Quando("eu preencho os campos de incluir regime com os seguintes dados:") do |table|
    @regime = table.rows_hash
    horas = @regime[:horas]
    tipo =  @regime[:tipo]
    find('#CodigoSelecaoInclusao').find(:option, @regime[:tipo]).select_option
    find('#QuantidadeHorasMinimaSemana').set horas
    find('#SalvarFolgaRegimeTrabalho').click
end
  
Então("a seguinte mensagem de incluir regime deve aparecer {string}") do |mensagem_alerta|
    expect(page).to have_css("[id$=Dialogo]", :text => mensagem_alerta, visible: true)
    mensagemExibida = find("[id$=Dialogo]", visible: true, match: :first).text # variavel que le o conteudo da mensagem do modal
    puts(mensagemExibida)
end

Então ("excluo o regime criado") do
    find('[class="btnFechar btn btn-success"]').click
    PreReq.excluirRegime()
end
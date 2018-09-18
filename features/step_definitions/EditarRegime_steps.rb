Dado("que eu esteja na tela de editar regime") do
    RealizaLogin.escalaCorporativa()
    find('[class="main-menu-button workplan"]').click
end
  
Quando("eu preencho os campos de Editar Regime com os seguintes dados:") do |table|
    @regime = table.rows_hash

    PreReq.criarRegime()
    find('[class="radioBtn radioPesquisar col-xs-6"]').click
    find('#CodigoSelecaoPesquisa').find(:option, @regime[:tipo]).select_option
    find('#Pesquisar').click
    find('[src$="editar.png"]', match: :first).click
    find('#EdicaoQuantidadeHorasMinimaSemana').set @regime[:horas]
    find('#SalvarEdicaoFolga').click
end
  
Então("a seguinte mensagem de Editar Regime deve aparecer {string}") do |mensagem_alerta|
    expect(page).to have_css("[id$=Dialogo]", :text => mensagem_alerta, visible: true)
    mensagemExibida = find("[id$=Dialogo]", visible: true, match: :first).text # variavel que le o conteudo da mensagem do modal
    puts(mensagemExibida)
end
  
Então("excluo o regime editado criada") do
    find('[class^="btnFechar btn"]', visible: true).click
    exists = page.has_css?('#EdicaoQuantidadeHorasMinimaSemana', visible: true)
    if exists == true 
        find('[class="btnCancelar buttonIcon btnG2Padrao push-right"]').click
    end
    PreReq.excluirRegime()
end
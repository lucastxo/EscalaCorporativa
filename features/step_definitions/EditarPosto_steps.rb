Dado("que eu esteja na tela de editar posto") do
    RealizaLogin.escalaCorporativa()
    find('[class$="escalad"]').click
    find('[class$=posto]').click
end
  
Quando("eu preencho os campos de Editar posto com os seguintes dados:") do |table|
    @posto = table.rows_hash
    PreReq.criarPosto()
    find('[class="radioBtn radioPesquisar col-xs-6"]').click

    if !@posto[:opm].to_s.empty?
        find('[id=PostoOpm]').find(:option, @posto[:opm]).select_option
    end
    find('[class="btnPesquisar buttonIcon btnG2Padrao push-right"]').click
    find('[src$="editar.png"]', match: :first).click
    find('[class="modal dialogEditarPosto in"]').find('[id=PostoDescricao]').set @posto[:descricao]
    find('[class="btnSalvar buttonIcon btnG2Padrao push-right"]').click
end
  
Então("a seguinte mensagem de Editar posto deve aparecer {string}") do |mensagem_alerta|
    expect(page).to have_css("[id$=Dialogo]", :text => mensagem_alerta, visible: true)
    mensagemExibida = find("[id$=Dialogo]", visible: true, match: :first).text # variavel que le o conteudo da mensagem do modal
    puts(mensagemExibida)
end
  
Então("excluo o posto editado criado") do
    find('[class^="btnFechar btn"]', visible: true).click
    exists = page.has_css?('[class="modal dialogEditarPosto in"]', visible: true)
    if exists == true 
        find('[class="modal dialogEditarPosto in"]').find('[class="btnCancelar buttonIcon btnG2Padrao push-right"]').click
    end
    PreReq.excluirPosto()
end
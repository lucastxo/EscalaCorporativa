Dado("que eu esteja na tela de editar feriado") do
    RealizaLogin.escalaCorporativa()
    find('[class="main-menu-button holiday"]').click
end
  
Quando("eu preencho os campos de Editar feriado com os seguintes dados:") do |table|
    @feriado = table.rows_hash
    PreReq.criarFeriado()

    find('[src$="editar.png"]', match: :first).click
    find('[id=contentInformacoes]').find('[id=DescricaoFeriado]').set @feriado[:descricao]
    find('[class="btnSalvar buttonIcon btnG2Padrao push-right"]').click
end
  
Então("a seguinte mensagem de Editar feriado deve aparecer {string}") do |mensagem_alerta|
    expect(page).to have_css("[id$=Dialogo]", :text => mensagem_alerta, visible: true)
    mensagemExibida = find("[id$=Dialogo]", visible: true, match: :first).text # variavel que le o conteudo da mensagem do modal
    puts(mensagemExibida)
end
  
Então("excluo o feriado editado criado") do
    find('[class^="btnFechar btn"]', visible: true).click
    exists = page.has_css?('[id=contentInformacoes]', visible: true)
    if exists == true 
        find('[id=contentInformacoes]').find('[class="btnCancelar buttonIcon btnG2Padrao push-right"]').click
    end
    PreReq.excluirFeriado()
end
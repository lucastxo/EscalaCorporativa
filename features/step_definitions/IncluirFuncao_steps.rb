Dado("que eu esteja na tela de incluir funcao") do
    RealizaLogin.escalaCorporativa()
    find('[class="main-menu-button missao"]').click
end
  
Quando("eu preencho os campos de incluir funcao com os seguintes dados:") do |table|
    @funcao = table.rows_hash
    find('[id=DescricaoMissao]').set @funcao[:funcao]
    find('[class^="btnSalvarCadastro"]').click
end
  
Então("a seguinte mensagem de incluir funcao deve aparecer {string}") do |mensagem_alerta|
    expect(page).to have_css("[id$=Dialogo]", :text => mensagem_alerta, visible: true)
    mensagemExibida = find("[id$=Dialogo]", visible: true, match: :first).text # variavel que le o conteudo da mensagem do modal
    puts(mensagemExibida)
end
  
Então("excluo a funcao criada") do
    find('[class="btnFechar btn btn-success"]').click
    PreReq.excluirFuncao()
end
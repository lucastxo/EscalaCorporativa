Dado("que eu esteja na tela de incluir posto") do
    RealizaLogin.escalaCorporativa()
    find('[class$="escalad"]').click
    find('[class$=posto]').click
end
  
Quando("eu preencho os campos de Incluir posto com os seguintes dados:") do |table|
    @posto = table.rows_hash
    if @posto[:opm].to_s.empty?
        find('[id=PostoOpm]').find(:option, @posto[:opm]).select_option
    end
    fill_in('PostoDescricao', :with => @posto[:descricao])
    find('[class^="btnSalvarCadastro"]').click

    exists = page.has_css?('[class$="btnSimConfirma"]', visible: true)
    if exists == true
        find('[class$="btnSimConfirma"]').click
    end
    
end
  
Então("a seguinte mensagem de Incluir posto deve aparecer {string}") do |mensagem_alerta|
    expect(page).to have_css("[id$=Dialogo]", :text => mensagem_alerta, visible: true)
    mensagemExibida = find("[id$=Dialogo]", visible: true, match: :first).text # variavel que le o conteudo da mensagem do modal
    puts(mensagemExibida)
end
  
Então("excluo o posto criado") do
    find('[class="btnFechar btn btn-success"]').click
    PreReq.excluirPosto()
end
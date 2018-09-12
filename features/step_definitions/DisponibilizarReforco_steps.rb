Dado("que eu esteja na tela de Disponibilizar Reforco") do
    RealizaLogin.escalaCorporativa()
    find('[class$="dispreforco"]').click
end
  
Quando("eu preencho os campos de Disponibilizar Reforco com os seguintes dados:") do |table|
    @reforco = table.rows_hash
    
    find('[id=CodigoOpmPesquisa]').find(:option, @reforco[:origem]).select_option
    if !@reforco[:destino].to_s.empty?
        find('[id=OpmDestinoSelecionada]').set @reforco[:destino]
        find('[id=ui-id-1]').find('[class=ui-corner-all]', :text => @reforco[:destino], match: :first).click
    end
    
    if @reforco[:data] == 'valida'
        t = Time.now
        t = t.strftime '%d%m%Y'
        find('#DataAte').set '00/00/0000'
        find('#DataAte').set t
    end
    find('[id=OpmDestinoSelecionada]').click
    find('[class^="btnConfirmar"]').click
    exists = page.has_css?('[class$=checkVerTodos]')
    if exists == true
        find('[class$=checkVerTodos]').click
        find('[class=btnPesquisar]').click
        if !@reforco[:PM].to_s.empty?
            find('[class="dualListBox-source col-xs-12"]').find(:option, @reforco[:PM]).select_option
            find('[class$="dualListBox-add"]').click
        end
        find('[class^="btnSalvarCadastro"]').click
    end
end
  
Então("a seguinte mensagem de Disponibilizar Reforco deve aparecer {string}") do |mensagem_alerta|
    expect(page).to have_css("[id$=Dialogo]", :text => mensagem_alerta, visible: true)
    mensagemExibida = find("[id$=Dialogo]", visible: true, match: :first).text # variavel que le o conteudo da mensagem do modal
    puts(mensagemExibida)
end
  
Então("excluo a disponibilizacao criada") do
    find('[class="btnFechar btn btn-success"]').click
    PreReq.excluirReforco()
end
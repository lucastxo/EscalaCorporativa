require 'pry'
Dado("que eu esteja na tela de escala efetiva") do
    RealizaLogin.escalaCorporativa()
    find('[class$="escalad"]').click
end
  
Quando("eu preencho os campos de criar escala efetiva com os seguintes dados:") do |table|
    @escala = table.rows_hash
    find('[class$=icone-efetivo]').click
    if !@escala[:opm].to_s.empty?
        find('[id=CodigoOpmSelecionada]', match: :first).find(:option, @escala[:opm]).select_option
        sleep(2)
    end
    if !@escala[:horario].to_s.empty?
        find('[class$="horario-escala-diaria"]', match: :first).find(:option, @escala[:horario]).select_option
        sleep(2)
    end
    if !@escala[:posto].to_s.empty?
        find('[class$="posto-escala-diaria"]', match: :first).find(:option, @escala[:posto]).select_option
    end
    find('[class^=btnConfirmar]').click
    exists = page.has_css?('[id=visualizar-filtroPesquisa]')
    if exists == true
        find('[id=visualizar-filtroPesquisa]').click
        find('[class=btnPesquisar]').click
        find('[class="dualListBox-source col-xs-12"]').find(:option, @escala[:pm]).select_option
        find('[class$="dualListBox-add"]').click
        find('[class^="btnSalvarCadastro"]').click
        if !@escala[:funcao].to_s.empty?
            find('[id=CodigoFuncao]').find(:option, @escala[:funcao]).select_option
        end
        find('[id=CodigoViatura]').find(:option, @escala[:viatura], match: :first).select_option
        find('[id=CodigoTipoPoliciamento]').find(:option, @escala[:policiamento]).select_option
        find('[id=btnAAZ]').click
    end

end
  
Então("a seguinte mensagem de Escala efetiva deve aparecer {string}") do |mensagem_alerta|
    expect(page).to have_css("[id$=Dialogo]", :text => mensagem_alerta, visible: true)
    mensagemExibida = find("[id$=Dialogo]", visible: true, match: :first).text # variavel que le o conteudo da mensagem do modal
    puts(mensagemExibida)
end
  
Então("excluo a Escala efetiva criada") do
    find('[class="btnFechar btn btn-success"]').click
    find('[class="radioBtn radioPesquisar col-xs-6"]').click
    find('[id=CodigoOpmSelecionada]').find(:option, 'C Tel Div Telef Som').select_option
    find('[class$=horario-escala-diaria]').find(:option, 'teste (Administrativo)').select_option
    find('[class^="btnPesquisar"]').click
    find('[src$="deslocar.png"]', match: :first).click
    find('[class$="btnSimConfirma"]').click
    find('[class="btnFechar btn btn-danger"]').click
end
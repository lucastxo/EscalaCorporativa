require 'pry'
Dado("que eu esteja na tela de incluir feriado") do
    RealizaLogin.escalaCorporativa()
    find('[class="main-menu-button holiday"]').click
end
  
Quando("eu preencho os campos de incluir feriado com os seguintes dados:") do |table|
    @feriado = table.rows_hash
    if @feriado[:data] == 'valida'
        t = Time.now
        t = t+ 100000099
        t = t.strftime '%d%m%Y'
        find('#DataFeriado').set '00/00/0000'
        find('#DataFeriado').set t
    end
    find('#DescricaoFeriado').set @feriado[:descricao]

    if !@feriado[:abrangencia].to_s.empty?
        find('#AbrangenciaFeriado').find(:option, @feriado[:abrangencia]).select_option
    end
    if @feriado[:tipo] == 'Data Móvel'
        find('#DescricaoFeriado').click
        find('[class*="radioBtn col-xs-3"]').click
    end
    find('[class$="checkMeioPeriodo"]').click
    find('#HoraInicialFerido').set @feriado[:entrada].to_s
    find('#HoraFimFeriado').set @feriado[:horaSaida].to_s
    find('#DescricaoFeriado').click
    find('[class^="btnSalvarCadastro"]').click
end
  
Então("a seguinte mensagem de incluir feriado deve aparecer {string}") do |mensagem_alerta|
    expect(page).to have_css("[id$=Dialogo]", :text => mensagem_alerta, visible: true)
    mensagemExibida = find("[id$=Dialogo]", visible: true, match: :first).text # variavel que le o conteudo da mensagem do modal
    puts(mensagemExibida)
end
  
Então("excluo o feriado criado") do
    find('[class="btnFechar btn btn-success"]').click
    PreReq.excluirFeriado()
end
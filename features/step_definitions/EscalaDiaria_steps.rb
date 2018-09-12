Dado("que eu esteja na tela de escala diaria") do
    RealizaLogin.escalaCorporativa()
    find('[class$="escalad"]').click
end
  
Quando("eu preencho os campos de criar escala diaria com os seguintes dados:") do |table|
    @escala = table.rows_hash
    find('[class$=icone-horario]').click

    if !@escala[:opm].to_s.empty?
        find('[id=CodigoOPMHorarioEquipe]', match: :first).find(:option, @escala[:opm]).select_option
    end
    if !@escala[:regime].to_s.empty?
        find('[id=CodigoRegimeTrabalhoHorarioEquipe]', match: :first).find(:option, @escala[:regime]).select_option
    end
    find('#idNomeHorarioEquipeFolga').set @escala[:descricao]
    if !@escala[:horaEntrada].to_s.empty? 
        find('#idHoraInicialHorarioEquipeFolga').set @escala[:horaEntrada]
    end
    if !@escala[:horaSaida].to_s.empty?
        find('#idHoraTerminoHorarioEquipeFolga').set @escala[:horaSaida]
    end
    if !@escala[:folga].to_s.empty?
        find('[id=idPrimeiraFolgaHorarioEquipeFolga]').find(:option, @escala[:folga]).select_option
    end
    find('#SalvarHorarioEquipeFolga').click
end
  
Então("a seguinte mensagem de Escala Diaria deve aparecer {string}") do |mensagem_alerta|
    expect(page).to have_css("[id$=Dialogo]", :text => mensagem_alerta, visible: true)
    mensagemExibida = find("[id$=Dialogo]", visible: true, match: :first).text # variavel que le o conteudo da mensagem do modal
    puts(mensagemExibida)
end
  
Então("excluo a Escala Diaria criada") do
    find('[class="btnFechar btn btn-success"]').click
    PreReq.excluirEscalaDiaria()
end
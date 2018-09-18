class PreReq
	def PreReq.excluirRegime()
        find('[src$="excluir.png"]', match: :first).click
        find('[class$="btnSimConfirma"]').click
        find('[class="btnFechar btn btn-success"]').click
    end

    def PreReq.excluirFeriado()
        find('[src$="excluir.png"]', match: :first).click
        find('[class$="btnSimConfirma"]').click
        find('[class="btnFechar btn btn-success"]').click
    end

    def PreReq.excluirFuncao()
        find('[src$="excluir.png"]', match: :first).click
        find('[class$="btnSimConfirma"]').click
        find('[class="btnFechar btn btn-success"]').click
    end

    def PreReq.excluirReforco()
        find('[class="radioBtn radioPesquisar col-xs-6"]').click
        find('[id=CodigoOpmPesquisa]').find(:option, 'C Tel Div Adm Fin').select_option
        find('[class^="btnPesquisar"]').click
        find('[class="campoExcluir"]', match: :first).click
        find('[class$="btnSimConfirma"]').click
        find('[class="btnFechar btn btn-success"]').click
        find('[class="btnFechar btn btn-danger"]').click
    end

    def PreReq.excluirEscalaDiaria()
        find('[class="radioBtn radioPesquisar col-xs-6"]').click
        find('[id=CodigoOPMHorarioEquipePesquisa]').find(:option, 'C Tel Div Adm Fin').select_option
        find('[id=CodigoRegimeTrabalhoHorarioEquipe]').find(:option, '5x2').select_option
        find('#PesquisarHorario').click
        find('[src$="excluir.png"]', match: :first).click
        find('[class$="btnSimConfirma"]').click
        find('[class="btnFechar btn btn-success"]').click
    end

    def PreReq.excluirPosto()
        find('[src$="excluir.png"]', match: :first).click
        find('[class$="btnSimConfirma"]').click
        find('[class="btnFechar btn btn-success"]').click
    end

    def PreReq.criarRegime()
        find('#CodigoSelecaoInclusao').find(:option, '5x2').select_option
        find('#QuantidadeHorasMinimaSemana').set '90'
        find('#SalvarFolgaRegimeTrabalho').click
        find('[class="btnFechar btn btn-success"]').click
    end

    def PreReq.criarFeriado()
        t = Time.now
        t = t+ 100050000
        t = t.strftime '%d%m%Y'
        find('#DataFeriado').set '00/00/0000'
        find('#DataFeriado').set t
        find('#DescricaoFeriado').set 'Teste Feriado'
        find('#AbrangenciaFeriado').find(:option, 'Nacional').select_option
        find('#DescricaoFeriado').click
        find('[class*="radioBtn col-xs-3"]').click
        find('#DescricaoFeriado').click
        find('[class^="btnSalvarCadastro"]').click
        find('[class="btnFechar btn btn-success"]').click
    end
end
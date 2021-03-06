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
end
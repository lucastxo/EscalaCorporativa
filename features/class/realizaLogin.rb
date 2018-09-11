class RealizaLogin
	def RealizaLogin.escalaCorporativa()
		#visit('http://vmwsiades12.cmdo.policiamilitar.sp.gov.br/Pmesp.CanalImprensaHom/Index/Index?7PeCnlRMyoIXbl6NOLFbD9x61HkrTEXZ')
		visit('http://vmwsisdes01.cmdo.policiamilitar.sp.gov.br/MS/login.aspx')
		find('#vUSRNUMCPFAUX').set '28019289844'
		find('#vSENHA').set '123456'
		find('[name="BTN_LOGIN"]').click
		sleep(3)
		page.driver.browser.close
		page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
		find('[class="ThemeClassicMainFolderText"]', text: 'ESCALA CORPORATIVA').click
		find('#cmSubMenuID47').find('[class="ThemeClassicMenuFolderText"]', text: 'Consulta').click
		find('#cmSubMenuID48').find('[class="ThemeClassicMenuItemText"]', text: 'Minha Escala').click
		sleep(2)
		page.driver.browser.close
		page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
		Capybara.page.driver.browser.manage.window.maximize
		find('[onclick*="RetornoTelaInicial"]').click
	end
end
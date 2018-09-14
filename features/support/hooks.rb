
Before do
    browser = Capybara.current_session.driver.browser
    browser.manage.delete_all_cookies    
end
module LogInHelper

    def log_in
      visit '/'
      fill_in 'user_email', with: 'ruby@rails.com'
      fill_in 'user_password', with: 'Password'
      click_button 'Log in'
    end
  
  end
module SessionHelpers
  def sign_up(email='joeb@test.com')
    visit '/'
    log_out
    click_link 'Sign up'
    fill_in 'user_email', with: email
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
  end

  def log_in(email='joeb@test.com')
    visit '/'
    log_out
    click_link 'Log in'
    fill_in 'user_email', with: email
    fill_in 'user_password', with: 'password'
    click_button 'Log in'
  end

  def log_out
    if page.has_link? 'Log out'
      click_link 'Log out'
    end
  end
end
